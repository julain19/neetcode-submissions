class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        import copy
        """
        Do not return anything, modify nums1 in-place instead.
        """
        i = 0
        j = 0
        temp = copy.deepcopy(nums1)

        for k, _ in enumerate(nums1):
            if i >= m:
                nums1[k:] = nums2[j:]
                break
            elif j >= n:
                nums1[k:] = temp[i:m]
                break
            elif temp[i] <= nums2[j]:
                nums1[k] = temp[i]
                i += 1
            else:
                nums1[k] = nums2[j]
                j += 1
            