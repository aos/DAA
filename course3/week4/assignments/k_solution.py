import unittest
import k_iterative
import k_recursive

DATA_PATH_Q1 = './problem-data/knapsack1.txt'
DATA_PATH_Q2 = './problem-data/knapsack_big.txt'

class TestKSolution(unittest.TestCase):

    def test_get_A1(self):
        k_iterative_soln = k_iterative.knapsack(DATA_PATH_Q1)
        self.assertEqual(k_iterative_soln, 2493893)

    def test_get_A2(self):
        k_recursive_soln = k_recursive.knapsack(DATA_PATH_Q2)
        self.assertEqual(k_recursive_soln, 4243395)

if __name__ == '__main__':
    unittest.main()
