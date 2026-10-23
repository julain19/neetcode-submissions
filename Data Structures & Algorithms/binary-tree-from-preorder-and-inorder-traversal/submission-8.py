# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right

class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> Optional[TreeNode]:
        def buildSubtree(preL: int, preR: int, inL: int, inR: int) -> Optional[TreeNode]:
            if preL >= preR or inL >= inR:
                return None
            
            root = TreeNode(preorder[preL])
            mid = indices[root.val]
            left_size = mid - inL
            root.left = buildSubtree(preL+1, preL+1+left_size, inL, mid)
            root.right = buildSubtree(preL+1+left_size, preR, mid+1, inR)
            return root

        indices = {val: i for i, val in enumerate(inorder)}
        return buildSubtree(0, len(preorder), 0, len(inorder))