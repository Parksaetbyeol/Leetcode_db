WITH T1 AS (
    SELECT *, id - row_number() over() as id_diff
    FROM Stadium
    WHERE people >= 100
    )
SELECT id, visit_date, people
FROM T1
WHERE id_diff IN (SELECT id_diff
                    FROM T1 GROUP BY id_diff
                    HAVING COUNT(*) > 2
ORDER BY visit_date)