class Solution:
    def minEatingSpeed(self, piles: List[int], h: int) -> int:
        import math

        def isCorrect(num):
            k = 0
            for p in piles:
                k += math.ceil(p / num)
                if k > h:
                    return 1
            return -1

        L = 1
        R = max(piles)

        while L <= R:
            mid = (L + R) // 2

            if isCorrect(mid) < 0:
                R = mid - 1
            elif isCorrect(mid) > 0:
                L = mid + 1
            else:
                return mid
        return L