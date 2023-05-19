SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT num
        , LEAD(num, 1) OVER (ORDER BY id) AS 'L' # num을 기준으로 1번째 다음 행 출력
        , LEAD(num, 2) OVER (ORDER BY id) AS 'L2'
    FROM Logs) Logs2
WHERE Logs2.num = Logs2.L AND Logs2.L = Logs2.L2;