SELECT DISTINCT id, COUNT(*) num 
FROM ((select requester_id AS id, accepter_id AS friend
       from RequestAccepted) 
     UNION ALL
      (select accepter_id AS id, accepter_id AS friend 
       from RequestAccepted)) Tab
GROUP BY id
ORDER BY num DESC
LIMIT 1


