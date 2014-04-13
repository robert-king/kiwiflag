import logging
from google.appengine.ext import ndb
from protorpc import messages
from google.appengine.ext.ndb import msgprop
from google.appengine.api.images import get_serving_url

__author__ = 'robertking'


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


class Flag(ndb.Model):
    img_blob_key = ndb.BlobKeyProperty(required=True)
    flag_message = msgprop.MessageProperty(FlagMessage)

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
            author_links=[data.get('author_links')] if req.get('author_links') else [],
            author_g_plus=data.get('author_g_plus'),
            author_fb=data.get('author_fb'),
            author_twitter=data.get('author_twitter'),
            author_location=data.get('author_location'),
            up_votes=0,
            down_votes=0
        )
        logging.info('created flag message, creating flag')
        flag_key=Flag(
            img_blob_key=blob_info.key(),
            flag_message=flag_message
        ).put()
        return flag_key