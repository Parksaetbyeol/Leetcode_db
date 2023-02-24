# Write your MySQL query statement below
# 연봉이 동일한 사람도 같이 출력되도록함
SELECT D.name AS Department
    , E.name AS Employee
    , Salary
FROM Employee E JOIN Department D 
    ON E.departmentId = D.id
WHERE (departmentid, salary) IN 
    (SELECT departmentid, MAX(salary)
        FROM Employee
        GROUP BY departmentid)