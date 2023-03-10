# Please write a DELETE statement and DO NOT write a SELECT statement.
# Write your MySQL query statement below
# 중복되는 이메일은 한개만 남기고 삭제한다. 한개는 id가 가장 작은것으로 남긴다.

# 1
# DELETE FROM Person
# WHERE Id NOT IN(
#     SELECT keep.min_id
#     FROM(
#         SELECT Email, MIN(Id) AS min_id
#         FROM Person
#         GROUP BY Email
#     ) keep )


# 2 SELECT문 사용하지 않고 작성
DELETE p1 
    FROM Person p1, Person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id