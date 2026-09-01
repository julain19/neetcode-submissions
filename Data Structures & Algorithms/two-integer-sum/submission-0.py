class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i, num in enumerate(nums):
            other = target-num
            rest = nums[i+1:]
            if other in rest:
                return [i, i + 1 + rest.index(other)]
