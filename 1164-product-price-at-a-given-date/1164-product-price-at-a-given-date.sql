# 2019-08-16의 모든 제품 가격을 찾는 SQL 쿼리를 작성하세요. 변경 전 모든 제품의 가격이 10이라고 가정합니다.
# 1
# SELECT DISTINCT t1.product_id
#     , IFNULL(t2.new_price, 10) AS price
# FROM Products t1 LEFT JOIN 
#     (SELECT *
#         FROM products
#         WHERE (product_id, change_date) IN (select product_id, max(change_date) 
#                                             from products  
#                                             where change_date <= "2019-08-16" group by product_id)) as t2
#     ON t1.product_id = t2.product_id


# 2
-- 8월 16일 이후 변경된 가격은 10으로 통일
SELECT DISTINCT product_id, 10 as price
FROM Products
GROUP BY product_id
HAVING (min(change_date) > "2019-08-16")

UNION

-- 8월 16일 이전 변경된 가격 조회
SELECT product_id, new_price
FROM Products p2
WHERE (product_id, change_date) IN (select product_id, max(change_date)
                                        from Products
                                        where change_date <= "2019-08-16"
                                        group by product_id)