class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        words = s.split(' ')
        print(words)
        word = [w for w in words if w != '']
        if len(word) == 0:
            answer = 0
        else:
            word = word[-1]
            answer = len(word)
        return answer