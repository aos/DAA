# Your task in this problem is to run the Huffman coding algorithm from lecture
# on this data set. What is the maximum length of a codeword in the resulting
# Huffman code?

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
                # Create a tuple of the weight of the symbol and its "name"
                tup = (int(line), str(index))
                heappush(h, tup)

    # Bottom-up
    # 2. Extract 2 symbols at a time
    # Re-insert the new sum of 2 symbols into heap
    # If 2 elements left, create tree
    while len(h) > 2:
        a = heappop(h)
        b = heappop(h)
        c = (a[0] + b[0], '{0}-{1}'.format(a[1], b[1]))

        heappush(h, c)

    # 3. Top-down
    # Expand all meta-symbols into sub-trees

if __name__ == '__main__':
    main()
