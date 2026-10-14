class Solution:
    def kClosest(self, points: List[List[int]], k: int) -> List[List[int]]:
        import heapq
        import math
        dists = []
        out = []
        for p in points:
            heapq.heappush(dists, (math.dist([0,0], p), p))
        for i in range(k):
            out.append(heapq.heappop(dists)[1])
        return out
