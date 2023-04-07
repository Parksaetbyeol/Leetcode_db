# self join
SELECT E1.employee_id,
    E1.name,
    COUNT(E2.reports_to) AS reports_count,
    ROUND(AVG(E2.age), 0) AS average_age
FROM Employees E1 JOIN Employees E2 ON E1.employee_id = E2.reports_to
GROUP BY employee_id
ORDER BY employee_id;
