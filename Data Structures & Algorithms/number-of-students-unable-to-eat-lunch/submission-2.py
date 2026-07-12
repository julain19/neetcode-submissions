class Solution:
    def countStudents(self, students: List[int], sandwiches: List[int]) -> int:
        from collections import Counter
        preferences = Counter(students)

        for sand in sandwiches:
            if preferences[sand] == 0:
                return sum(preferences.values())
            preferences[sand] -= 1
        
        return sum(preferences.values())