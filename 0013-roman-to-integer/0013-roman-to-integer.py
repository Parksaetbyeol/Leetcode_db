class Solution(object):
    def romanToInt(self, s):
        
        # 로마숫자
        roman = {'I':1, 'V': 5, 'X' : 10, 'L' : 50, 'C' : 100, 'D' : 500, 'M' : 1000}
        answer = 0
        
        for i in range(len(s)-1):
            if roman[s[i]] < roman[s[i+1]]:
                answer -= roman[s[i]]
            else:
                answer += roman[s[i]]
        return answer + roman[s[-1]]