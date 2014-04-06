from google.appengine.ext import ndb

__author__ = 'robertking'


class Flag(ndb.Model):
    link = ndb.StringProperty(required=True)