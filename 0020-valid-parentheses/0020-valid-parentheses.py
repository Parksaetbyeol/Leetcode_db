class Solution:
    def isValid(self, s: str) -> bool:
        parentheses = {
            "(" : ")",
            "{" : "}",
            "[" : "]"
        } # 괄호 짝 대조를 위한 딕셔너리
        stack = [] # 여는 괄호를 담을 stack

        for par in s:
            if par in parentheses.keys(): # 여는 괄호라면
                stack.append(par) # stack에 push
            else: # 닫는 괄호
                try:
                    op = stack.pop()
                    if parentheses[op] != par:
                        return False
                except: # 닫는 괄호로 시작하는 경우 예외처리
                    return False

        if stack: # for loop을 마쳤지만, stack에 여는 괄호가 남아있는 경우 (짝이 안맞는 경우)
            return False

        else:
            return True # for loop을 정상적으로 마치면 Valid parentheses.