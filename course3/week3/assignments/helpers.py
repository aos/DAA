def minDepth(root):
    if root is None:
        return 0

    if root.left is None and root.right is None:
        return 0

    if root.left is None:
        return minDepth(root.right) + 1

    if root.right is None:
        return minDepth(root.left) + 1

    return min(minDepth(root.left), minDepth(root.right)) + 1

def maxDepth(root):
    if root is None:
        return 0

    if root.left is None and root.right is None:
        return 0

    if root.left is None:
        return maxDepth(root.right) + 1

    if root.right is None:
        return maxDepth(root.left) + 1

    return max(maxDepth(root.left), maxDepth(root.right)) + 1
