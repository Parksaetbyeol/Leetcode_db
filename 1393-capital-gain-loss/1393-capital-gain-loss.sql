# 각 주식의 자본 이득/손실을 보고하는 SQL 쿼리를 작성하십시오.
# 주식의 자본 이득/손실은 주식을 한 번 또는 여러 번 매매한 후의 총 이득 또는 손실입니다.
SELECT stock_name, SUM(
    CASE
        WHEN operation = 'Buy' THEN -price
        ELSE price
    END
) AS capital_gain_loss
FROM Stocks
GROUP BY stock_name