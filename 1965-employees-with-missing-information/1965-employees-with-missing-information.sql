SELECT E.employee_id
FROM Employees E LEFT JOIN Salaries S USING(employee_id)
WHERE salary IS NULL

UNION

SELECT S.employee_id
FROM Employees E RIGHT JOIN Salaries S USING(employee_id)
WHERE name IS NULL
ORDER BY employee_id;