-- Performance & Productivity Metrics

-- Average performance score per department
SELECT department, AVG(performance_score) AS avg_performance_score
FROM EmployeePerformance
GROUP BY department
ORDER BY avg_performance_score DESC;

-- Top 10 highest-performing employees
SELECT employee_id, department, performance_score
FROM EmployeePerformance
ORDER BY performance_score DESC
LIMIT 10;

-- Lowest-performing employees
SELECT employee_id, department, performance_score
FROM EmployeePerformance
ORDER BY performance_score ASC
LIMIT 10;

-- Distribution of performance scores across departments
SELECT department, performance_score, COUNT(*) AS employee_count
FROM EmployeePerformance
GROUP BY department, performance_score
ORDER BY department, performance_score DESC;

-- Impact of overtime on employee performance
SELECT overtime_hours, AVG(performance_score) AS avg_performance_score
FROM EmployeePerformance
GROUP BY overtime_hours
ORDER BY overtime_hours ASC;

-- Average number of projects handled per department
SELECT department, AVG(projects_handled) AS avg_projects
FROM EmployeePerformance
GROUP BY department
ORDER BY avg_projects DESC;
