SELECT contest_id,
    ROUND((COUNT(user_id)/(SELECT COUNT(*) FROM Users))*100, 2) AS percentage
FROM Users U JOIN Register R USING(user_id)
GROUP BY contest_id
ORDER BY percentage DESC, contest_id;