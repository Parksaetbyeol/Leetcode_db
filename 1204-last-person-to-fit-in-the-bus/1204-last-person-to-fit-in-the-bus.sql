# 1
SELECT q1.person_name
FROM Queue q1 JOIN Queue q2 ON q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000 -- 몸무게가 1000될때까지 더하기
ORDER BY SUM(q2.weight) DESC -- 몸무게 합(최소1000임) 내림차순 
LIMIT 1 -- 마지막 승객만 출력


# 2
# SELECT person_name 
# FROM
#     (SELECT person_name, weight, turn, sum(weight) over(order by turn) AS cum_sum
#         FROM queue) x
# WHERE cum_sum <= 1000
# ORDER BY turn DESC LIMIT 1;