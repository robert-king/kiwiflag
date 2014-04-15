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
from models import FlagVoteMessage
from models import FlagMessage
from models import FlagListMessage
from models import FlagListRequestMessage


an_api = endpoints.api(name='flags',
                       version='v1',
                       allowed_client_ids=['394062384276-9qour2katafat0u9064b3a1gsrdbspm9.apps.googleusercontent.com',
                                           endpoints.API_EXPLORER_CLIENT_ID]
)


class StringMessage(messages.Message):
    s = messages.StringField(1)


@an_api.api_class()
class FlagsApi(remote.Service):
    @endpoints.method(FlagListRequestMessage, FlagListMessage, http_method='GET')
    def flags(self, request):
        return Flag.flag_list(request)

    @endpoints.method(StringMessage, FlagMessage, http_method='GET')
    def flag(self, request):
        return Flag.get_flag(urlsafe=request.s).flag_message

    @endpoints.method(StringMessage, message_types.VoidMessage, http_method='DELETE')
    def delete_flag(self, request):
        Flag.delete_flag(request.s)
        return message_types.VoidMessage()

    @endpoints.method(FlagVoteMessage, message_types.VoidMessage, http_method='GET')
    def vote(self, request):
        #TODO: MAke this POST not GET.
        Flag.vote(request)
        return message_types.VoidMessage()

    @endpoints.method(message_types.VoidMessage, StringMessage, http_method='GET')
    def upload_url(self, unused_request):
        url = create_upload_url('/upload-flag',
                      max_bytes_per_blob=None,
                      max_bytes_total=None,
                      rpc=None,
                      gs_bucket_name=None)
        return StringMessage(s=url)

APPLICATION = endpoints.api_server([FlagsApi]) #can add upload API.