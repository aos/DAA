# Your task in this problem is to run the Huffman coding algorithm from lecture
# on this data set. What is the maximum length of a codeword in the resulting
# Huffman code?

from heapq import heappush, heappop
from node import Node

DATA_PATH = 'problem-data/small.txt'
# Node:
#   key [Integer]
#   value [String]
#   left [Node]
#   right [Node]

def build_tree(file_path):
    total_sym = 0
    # Initialize heap
    h = []

    # 1. Add all symbols to heap
    with open(file_path) as f:
        for index, line in enumerate(f):
            if index == 0:
                total_sym = int(line)
            else:
                # Create a Node for each line with weight and push into heap
                n = Node(int(line), line.strip())
                heappush(h, n)

    # 2. Bottom-up
    # Extract 2 symbols at a time
    # Re-insert the new sum of 2 symbols into heap
    while len(h) > 1:
        a = heappop(h)
        b = heappop(h)
        total_weight = a.key + b.key
        meta_symbol = '{}-{}'.format(a.value, b.value)
        # Create "meta-symbol" Node and assign left & right Nodes as we climb up
        c = Node(total_weight, meta_symbol, left=a, right=b)
        heappush(h, c)

    # One remaining Node in heap, this is our root
    root = heappop(h)
    print(root.value)
    return total_sym, root

if __name__ == '__main__':
    build_tree(DATA_PATH)
