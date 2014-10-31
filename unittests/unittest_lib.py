import unittest
from google.appengine.ext import testbed
from google.appengine.datastore import datastore_stub_util
from google.appengine.api.blobstore import blobstore_stub, file_blob_storage
from google.appengine.api.files import file_service_stub
from google.appengine.ext.blobstore import BlobInfo


class TestbedWithFiles(testbed.Testbed):
    def init_blobstore_stub(self):
        blob_storage = file_blob_storage.FileBlobStorage('/tmp/testbed.blobstore',
                                                testbed.DEFAULT_APP_ID)
        blob_stub = blobstore_stub.BlobstoreServiceStub(blob_storage)
        file_stub = file_service_stub.FileServiceStub(blob_storage)
        self._register_stub('blobstore', blob_stub)
        self._register_stub('file', file_stub)


class UnitTestCase(unittest.TestCase):
    def setUp(self):
        self.testbed = TestbedWithFiles()
        self.testbed.activate()
        self.policy = datastore_stub_util.PseudoRandomHRConsistencyPolicy(probability=1)
        self.testbed.init_datastore_v3_stub(consistency_policy=self.policy)
        self.testbed.init_memcache_stub()
        self.testbed.init_blobstore_stub()
        self.testbed.init_mail_stub()
        self.testbed.init_taskqueue_stub()
        self.testbed.init_images_stub()
        self.mail_stub = self.testbed.get_stub(testbed.MAIL_SERVICE_NAME)
        self.taskqueue_stub = self.testbed.get_stub(testbed.TASKQUEUE_SERVICE_NAME)

    def tearDown(self):
        self.testbed.deactivate()

    def get_blob_key(self):
        from google.appengine.api import files
        blob_filename = files.blobstore.create(mime_type='text/plain')
        with files.open(blob_filename, 'a') as googfile:
            googfile.write("Test data")

        files.finalize(blob_filename)
        blob_key = files.blobstore.get_blob_key(blob_filename)
        return blob_key

    def get_blob_info(self):
        return BlobInfo(self.get_blob_key())


