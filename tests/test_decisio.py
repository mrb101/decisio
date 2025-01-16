import unittest
from lib.main import greet


class TestGreetFunction(unittest.TestCase):
    def test_greet(self):
        self.assertEqual(greet("Bas"), "Hello, Bas!")


if __name__ == "__main__":
    unittest.main()