# 고객이 원하는 배송 날짜가 주문 날짜와 같으면 즉시 주문이라고 합니다. 그렇지 않으면 예약이라고 합니다.
# 고객의 첫 번째 주문은 고객이 주문한 날짜가 가장 빠른 주문입니다. 고객이 정확히 하나의 첫 번째 주문을 가지고 있음을 보장합니다.
# 모든 고객의 첫 번째 주문에서 즉시 주문 비율을 소수점 둘째 자리로 반올림하여 찾습니다.

# 1
# SELECT ROUND(AVG(order_date = customer_pref_delivery_date)*100, 2) AS immediate_percentage
# FROM delivery
# WHERE (customer_id, order_date) IN
#     (select customer_id, min(order_date) as first_order
#     from delivery
#     group by customer_id)


# 2 
SELECT ROUND(
        (SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END))*100 
           / COUNT(delivery_id)
        ,2) AS immediate_percentage

FROM Delivery
WHERE (customer_id,order_date) IN 
    (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY 1)