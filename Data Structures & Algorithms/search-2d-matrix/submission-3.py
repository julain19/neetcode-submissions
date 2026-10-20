class Solution:
    def searchMatrix(self, matrix: List[List[int]], target: int) -> bool:
        L = 0
        R = len(matrix) - 1
        while L <= R:
            mid = (L + R) // 2

            if matrix[mid][0] < target:
                L = mid + 1
            elif matrix[mid][0] > target:
                R = mid - 1
            else:
                return True
        
        m = R

        L = 0
        R = len(matrix[m]) - 1
        while L <= R:
            mid = (L + R) // 2

            if matrix[m][mid] < target:
                L = mid + 1
            elif matrix[m][mid] > target:
                R = mid - 1
            else:
                return True
        
        return False
        