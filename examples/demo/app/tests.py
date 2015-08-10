from app import app
import unittest


class MainTestCase(unittest.TestCase):

    def test_data(self):
        tester = app.test_client(self)
        response = tester.get('/data')
        self.assertEqual(response.status_code, 200)

    def test_index(self):
        tester = app.test_client(self)
        response = tester.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data, 'This Flask app is dockerized. Explore the data to find out about cats!')


if __name__ == '__main__':
    unittest.main()
