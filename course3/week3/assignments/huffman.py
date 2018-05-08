# Your task in this problem is to run the Huffman coding algorithm from lecture
# on this data set. What is the maximum length of a codeword in the resulting
# Huffman code?

from heapq import heappush, heappop
from node import Node

DATA_PATH = 'problem-data/huffman.txt'

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
                # Create a node for each line with weight and push into heap
                n = Node(int(line), line)
                heappush(h, n)

    # 2. Bottom-up
    # Extract 2 symbols at a time
    # Re-insert the new sum of 2 symbols into heap
    while len(h) > 2:
        a = heappop(h)
        b = heappop(h)
        total_weight = a.key + b.key
        c = Node(total_weight, [a, b])

        heappush(h, c)

    # 3. Top-down
    # Expand all meta-symbols into sub-trees
    left = heappop(h)
    right = heappop(h)
    # Create root node once 2 elements are left in heap
    root = Node(1, 'root', left, right)

    current = root

    print(current.left.value[0])


if __name__ == '__main__':
    main()
