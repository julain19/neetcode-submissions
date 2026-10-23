# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def kthSmallest(self, root: Optional[TreeNode], k: int) -> int:
        def findKth(root: Optional[TreeNode], k: int) -> (int, int):
            if root is None:
                return (0, k)

            left, k = findKth(root.left, k)

            if k < 1:
                return (left, k-1)
            elif k == 1:
                return (root.val, k-1)
            
            right, k = findKth(root.right, k-1)

            return (right, k)
        return findKth(root, k)[0]