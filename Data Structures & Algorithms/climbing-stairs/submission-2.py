class Solution:
    def climbStairs(self, n: int) -> int:
        import numpy as np

        if n == 0:
            return 0
        
        M = np.array([[1, 1], [1, 0]])

        result = np.linalg.matrix_power(M, n)
        
        return int(result[0][0])
