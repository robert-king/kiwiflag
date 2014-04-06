#!/usr/bin/env python
import logging

import webapp2
from google.appengine.api.images import get_serving_url
from google.appengine.ext.webapp import blobstore_handlers

from models import Flag


class UploadHandler(blobstore_handlers.BlobstoreUploadHandler):
    def post(self):
        upload_files = self.get_uploads('file')  # 'file' is file upload field in the form
        blob_info = upload_files[0]
        logging.info('creating link')
        link = get_serving_url(blob_info.key()) #hopefully this will error if blob isn't an image.
        logging.info('link created.. creating flag..')
        flag_key = Flag(link=link).put() #TODO: also store the blobkey in case we need it
        logging.info('flag created..')
        self.redirect('/kiwiflag/web/index.html#/flag-viewer/%s' % flag_key.urlsafe())


class RedirectToTestApp(webapp2.RequestHandler):
    def get(self):
        self.redirect('/kiwiflag/web/index.html')
        #self.response.write('use chromium and go to     /kiwiflag/web/index.html')


app = webapp2.WSGIApplication([
                                  ('/upload-flag', UploadHandler),
                                  ('.*', RedirectToTestApp)
                              ],
                              debug=True
)
