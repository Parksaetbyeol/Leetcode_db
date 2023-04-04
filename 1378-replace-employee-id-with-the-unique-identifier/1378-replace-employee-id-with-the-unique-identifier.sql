SELECT IFNULL(unique_id, null) unique_id, name
FROM Employees E LEFT JOIN EmployeeUNI U USING(id)
