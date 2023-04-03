# SELECT P.product_id,
#     ROUND(SUM(units*price)/SUM(units), 2) AS average_price
# FROM Prices P JOIN UnitsSold U USING(product_id)
# WHERE purchase_date between start_date and end_date
# GROUP BY P.product_id


SELECT P.product_id,
    ROUND(SUM(units*price)/SUM(units), 2) AS average_price
FROM Prices P JOIN UnitsSold U ON P.product_id = U.product_id
    and purchase_date between start_date and end_date
GROUP BY P.product_id

