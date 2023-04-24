# 당신은 식당 주인이고 가능한 확장을 분석하려고 합니다(매일 최소 한 명의 고객이 있을 것입니다).
# 고객이 7일 창(즉, 현재 날짜 + 6일 전)에 지불한 금액의 이동 평균을 계산하는 SQL 쿼리를 작성합니다. 

# 1
# SELECT a.visited_on AS visited_on, SUM(b.day_sum) AS amount,
#        ROUND(AVG(b.day_sum), 2) AS average_amount
# FROM
#   (SELECT visited_on, SUM(amount) AS day_sum FROM Customer GROUP BY visited_on ) a,
#   (SELECT visited_on, SUM(amount) AS day_sum FROM Customer GROUP BY visited_on ) b
# WHERE DATEDIFF(a.visited_on, b.visited_on) BETWEEN 0 AND 6
# GROUP BY a.visited_on
# HAVING COUNT(b.visited_on) = 7


# 2
WITH base AS
    (SELECT visited_on, sum(amount) as amount
     FROM Customer
     GROUP BY 1)


SELECT c1.visited_on,
    round(sum(c2.amount),2) as amount,
    round(avg(c2.amount),2) as average_amount
FROM base c1 JOIN base c2 
    ON DATEDIFF(c1.visited_on, c2.visited_on ) BETWEEN 0 AND 6
GROUP BY 1
HAVING count(distinct c2.visited_on) = 7
ORDER BY 1