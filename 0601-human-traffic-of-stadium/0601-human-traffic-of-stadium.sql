# 연속된 ID가 있는 3개 이상의 행이 있는 레코드를 표시하는 SQL 쿼리를 작성하고 각 사람의 수는 100보다 크거나 같습니다.

# 1 - preceding, following, very long
# WITH T1 AS (
#     SELECT *,
#         COUNT(*) OVER(ORDER BY id RANGE BETWEEN current row AND 2 following) following_cnt,
#         COUNT(*) OVER(ORDER BY id RANGE BETWEEN 2 preceding AND current row) preceding_cnt,
#         COUNT(*) OVER(ORDER BY id RANGE BETWEEN 1 preceding AND 1 following) current_cnt
#     FROM Stadium
#     WHERE people >= 100)

# SELECT id, visit_date, people
# FROM T1
# WHERE following_cnt =  3 OR preceding_cnt = 3 OR current_cnt = 3
# ORDER BY visit_date

# 2 - window function
WITH T1 AS(
        SELECT id, id - row_number() over() as id_diff
        FROM Stadium
        WHERE people >= 100
        ),
    T2 AS(
        SELECT *, row_number() over(partition by id_diff) as id_diff_order
        FROM T1
        ),
    T3 AS(
        SELECT id
        FROM T2
        WHERE id_diff IN(SELECT id_diff FROM T2 
                            WHERE id_diff_order > 2
                            GROUP BY id_diff)
        )
SELECT *
FROM Stadium
WHERE id IN (SELECT id FROM T3)
ORDER BY visit_date
