# Write your MySQL query statement below
SELECT D.name AS Department
    , E.name AS Employee
    , Salary
FROM Employee E JOIN Department D 
    ON E.departmentId = D.id
WHERE (departmentid, salary) IN 
    (SELECT departmentid, MAX(salary)
        FROM Employee
        GROUP BY departmentid)