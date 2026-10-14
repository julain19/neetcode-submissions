# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:    
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        import heapq
        merged = []
        min_heap = []
        for i, l in enumerate(lists):
            if l is not None:
                heapq.heappush(min_heap, (l.val, i))

        while len(min_heap) > 0:
            min_element, min_idx = heapq.heappop(min_heap)
            merged.append(min_element)

            if lists[min_idx].next is not None:
                heapq.heappush(min_heap, (lists[min_idx].next.val, min_idx))
                lists[min_idx] = lists[min_idx].next
        
        out = None
        for n in merged[::-1]:
            new_out = ListNode(n, out)
            out = new_out
        return out

