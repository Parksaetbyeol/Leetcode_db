# 1
SELECT q1.person_name
FROM Queue q1 JOIN Queue q2 ON q1.turn >= q2.turn
GROUP BY q1.turn
HAVING SUM(q2.weight) <= 1000
ORDER BY SUM(q2.weight) DESC
LIMIT 1


# 2
# SELECT person_name 
# FROM
#     (SELECT person_name, weight, turn, sum(weight) over(order by turn) AS cum_sum
#         FROM queue) x
# WHERE cum_sum <= 1000
# ORDER BY turn DESC LIMIT 1;