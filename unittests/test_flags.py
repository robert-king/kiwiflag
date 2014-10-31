import logging
import unittest
from google.appengine.ext import ndb
from unittest_lib import UnitTestCase
from models import Flag
from models import FlagListRequestMessage

__author__ = 'robert'


class FlagsTestCase(UnitTestCase):
    def _make_26_flags(self):
        keys = []
        fields = ['author_name', 'author_links', 'author_g_plus', 'author_fb', 'author_twitter', 'author_location']
        for c in 'abcdefghijklmnopqrstuvwxyz':
            data = {k: k + '_' + c for k in fields}
            blob_info = self.get_blob_info()
            keys.append(Flag.make_flag(blob_info, data))
        return keys


class RobsTestCase(FlagsTestCase):
    def test_make_flags(self):
        self._make_26_flags()
        flags = Flag.query().fetch(50)
        self.assertEqual(len(flags), 26)
        flag_a = next(f for f in flags if f.flag_message.author_name.endswith('a'))
        fm = flag_a.flag_message
        self.assertEqual(fm.author_name, 'author_name_a')
        self.assertEqual(fm.author_links, ['author_links_a'])
        self.assertEqual(fm.author_name, 'author_name_a')
        self.assertEqual(fm.author_g_plus, 'author_g_plus_a')
        self.assertEqual(fm.author_fb, 'author_fb_a')
        self.assertEqual(fm.author_twitter, 'author_twitter_a')
        self.assertEqual(fm.author_location, 'author_location_a')

        req = FlagListRequestMessage(
            max_results=20,
            order=FlagListRequestMessage.Order.up_votes
        )
        flag_list = Flag.flag_list(req).items
        self.assertEqual(len(flag_list), 20)
        for a, b in zip(flag_list, flag_list[1:]):
            self.assertLessEqual(b.up_votes, a.up_votes)






