# 1 - UNION
SELECT "Low Salary" AS Category,
    SUM(income<20000) AS accounts_count
FROM Accounts
UNION
SELECT  "Average Salary" Category,
    SUM(income BETWEEN 20000 AND 50000) AS accounts_count
FROM Accounts
UNION
SELECT "High Salary" category,
    SUM(income>50000) AS accounts_count
FROM Accounts



# 2 - CASE WHEN
# SELECT 'Low Salary' as category
#     , COUNT(CASE WHEN income<20000 then 1 end) AS accounts_count 
# FROM Accounts
# UNION
# SELECT 'Average Salary' as category
#     , COUNT(CASE WHEN income>=20000 AND income<= 50000 THEN 1 END) AS accounts_count 
# FROM Accounts
# UNION
# SELECT 'High Salary' as category
#     , COUNT(CASE WHEN income>50000 THEN 1 END) AS accounts_count 
# FROM Accounts