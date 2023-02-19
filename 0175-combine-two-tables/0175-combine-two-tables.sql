# Write your MySQL query statement below
SELECT firstname, lastname, city, state
FROM person P LEFT JOIN address A ON P.personid = A.personid