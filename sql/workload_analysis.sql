-- Workload & Efficiency Analysis

-- Average number of work hours per week per department
WITH AvgWorkHours AS (
    SELECT department, AVG(Work_Hours_Per_Week) AS Avg_Work_Hours
    FROM EmployeePerformance
    GROUP BY department
)
SELECT * FROM AvgWorkHours
ORDER BY Avg_Work_Hours DESC;

-- Employees working more than standard hours (assuming standard is 40 hours per week)
SELECT employee_id, department, Work_Hours_Per_Week
FROM EmployeePerformance
WHERE Work_Hours_Per_Week > 40
ORDER BY Work_Hours_Per_Week DESC;

-- Employee with the highest overtime hours
SELECT employee_id, department, Overtime_Hours
FROM EmployeePerformance
ORDER BY Overtime_Hours DESC
LIMIT 1;

-- Employees handling the most projects
SELECT employee_id, department, Projects_Handled
FROM EmployeePerformance
ORDER BY Projects_Handled DESC
LIMIT 10;

-- Employees taking the most sick days
SELECT employee_id, department, Sick_Days
FROM EmployeePerformance
ORDER BY Sick_Days DESC
LIMIT 10;

-- Employees taking the least sick days
SELECT employee_id, department, Sick_Days
FROM EmployeePerformance
ORDER BY Sick_Days ASC, employee_id
LIMIT 10;

-- Average remote work frequency by department
WITH RemoteWorkAvg AS (
    SELECT department, AVG(Remote_Work_Frequency) AS Avg_Remote_Work
    FROM EmployeePerformance
    GROUP BY department
)
SELECT * FROM RemoteWorkAvg
ORDER BY Avg_Remote_Work DESC;
