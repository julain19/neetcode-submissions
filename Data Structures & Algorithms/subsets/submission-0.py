class Solution:
    def subsets(self, nums: List[int]) -> List[List[int]]:
        from itertools import chain, combinations
        return [list(t) for t in chain.from_iterable(combinations(nums, r) for r in range(len(nums) + 1))]