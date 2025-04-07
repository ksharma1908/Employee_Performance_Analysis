-- How many training hours have been completed per department?
SELECT department, 
       SUM(training_hours) AS total_training_hours
FROM EmployeePerformance
GROUP BY department
ORDER BY total_training_hours DESC;

-- Which employees have the highest training hours?
SELECT employee_id, department, training_hours
FROM EmployeePerformance
ORDER BY training_hours DESC
LIMIT 10;

-- How many promotions have been given in total?
SELECT SUM(promotions) AS total_promotions
FROM EmployeePerformance;

-- Which employees have received the most promotions?
SELECT employee_id, department, promotions
FROM EmployeePerformance
ORDER BY promotions DESC
LIMIT 10;

-- Does training impact promotions?
SELECT 
    CASE 
        WHEN training_hours < 20 THEN 'Low'
        WHEN training_hours BETWEEN 20 AND 50 THEN 'Medium'
        ELSE 'High'
    END AS training_band,
    AVG(promotions) AS avg_promotions
FROM EmployeePerformance
GROUP BY training_band
ORDER BY avg_promotions DESC;
