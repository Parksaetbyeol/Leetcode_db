
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
        WHERE id_diff IN (SELECT id_diff FROM T2 
                            WHERE id_diff_order > 2
                            GROUP BY id_diff)
        )
SELECT *
FROM Stadium
WHERE id IN (SELECT id FROM T3)
ORDER BY visit_date
