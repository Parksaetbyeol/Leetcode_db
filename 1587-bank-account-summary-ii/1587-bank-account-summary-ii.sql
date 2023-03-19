# 잔액이 10000 이상인 사용자의 이름과 잔액을 보고하는 SQL 쿼리를 작성하세요. 계정 잔액은 해당 계정과 관련된 모든 거래 금액의 합계와 같습니다.

SELECT name, SUM(amount) balance
FROM Users U JOIN Transactions T USING(account)
GROUP BY T.account
HAVING SUM(amount) > 10000