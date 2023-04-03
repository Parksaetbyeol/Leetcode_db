SELECT ROUND(COUNT(tab2.player_id)/COUNT(tab1.player_id), 2) AS fraction
FROM (SELECT player_id, MIN(event_date) first_log -- 유저별 첫번째 접속일
        FROM Activity
        GROUP BY player_id) tab1 
        
    LEFT JOIN Activity tab2 
    ON tab1.player_id = tab2.player_id 
        AND tab1.first_log = tab2.event_date - 1 