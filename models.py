import logging
from google.appengine.ext import ndb
from protorpc import messages
from protorpc import message_types
from google.appengine.ext.ndb import msgprop
from google.appengine.api.images import get_serving_url
import datetime


__author__ = 'robertking'


class FlagListRequestMessage(messages.Message):
    class Order(messages.Enum):
        up_votes = 1
        down_votes = 2
        newest = 3
        oldest = 4

    max_results = messages.IntegerField(1, default=100)
    sort_order = messages.EnumField(Order, 2, default=Order.newest)


class FlagMessage(messages.Message):
    img_link = messages.StringField(1, required=True)
    author_name = messages.StringField(2, required=True)
    author_links = messages.StringField(3, repeated=True)
    author_g_plus = messages.StringField(4)
    author_fb = messages.StringField(5)
    author_twitter = messages.StringField(6)
    author_location = messages.StringField(7)
    up_votes = messages.IntegerField(8, default=0)
    down_votes = messages.IntegerField(9, default=0)
    datetime = message_types.DateTimeField(10)


class FlagListMessage(messages.Message):
    items = messages.MessageField(FlagMessage, 1, repeated=True)


class Flag(ndb.Model):
    img_blob_key = ndb.BlobKeyProperty(required=True)
    datetime = ndb.DateTimeProperty(auto_now_add=True)
    flag_message = msgprop.MessageProperty(FlagMessage, required=True, indexed_fields=['up_votes', 'down_votes'])

    @classmethod
    def flag_list(cls, flag_list_request):
        Order = FlagListRequestMessage.Order
        order_map = {
            Order.up_votes: cls.flag_message.up_votes,
            Order.down_votes: cls.flag_message.down_votes,
            Order.newest: -cls.datetime,
            Order.oldest: cls.datetime
        }
        ord = order_map[flag_list_request.sort_order]
        print ord, flag_list_request.sort_order
        q = cls.query().order(ord).fetch(min(flag_list_request.max_results, 500))
        return cls._to_messages(q)

    @classmethod
    def _to_messages(cls, query):
        return FlagListMessage(items=[flag.flag_message for flag in query])

    @classmethod
    def make_flag(cls, blob_info, data):
        """
        returns: flag key
        raises: ValidationError
        """
        logging.info('creating img_link')
        try:
            img_link = get_serving_url(blob_info.key()) #hopefully this will error if blob isn't an image.
        except Exception:
            raise messages.ValidationError("invalid image?")

        logging.info('img_link created.. creating flag message..')
        flag_message = FlagMessage(
            img_link=img_link,
            author_name=data.get('author_name'),
            author_links=[data.get('author_links')] if data.get('author_links') else [],
            author_g_plus=data.get('author_g_plus'),
            author_fb=data.get('author_fb'),
            author_twitter=data.get('author_twitter'),
            author_location=data.get('author_location'),
            up_votes=0,
            down_votes=0,
            datetime=datetime.datetime.now()
        )
        logging.info('created flag message, creating flag')
        flag_key=Flag(
            img_blob_key=blob_info.key(),
            flag_message=flag_message
        ).put()
        return flag_key