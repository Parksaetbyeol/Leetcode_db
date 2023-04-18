# 판매된 모든 제품의 첫 해에 대한 제품 ID, 연도, 수량 및 가격을 선택하는 SQL 쿼리를 작성하십시오.
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (SELECT product_id, MIN(year) as year
                             FROM Sales
                             GROUP BY product_id) ;