#!/usr/bin/env python
import logging
import webapp2
from google.appengine.ext.webapp import blobstore_handlers
from protorpc import messages
from models import Flag


class UploadHandler(blobstore_handlers.BlobstoreUploadHandler):
    def post(self):
        upload_files = self.get_uploads('file')  # 'file' is file upload field in the form
        try:
            blob_info = upload_files[0]
        except IndexError:
            return self.response.write('Error: No flag images selected or uploaded')

        flag_message_fields = ['author_name', 'author_links', 'author_g_plus', 'author_fb', 'author_twitter', 'author_location']
        data = {k: self.request.get(k) for k in flag_message_fields}
        try:
            flag_key = Flag.make_flag(blob_info, data)
        except messages.ValidationError:
            logging.error('invalid flag')
            logging.info(data)
            self.response.write('invalid flag')
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
