class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        max_i = 0
        i = 0
        for num in nums:
            if num:
                i += 1
                max_i = max(max_i, i)
            else:
                i = 0
        
        return max_i