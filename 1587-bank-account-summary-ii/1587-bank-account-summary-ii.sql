SELECT name, SUM(amount) balance
FROM Users U JOIN Transactions T USING(account)
GROUP BY T.account
HAVING SUM(amount) > 10000