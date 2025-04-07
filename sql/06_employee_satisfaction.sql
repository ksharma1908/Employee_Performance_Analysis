-- Average employee satisfaction score
SELECT 
    AVG(Employee_Satisfaction_Score) AS avg_satisfaction
FROM 
    employeeperformance;

-- Most satisfied employee
SELECT *
FROM employeeperformance
ORDER BY Employee_Satisfaction_Score DESC
LIMIT 1;

-- Least satisfied employee
SELECT *
FROM employeeperformance
ORDER BY Employee_Satisfaction_Score ASC
LIMIT 1;

-- Satisfaction score variation by department
SELECT 
    department, 
    AVG(Employee_Satisfaction_Score) AS avg_satisfaction
FROM 
    employeeperformance
GROUP BY 
    department
ORDER BY 
    avg_satisfaction DESC;

-- Impact of remote work on satisfaction
SELECT 
    Remote_Work_Frequency,
    AVG(Employee_Satisfaction_Score) AS avg_satisfaction
FROM 
    employeeperformance
GROUP BY 
    Remote_Work_Frequency;

-- Impact of job title on satisfaction
SELECT 
    job_title,
    AVG(Employee_Satisfaction_Score) AS avg_satisfaction
FROM 
    employeeperformance
GROUP BY 
    job_title
ORDER BY 
    avg_satisfaction DESC;
