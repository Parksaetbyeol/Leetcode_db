SELECT name, bonus
FROM Employee E LEFT JOIN Bonus B USING(empID)
WHERE bonus < 1000 or bonus IS NULL;

# SELECT name, bonus
# FROM Employee LEFT JOIN Bonus USING(empId)
# WHERE COALESCE(bonus, 0) < 1000; 