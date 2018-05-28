import unittest
from wis import wis

DATA_PATH = '../problem-data/mwis.txt'

class TestWISSolution(unittest.TestCase):

    def setUp(self):
        self.v, self.reconstructed = wis(DATA_PATH)

    # The question is: of the vertices 1, 2, 3, 4, 17, 117, 517, and 997, which
    # ones belong to the maximum-weight independent set?
    # Answer: '10100110'
    def test_get_reconstructed_set(self):
        solution = ''
        verts = [1, 2, 3, 4, 17, 117, 517, 997]
        for v in verts:
            try:
                self.reconstructed.index(v)
                solution += '1'
            except ValueError:
                solution += '0'
        self.assertEqual(solution, '10100110')


if __name__ == '__main__':
    unittest.main()
