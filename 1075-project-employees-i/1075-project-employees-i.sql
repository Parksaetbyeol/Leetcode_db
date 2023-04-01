SELECT project_id,
    ROUND(SUM(experience_years)/COUNT(*),2) AS average_years
FROM Project P JOIN Employee E USING(employee_id)
GROUP BY project_id;