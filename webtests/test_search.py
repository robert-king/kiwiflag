from webtest_lib import WebTestCase
import unittest

class SearchHandlerTest(WebTestCase):
    def testSearchHandler(self):
        response = self.testapp.get('http://localhost:8080/search')
        self.assertEqual(response.status_int, 200)
        # #display form to submit search term
        # self.assertIn('search-term', response.body)
        #
        # params = {'search-term': 'math1'}
        # response = self.testapp.get('http://localhost:8080/search', params)
        # self.assertEqual(response.status_int, 200)
