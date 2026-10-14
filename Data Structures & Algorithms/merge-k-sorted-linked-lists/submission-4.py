# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next

class Solution:    
    def mergeKLists(self, lists: List[Optional[ListNode]]) -> Optional[ListNode]:
        import heapq
        out = None
        out_end = None
        min_heap = []
        for i, l in enumerate(lists):
            if l is not None:
                heapq.heappush(min_heap, (l.val, i))

        while len(min_heap) > 0:
            min_element, min_idx = heapq.heappop(min_heap)

            if out is None:
                out = lists[min_idx]
                out_end = out
            else:
                new_node = lists[min_idx]
                out_end.next = new_node
                out_end = new_node            

            if lists[min_idx].next is not None:
                heapq.heappush(min_heap, (lists[min_idx].next.val, min_idx))
                lists[min_idx] = lists[min_idx].next
        
        return out

