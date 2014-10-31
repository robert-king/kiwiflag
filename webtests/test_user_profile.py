from webtest_lib import WebTestCase
from user_class import UserChanges, UserProfile


class MyProfileTest(WebTestCase):
    def testMyProfile(self):
        response = self.testapp.get('http://localhost:8080/my-profile')
        self.assertEqual(response.status_int, 200)
        self.assertIn('Your Name', response.body)

        self.create_account()

        uc = UserChanges.query().fetch(10)
        up = UserProfile.query().fetch(10)
        self.assertEqual(len(uc), 1)
        self.assertEqual(len(up), 1)
        uc = uc[0]
        self.assertEqual(uc.new_name, 'Robert King')
        self.assertEqual(uc.new_email, 'kingrobertking@gmail.com')

        up = up[0]
        self.assertEqual(up.name, 'Robert King')
        self.assertEqual(up.key.id(), 'kingrobertking@gmail.com')
        self.assertEqual(up.university, 'University of Auckland')

        self.testapp.cookiejar.clear()
        self.login()
        response = self.testapp.get('http://localhost:8080/my-profile')
        self.assertEqual(response.status_int, 200)
        self.assertIn('Robert King', response.body)
        self.assertIn('kingrobertking@gmail.com', response.body)
        self.assertIn(up.university, response.body)

        #update profile
        d = {'email': 'kingrobertking@gmail.com', 'username': 'robert2', 'university': 'UoC'}
        response = self.testapp.post('http://localhost:8080/my-profile', d)
        self.assertIn('robert2', response.body)
        self.assertIn('UoC', response.body)


        uc = UserChanges.query().fetch(10)
        up = UserProfile.query().fetch(10)
        #len(uc) = 3 because a uc is created during login.
        self.assertEqual(len(uc), 3)
        self.assertEqual(len(up), 1)

        up = up[0]
        self.assertEqual(up.name, 'robert2')
        self.assertEqual(up.key.id(), 'kingrobertking@gmail.com')
        self.assertEqual(up.university, 'UoC')



