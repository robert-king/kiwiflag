from google.appengine.datastore import datastore_stub_util
from google.appengine.ext import testbed
import webtest
import unittest
from main import app
from upload_university import load_uni_from_csv_string

fake_csv_string = """Country,,University,Faculty,Department,Stage,Course Code,ID,Course Title,Course Description,Course Link
New Zealand,,University of Auckland,Faculty of Science,Biological Sciences,Stage 1,BIOSCI 101,103,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Science,Biological Sciences,Stage 1,BIOSCI 100,104,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Science,Biological Sciences,Stage 1,BIOSCI 102,114,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Science,Biological Sciences,Stage 1,BIOSCI 103,115,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Science,Biological Sciences,Stage 1,BIOSCI 104,116,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Science,Biological Sciences,Stage 1,BIOSCI 106,118,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Science,Biological Sciences,Postgraduate,BIOSCI 701,175,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Science,Biological Sciences,Postgraduate,BIOSCI 703,176,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Science,Biological Sciences,Postgraduate,BIOSCI 702,178,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Arts,European Languages and Literature,Stage 2,SPANISH 202,3109,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Arts,European Languages and Literature,Stage 2,SPANISH 205,3111,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Arts,European Languages and Literature,Stage 2,SPANISH 215,3113,ct,cd,cl
New Zealand,,University of Auckland,Faculty of Arts,European Languages and Literature,Stage 1,SPANISH 101,3113,ct,cd,cl
New Zealand,,Victoria University,Faculty of Commerce,e-Commerce,Stage 2,ELCM 211,22030,ct,cd,cl"""


class WebTestCase(unittest.TestCase):
    """
    Helpful as a base for testing handlers.
    """
    def setUp(self):
        self.testbed = testbed.Testbed()
        self.testbed.activate()
        self.policy = datastore_stub_util.PseudoRandomHRConsistencyPolicy(probability=1)
        self.testbed.init_datastore_v3_stub(consistency_policy=self.policy)
        self.testbed.init_memcache_stub()
        self.testbed.init_mail_stub()
        self.testbed.init_taskqueue_stub()
        self.mail_stub = self.testbed.get_stub(testbed.MAIL_SERVICE_NAME)
        self.taskqueue_stub = self.testbed.get_stub(testbed.TASKQUEUE_SERVICE_NAME)

        #create test app
        self.testapp = webtest.TestApp(app)

    def tearDown(self):
        self.testbed.deactivate()

    def populate_courses(self):
        load_uni_from_csv_string(fake_csv_string)


    def create_account(self):
        d = {
            'username': 'Robert King',
            'email': 'kingrobertking@gmail.com',
            'university': 'University of Auckland'
        }
        resp = self.testapp.post('/my-profile', d)
        return resp

    def login(self):
        self.create_account()
        self.testapp.cookiejar.clear()
        d = {
            'email': 'kingrobertking@gmail.com'
        }
        resp = self.testapp.post('/my-profile', d)
        return resp

