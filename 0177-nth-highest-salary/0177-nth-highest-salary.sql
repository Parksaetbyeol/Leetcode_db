CREATE FUNCTION getNthHighestSalary(n INT) RETURNS INT
BEGIN
    SET n = n-1;
    RETURN (
        SELECT DISTINCT(salary)
        FROM Employee 
        ORDER BY salary DESC
        LIMIT 1 OFFSET N -- OFFSET N번째 부터 LIMIT 1개 출력
            );
END
