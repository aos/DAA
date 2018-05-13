import unittest
from huffman import huffman
from helpers import maxDepth, minDepth

DATA_PATH = '../problem-data/huffman.txt'

class TestHuffmanSolution(unittest.TestCase):

    def setUp(self):
        self.total_sym, self.root = huffman(DATA_PATH)

    def test_total_symbols_equals_1000(self):
        self.assertEqual(self.total_sym, 1000)

    def test_max_length_codeword(self):
        result = maxDepth(self.root)
        self.assertEqual(result, 19)

    def test_min_length_codeword(self):
        result = minDepth(self.root)
        self.assertEqual(result, 9)


if __name__ == '__main__':
    unittest.main()
