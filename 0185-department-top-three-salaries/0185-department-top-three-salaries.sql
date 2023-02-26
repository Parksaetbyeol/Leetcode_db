SELECT Department, Employee, Salary
FROM (
    SELECT D.name Department
        , E.name Employee
        , E.salary Salary
        , DENSE_RANK() OVER(PARTITION BY departmentid ORDER BY salary DESC) RNK
    FROM Employee E JOIN Department D
        ON E.departmentid = D.id) AS RNK_TABLE
WHERE RNK_TABLE.RNK <= 3
