# Your task in this problem is to run the Huffman coding algorithm from lecture
# on this data set. What is the maximum length of a codeword in the resulting
# Huffman code?
from heapq import heappush, heappop

DATA_PATH = 'problem-data/huffman.txt'

class Node:
    """An element of a binary tree"""
    def __init__(self, value):
        self.value = value

    def left(self, left=None):
        self.left = left

    def right(self, right=None):
        self.right = right


def main():
    total_sym = 0
    # Initialize heap
    h = []

    # 1. Add all symbols to heap
    with open(DATA_PATH) as f:
        for index, line in enumerate(f):
            if index == 0:
                total_sym = int(line)
            else:
                heappush(h, int(line))

    # Bottom-up
    # 2. Extract 2 symbols at a time
    # Re-insert the new sum of 2 symbols into heap
    # If 2 elements left, create tree
    while len(h) > 2:
        a = heappop(h)
        b = heappop(h)
        c = a + b
        # heappush(h, c)

    # 3. Top-down
    # Expand all meta-symbols into sub-trees

if __name__ == '__main__':
    main()
