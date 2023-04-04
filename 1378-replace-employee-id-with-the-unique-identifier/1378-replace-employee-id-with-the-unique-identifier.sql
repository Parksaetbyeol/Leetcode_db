SELECT unique_id, name
FROM Employees E LEFT JOIN EmployeeUNI U USING(id)
