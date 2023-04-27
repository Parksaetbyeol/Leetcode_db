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
# WITH TAB AS 
# (SELECT CASE WHEN income < 20000 THEN "Low Salary"
#         WHEN income >= 20000 AND income <= 50000 THEN "Average Salary"
#         ELSE "High Salary" 
#         END cat, 1 cnt
#     FROM accounts
# UNION ALL
#     SELECT "Low Salary", 0 
# UNION ALL
#     SELECT "Average Salary", 0
# UNION ALL
#     SELECT "High Salary", 0
# )
# SELECT cat AS category, SUM(cnt) accounts_count
# FROM TAB
# GROUP BY cat