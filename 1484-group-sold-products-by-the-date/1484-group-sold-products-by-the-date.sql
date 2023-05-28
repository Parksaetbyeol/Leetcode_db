# 각 날짜별로 판매된 다양한 제품의 수와 이름을 찾으십시오.
SELECT sell_date,
       COUNT(DISTINCT(product), sell_date) AS num_sold, 
       GROUP_CONCAT(DISTINCT product ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;