SELECT product_name, SUM(unit) AS unit
FROM Products P LEFT JOIN Orders O USING(product_id)
WHERE YEAR(order_date) = 2020 
    AND MONTH(order_date) = 02 
GROUP BY P.product_id
HAVING sum(unit) >= 100