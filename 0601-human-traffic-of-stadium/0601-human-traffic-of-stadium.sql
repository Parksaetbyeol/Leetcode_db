# 연속된 ID가 있는 3개 이상의 행이 있는 레코드를 표시하는 SQL 쿼리를 작성하고 각 사람의 수는 100보다 크거나 같습니다.
# visit_date를 기준으로 오름차순으로 정렬된 결과 테이블을 반환합니다.

WITH T1 AS (
    SELECT *,
        COUNT(*) OVER(ORDER BY id RANGE BETWEEN current row AND 2 following) following_cnt,
        COUNT(*) OVER(ORDER BY id RANGE BETWEEN 2 preceding AND current row) preceding_cnt,
        COUNT(*) OVER(ORDER BY id RANGE BETWEEN 1 preceding AND 1 following) current_cnt
    FROM Stadium
    WHERE people >= 100)

SELECT id, visit_date, people
FROM T1
WHERE following_cnt =  3 OR preceding_cnt = 3 OR current_cnt = 3
ORDER BY visit_date