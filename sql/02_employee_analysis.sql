-- Total number of employees
SELECT COUNT(*) AS employee_count 
FROM EmployeePerformance;

-- Number of employees in each department
SELECT department, COUNT(*) AS count_department 
FROM EmployeePerformance
GROUP BY department;

-- Gender distribution of employees
SELECT gender, COUNT(*) AS count_gender 
FROM EmployeePerformance
GROUP BY gender;

-- Average, minimum, and maximum age of employees
SELECT AVG(age) AS average_age, MIN(age) AS min_age, MAX(age) AS max_age 
FROM EmployeePerformance;

-- Number of employees in each job title
SELECT job_title, COUNT(*) AS count_title 
FROM EmployeePerformance
GROUP BY job_title;

-- Employee distribution based on education level
SELECT education_level, COUNT(*) AS employee_count
FROM EmployeePerformance
GROUP BY education_level
ORDER BY employee_count DESC;

-- Average tenure of employees at the company
SELECT AVG(TIMESTAMPDIFF(YEAR, hire_date, CURDATE())) AS avg_tenure
FROM EmployeePerformance;
