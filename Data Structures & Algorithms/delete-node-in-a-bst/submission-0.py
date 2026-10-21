# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def findMinNode(self, root: Optional[TreeNode]) -> int:
        cur = root
        nex = root.left
        while nex is not None:
            cur = nex
            nex = nex.left
        return cur.val

    def deleteNode(self, root: Optional[TreeNode], key: int) -> Optional[TreeNode]:
        if root is None:
            return root
        
        if root.val > key:
            root.left = self.deleteNode(root.left, key)
        elif root.val < key:
            root.right = self.deleteNode(root.right, key)
        else:
            if root.left is None:
                root = root.right
            elif root.right is None:
                root = root.left
            else:
                minEl = self.findMinNode(root.right)
                root.val = minEl
                root.right = self.deleteNode(root.right, minEl)
        return root


        