# Write your MySQL query statement below
# 1
WITH salary_table AS (
     SELECT id, salary, DENSE_RANK() OVER(ORDER BY salary) sal_rank
     FROM employee
    )

SELECT IF(MAX(sal_rank)= 2, salary, null) AS SecondHighestSalary
FROM salary_table
WHERE sal_rank = 2

# 2
SELECT IF(max(R.sal_rank)=2,R.salary,null) AS 'SecondHighestSalary' 
FROM (
       SELECT salary
            , DENSE_RANK() OVER(ORDER BY salary DESC) AS sal_rank
       FROM Employee
       ) R
WHERE R.sal_rank = 2
