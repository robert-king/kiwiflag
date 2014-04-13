import logging
from google.appengine.ext import ndb
from google.appengine.ext.ndb import msgprop

import endpoints
from protorpc import messages
from protorpc import message_types
from protorpc import remote
from google.appengine.ext.blobstore.blobstore import create_upload_url
from google.appengine.api import users
from models import Flag
from models import FlagMessage


an_api = endpoints.api(name='kiwiflag',
                       version='v1',
                       allowed_client_ids=['394062384276-9qour2katafat0u9064b3a1gsrdbspm9.apps.googleusercontent.com',
                                           endpoints.API_EXPLORER_CLIENT_ID]
)


class StringMessage(messages.Message):
    s = messages.StringField(1)


@an_api.api_class(resource_name='flags-api', path="flag-sapi")
class FlagsApi(remote.Service):
    @endpoints.method(message_types.VoidMessage, StringMessage,
                      path='flags-list', http_method='GET',
                      name='flags-list')
    def flags_list(self, unused_request):
        #should do pagination etc.
        return StringMessage(s="hi")

    @endpoints.method(StringMessage, FlagMessage,
                      path='flag', http_method='GET',
                      name='flag')
    def flag(self, urlsafe_flagkey):
        flag = ndb.Key(urlsafe=urlsafe_flagkey.s).get()
        return flag.flag_message

    @endpoints.method(message_types.VoidMessage, StringMessage,
                      path='upload-url', http_method='GET',
                      name='upload-url')
    def upload_url(self, unused_request):
        #where flags are uploaded to.
        url = create_upload_url('/upload-flag',
                      max_bytes_per_blob=None,
                      max_bytes_total=None,
                      rpc=None,
                      gs_bucket_name=None)
        return StringMessage(s=url)


APPLICATION = endpoints.api_server([FlagsApi]) #can add upload API.