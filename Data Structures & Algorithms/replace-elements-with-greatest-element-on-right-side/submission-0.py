class Solution:
    def replaceElements(self, arr: List[int]) -> List[int]:#
        j = -1
        k = -1
        for i in range(len(arr)-1, -1, -1):
            j = arr[i]
            arr[i] = k
            k = max(j, k)
        
        return arr
