import logging
from google.appengine.ext import ndb
from google.appengine.ext.ndb import msgprop

import endpoints
from protorpc import messages
from protorpc import message_types
from protorpc import remote

from google.appengine.api import users


an_api = endpoints.api(name='kiwiflag',
                       version='v1',
                       allowed_client_ids=['394062384276-9qour2katafat0u9064b3a1gsrdbspm9.apps.googleusercontent.com',
                                           endpoints.API_EXPLORER_CLIENT_ID]
)


class FlagMessage(messages.Message):
    name = messages.StringField(1)


@an_api.api_class(resource_name='flags-api', path="flag-sapi")
class FlagsApi(remote.Service):
    @endpoints.method(message_types.VoidMessage, FlagMessage,
                      path='flags-list', http_method='GET',
                      name='flags-list')
    def flags_list(self, unused_request):
        #should do pagination etc.
        return FlagMessage(name="hi")


APPLICATION = endpoints.api_server([FlagsApi]) #can add upload API.