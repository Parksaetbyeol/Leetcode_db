class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        if not strs:
            return ""
        
        shortest = min(strs, key=len) # 길이를 기준으로 최소 길이를 갖는 문자열을 찾는다.
        
        for i, ch in enumerate(shortest): # 최소 길이 문자열의 문자를 하나씩 iteration
            for other in strs: # 리스트의 다른 문자열과 비교
                if other[i] != ch: # 동일한 위치에 있는 문자와 비교해서 다르다면
                    return shortest[:i] # 다르기 전까지의 문자만 return
        return shortest