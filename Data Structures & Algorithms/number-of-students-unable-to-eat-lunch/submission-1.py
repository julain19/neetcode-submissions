class Solution:
    def countStudents(self, students: List[int], sandwiches: List[int]) -> int:
        from collections import deque
        students = deque(students)

        for sand in sandwiches:
            current_length = len(students)
            i = 0

            while current_length > i:
                if not students:
                    return 0
                stud = students.popleft()
                if stud == sand:
                    break
                else:
                    students.append(stud)
                i += 1
            
            if i == current_length:
                return current_length
        
        return len(students)