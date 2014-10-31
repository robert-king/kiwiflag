from webtest_lib import WebTestCase


class Q_Handler_and_C_Handler_Test(WebTestCase):
    def test_q_handlers(self):
        response = self.testapp.get("http://localhost:8080/q/new-zealand")
        self.assertEqual(response.status_int, 301)
        response = self.testapp.get("http://localhost:8080/q/new-zealand/")
        self.assertEqual(response.status_int, 200)

        #testUniHome
        response = self.testapp.get("http://localhost:8080/q/new-zealand/university-of-auckland")
        self.assertEqual(response.status_int, 301)
        response = self.testapp.get("http://localhost:8080/q/new-zealand/university-of-auckland/")
        self.assertEqual(response.status_int, 200)

        #testUniFac
        response = self.testapp.get("http://localhost:8080/q/new-zealand/university-of-auckland/faculty-of-science")
        self.assertEqual(response.status_int, 301)
        response = self.testapp.get("http://localhost:8080/q/new-zealand/university-of-auckland/faculty-of-science/")
        self.assertEqual(response.status_int, 200)

        #testUniDep
        link = "http://localhost:8080/q/new-zealand/university-of-auckland/faculty-of-science/biological-sciences"
        response = self.testapp.get(link)
        self.assertEqual(response.status_int, 301)
        link = "http://localhost:8080/q/new-zealand/university-of-auckland/faculty-of-science/biological-sciences/"
        response = self.testapp.get(link)
        self.assertEqual(response.status_int, 200)

        #testUniStage
        link = "http://localhost:8080/q/new-zealand/university-of-auckland/faculty-of-science/biological-sciences/stage-1"
        response = self.testapp.get(link)
        self.assertEqual(response.status_int, 301)
        link = "http://localhost:8080/q/new-zealand/university-of-auckland/faculty-of-science/biological-sciences/stage-1/"
        response = self.testapp.get(link)
        self.assertEqual(response.status_int, 200)

        #testUniStage
        link = "http://localhost:8080/q/new-zealand/university-of-auckland/faculty-of-science/biological-sciences/stage-1/biosci-104"
        response = self.testapp.get(link)
        #must redirect to to chem101/ so that relative links work.
        self.assertEqual(response.status_int, 301)
        link = "http://localhost:8080/q/new-zealand/university-of-auckland/faculty-of-science/biological-sciences/stage-1/biosci-104/"
        response = self.testapp.get(link)
        self.assertEqual(response.status_int, 200)

    def test_c_handlers(self):
        self.populate_courses()
        link = "http://localhost:8080/q/new-zealand/university-of-auckland/faculty-of-science/biological-sciences/stage-1/biosci-104/"
        for page in ['reviews']:#['textbooks', 'tutoring', 'reviews', 'notes', 'discussion']: #, 'grades']:
            response = self.testapp.get(link + page)
            self.assertEqual(response.status_int, 200)
            response = self.testapp.get(link + page + "/")
            self.assertEqual(response.status_int, 301)
