class Node:
    """An element of a binary tree

    Node:
    - key [Integer]
    - value [String]
    - left [Node], default = None
    - right [Node], default = None
    """
    def __init__(self, key, value, left=None, right=None):
        self.key = key
        self.value = value
        self.left = left
        self.right = right

    # Defining a custom comparison for Nodes to be used in python's heapq
    # The heapq module uses the "less than" operator to compare between items
    def __lt__(self, other):
        return self.key < other.key

    def __str__(self):
        return 'key: {}, value: {}, left: {}, right: {}' \
                .format(self.key, self.value, self.left, self.right)
