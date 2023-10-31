# 다음과 같은 모든 보험 계약자에 대해 2016 tiv_2016의 총 투자 가치 합계를 보고하는 SQL 쿼리를 작성하십시오.
# 한명 이상의 다른 보험 계약자와 동일한 tiv_2015 값을 가지며, 다른 보험 계약자와 같은 도시에 있지 않습니다(즉,(lat, lon) 속성 쌍은 고유해야 합니다).

## - 1
SELECT ROUND(SUM(tiv_2016),2) as tiv_2016
FROM Insurance i1
WHERE tiv_2015 IN (SELECT tiv_2015 FROM insurance i2
                   WHERE i1.pid != i2.pid)
AND (lat, lon) NOT IN (SELECT lat, lon FROM insurance i3
                       WHERE i3.pid != i1.pid) 
                       
## - 2                       
# SELECT ROUND(SUM(TIV_2016),2) AS TIV_2016
# FROM (SELECT *,
#         COUNT(*) OVER(PARTITION BY TIV_2015) AS CNT1,
#         COUNT(*) OVER(PARTITION BY LAT, LON) AS CNT2
#         FROM INSURANCE
#     ) AS TBL
# WHERE CNT1 >=2 AND CNT2 =1