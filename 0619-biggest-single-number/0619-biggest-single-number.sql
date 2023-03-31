# SELECT MAX(num) AS num
# FROM (
#     SELECT num, COUNT(num) AS cnt_num
#     FROM MyNumbers
#     GROUP BY num ) AS sub
# WHERE sub.cnt_num = 1

# 2
SELECT MAX(num) AS num
FROM (
    SELECT num, COUNT(num) AS cnt_num
    FROM MyNumbers
    GROUP BY num
    HAVING cnt_num = 1
    ORDER BY num DESC ) AS sub