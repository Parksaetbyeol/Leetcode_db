SELECT U.name name,
    IFNULL(SUM(R.distance), 0) travelled_distance
FROM Users U LEFT JOIN Rides R ON U.id = R.user_id
GROUP BY U.id
ORDER BY 2 DESC, 1 ASC