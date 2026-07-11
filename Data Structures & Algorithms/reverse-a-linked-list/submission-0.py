# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:
    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:
        if head is None:
            return None
        
        newList = ListNode(head.val, None)
        next = head.next

        while next != None:
            newList = ListNode(next.val, newList)
            next = next.next

        return newList