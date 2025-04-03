-- Salary & Compensation Insights

-- Average salary per department
WITH DepartmentSalary AS (
    SELECT Department, AVG(Monthly_Salary) AS Avg_Salary
    FROM EmployeePerformance
    GROUP BY Department
)
SELECT * FROM DepartmentSalary
ORDER BY Avg_Salary DESC;

-- Highest and lowest salaries in each department
WITH SalaryRange AS (
    SELECT Department, 
           MAX(Monthly_Salary) AS Highest_Salary, 
           MIN(Monthly_Salary) AS Lowest_Salary
    FROM EmployeePerformance
    GROUP BY Department
)
SELECT * FROM SalaryRange;

-- Salary variation by job title
WITH JobTitleSalary AS (
    SELECT Job_Title, AVG(Monthly_Salary) AS Avg_Salary
    FROM EmployeePerformance
    GROUP BY Job_Title
)
SELECT * FROM JobTitleSalary
ORDER BY Avg_Salary DESC;

-- Impact of education level on salary
WITH EducationSalary AS (
    SELECT Education_Level, AVG(Monthly_Salary) AS Avg_Salary
    FROM EmployeePerformance
    GROUP BY Education_Level
)
SELECT * FROM EducationSalary
ORDER BY Avg_Salary DESC;

-- Effect of promotions on salary over time
WITH PromotionSalary AS (
    SELECT Promotions, AVG(Monthly_Salary) AS Avg_Salary
    FROM EmployeePerformance
    GROUP BY Promotions
)
SELECT * FROM PromotionSalary
ORDER BY Promotions DESC;
