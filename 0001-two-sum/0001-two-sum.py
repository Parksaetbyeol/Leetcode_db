# 정수 nums의 배열과 정수 target이 주어지면 두 숫자의 인덱스를 반환하여 합계가 target이 되도록 합니다.
# 각 입력에 정확히 하나의 솔루션이 있다고 가정할 수 있으며 동일한 요소를 두 번 사용할 수 없습니다.

# 1 - Runtime: 3838 ms, faster than 15.97% of Python3
# class Solution:
#     def twoSum(self, nums, target):
#         break_check = False
#         for i in range(1, len(nums)):
#             for j in range(i):
#                 if nums[i] + nums[j] == target:
#                     break_check = True
#                     return [i,j]
#                     break
#             if break_check:
#                 break
                
                
# 2
class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        prevMap = {} # val : index
        
        for i, n in enumerate(nums):
            diff = target - n
            if diff in prevMap:
                return [prevMap[diff], i]
            prevMap[n] = i
        return