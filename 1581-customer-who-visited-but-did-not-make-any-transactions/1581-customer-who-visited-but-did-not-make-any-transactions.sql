SELECT customer_id, COUNT(*) AS count_no_trans
FROM Visits V LEFT JOIN (SELECT DISTINCT visit_id
                       FROM Transactions
                      ) AS T
                      ON V.visit_id = T.visit_id
WHERE T.visit_id IS NULL
GROUP BY customer_id;