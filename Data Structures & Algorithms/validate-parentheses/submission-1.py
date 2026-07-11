class Solution:
    def isValid(self, s: str) -> bool:
        stack = []
        counterparts = {')': '(', ']': '[', '}': '{'}

        for b in s:
            if b in ['(', '[', '{']:
                stack.append(b)
            else:
                if not stack or stack.pop() != counterparts[b]:
                    return False
        
        return len(stack) == 0