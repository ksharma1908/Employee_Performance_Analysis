--How many employees have resigned?
SELECT COUNT(*) AS resigned_count
FROM EmployeePerformance
WHERE resigned = 'True';

-- What is the resignation rate per department?
SELECT department,
       ROUND(SUM(CASE WHEN resigned = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS resignation_rate
FROM EmployeePerformance
GROUP BY department
ORDER BY resignation_rate DESC;