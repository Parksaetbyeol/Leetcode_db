# SQL 쿼리를 작성하여 처음 로그인한 날 다음 날 다시 로그인한 플레이어의 비율을 소수점 둘째 자리에서 반올림하여 보고합니다. 즉, 첫 로그인 날짜부터 연속 2일 이상 로그인한 플레이어 수를 세고 그 수를 총 플레이어 수로 나누어야 합니다.

# 1
# SELECT ROUND(COUNT(tab2.player_id)/COUNT(tab1.player_id), 2) AS fraction
# FROM (SELECT player_id, MIN(event_date) first_log -- 유저별 첫번째 접속일
#         FROM Activity
#         GROUP BY player_id) tab1 
        
#     LEFT JOIN Activity tab2 
#     ON tab1.player_id = tab2.player_id 
#         AND tab1.first_log = tab2.event_date - 1 
        

# 2
SELECT ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) 
                                          FROM Activity),2) as fraction 
FROM Activity
WHERE (player_id, DATE_SUB(event_date, INTERVAL 1 DAY)) IN 
    (SELECT player_id, MIN(event_date) as first_login 
        FROM Activity 
        GROUP BY player_id)