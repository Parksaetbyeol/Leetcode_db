# Write your MySQL query statement below
SELECT A.name AS Employee
FROM employee A JOIN employee B ON A.managerID = B.id
WHERE A.salary > B.salary 