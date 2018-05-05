from heapq import heappush, heappop

class Node:
    """An element of a binary tree"""
    def __init__(self, key, value, left=None, right=None):
        self.key = key
        self.value = value
        self.left = left
        self.right = right

def insert(h, node):
    v = node.value
    heappush(h, v)

