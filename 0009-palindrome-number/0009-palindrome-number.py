class Solution(object):
    def isPalindrome(self, x):
        return False if x < 0 else x == int(str(x)[::-1])
        