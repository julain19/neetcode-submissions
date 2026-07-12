class Solution:
    def climbStairs(self, n: int) -> int:
        if n <= 2:
            return n

        onestepbefore = 2
        twostepbefore = 1

        for i in range(3, n + 1):
            new = onestepbefore + twostepbefore
            twostepbefore = onestepbefore
            onestepbefore = new
        return onestepbefore
