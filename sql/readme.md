# Employee Performance Analysis - SQL KPIs

## Overview
This document contains SQL queries to analyze employee performance data. The dataset is stored in MySQL, and the queries help extract key insights such as employee distribution, demographics, tenure, and productivity metrics.

## Execution Environment
- **Database:** MySQL
- **Table Name:** `EmployeePerformance`
- **Prerequisites:** Ensure the table structure is properly set up with columns like `department`, `gender`, `age`, `job_title`, `education_level`, `hire_date`, `performance_score`, `overtime_hours`, `projects_handled`, `employee_satisfaction_score`, and `remote_work_frequency`.

## KPIs & SQL Queries

<details>
<summary>1. Employee Demographics & Distribution</summary>

#### Total Number of Employees
```sql
SELECT COUNT(*) AS employee_count FROM EmployeePerformance;
```

#### Number of Employees in Each Department
```sql
SELECT department, COUNT(*) AS count_department 
FROM EmployeePerformance 
GROUP BY department;
```

#### Gender Distribution of Employees
```sql
SELECT gender, COUNT(*) AS count_gender 
FROM EmployeePerformance 
GROUP BY gender;
```

#### Average, Minimum, and Maximum Age of Employees
```sql
SELECT AVG(age) AS average_age, MIN(age) AS min_age, MAX(age) AS max_age 
FROM EmployeePerformance;
```

#### Number of Employees by Job Title
```sql
SELECT job_title, COUNT(*) AS count_title 
FROM EmployeePerformance 
GROUP BY job_title;
```

#### Employee Distribution Based on Education Level
```sql
SELECT education_level, COUNT(*) AS employee_count 
FROM EmployeePerformance 
GROUP BY education_level 
ORDER BY employee_count DESC;
```

#### Average Tenure of Employees
```sql
SELECT AVG(TIMESTAMPDIFF(YEAR, hire_date, CURDATE())) AS avg_tenure 
FROM EmployeePerformance;
```

</details>

<details>
<summary>2. Performance & Productivity Metrics</summary>

#### Average Performance Score per Department
```sql
SELECT department, AVG(performance_score) AS avg_performance_score
FROM EmployeePerformance
GROUP BY department
ORDER BY avg_performance_score DESC;
```

#### Top 10 Highest-Performing Employees
```sql
SELECT employee_id, department, performance_score
FROM EmployeePerformance
ORDER BY performance_score DESC
LIMIT 10;
```

#### Lowest-Performing Employees
```sql
SELECT employee_id, department, performance_score
FROM EmployeePerformance
ORDER BY performance_score ASC
LIMIT 10;
```

#### Distribution of Performance Scores Across Departments
```sql
SELECT department, performance_score, COUNT(*) AS employee_count
FROM EmployeePerformance
GROUP BY department, performance_score
ORDER BY department, performance_score DESC;
```

#### Impact of Overtime on Employee Performance
```sql
SELECT overtime_hours, AVG(performance_score) AS avg_performance_score
FROM EmployeePerformance
GROUP BY overtime_hours
ORDER BY overtime_hours ASC;
```

#### Average Number of Projects Handled per Department
```sql
SELECT department, AVG(projects_handled) AS avg_projects
FROM EmployeePerformance
GROUP BY department
ORDER BY avg_projects DESC;
```

</details>

<details>
<summary>3. Salary & Compensation Insights</summary>

#### Average Salary per Department
```sql
WITH DepartmentSalary AS (
    SELECT Department, AVG(Monthly_Salary) AS Avg_Salary
    FROM EmployeePerformance
    GROUP BY Department
)
SELECT * FROM DepartmentSalary
ORDER BY Avg_Salary DESC;
```

#### Highest and Lowest Salaries in Each Department
```sql
WITH SalaryRange AS (
    SELECT Department, 
           MAX(Monthly_Salary) AS Highest_Salary, 
           MIN(Monthly_Salary) AS Lowest_Salary
    FROM EmployeePerformance
    GROUP BY Department
)
SELECT * FROM SalaryRange;
```

#### Salary Variation by Job Title
```sql
WITH JobTitleSalary AS (
    SELECT Job_Title, AVG(Monthly_Salary) AS Avg_Salary
    FROM EmployeePerformance
    GROUP BY Job_Title
)
SELECT * FROM JobTitleSalary
ORDER BY Avg_Salary DESC;
```

#### Impact of Education Level on Salary
```sql
WITH EducationSalary AS (
    SELECT Education_Level, AVG(Monthly_Salary) AS Avg_Salary
    FROM EmployeePerformance
    GROUP BY Education_Level
)
SELECT * FROM EducationSalary
ORDER BY Avg_Salary DESC;
```

#### Effect of Promotions on Salary Over Time
```sql
WITH PromotionSalary AS (
    SELECT Promotions, AVG(Monthly_Salary) AS Avg_Salary
    FROM EmployeePerformance
    GROUP BY Promotions
)
SELECT * FROM PromotionSalary
ORDER BY Promotions DESC;
```

</details>

<details>
<summary>4. Workload & Efficiency Analysis</summary>

#### Average Number of Work Hours per Week per Department
```sql
SELECT department, AVG(work_hours_per_week) AS avg_work_hours
FROM EmployeePerformance
GROUP BY department
ORDER BY avg_work_hours DESC;
```

#### Employees Who Work More Than the Standard Hours
```sql
SELECT employee_id, employee_name, work_hours_per_week
FROM EmployeePerformance
WHERE work_hours_per_week > 40
ORDER BY work_hours_per_week DESC;
```

#### Employee with the Highest Overtime Hours
```sql
SELECT employee_id, employee_name, overtime_hours
FROM EmployeePerformance
ORDER BY overtime_hours DESC
LIMIT 1;
```

#### Employees Handling the Most Projects
```sql
SELECT employee_id, employee_name, projects_handled
FROM EmployeePerformance
ORDER BY projects_handled DESC
LIMIT 10;
```

#### Employees with the Most and Least Sick Days
```sql
SELECT employee_id, employee_name, sick_days
FROM EmployeePerformance
ORDER BY sick_days DESC
LIMIT 10;
```

```sql
SELECT employee_id, employee_name, sick_days
FROM EmployeePerformance
ORDER BY sick_days ASC
LIMIT 10;
```

#### Average Remote Work Frequency by Department
```sql
SELECT department, AVG(remote_work_days) AS avg_remote_days
FROM EmployeePerformance
GROUP BY department
ORDER BY avg_remote_days DESC;
```

</details>

<details>
<summary>5. Employee Satisfaction & Retention</summary>

#### What is the average employee satisfaction score?
```sql
SELECT 
    AVG(Employee_Satisfaction_Score) AS avg_satisfaction
FROM 
    EmployeePerformance;
```

#### Who are the most and least satisfied employees?
-- Most satisfied employee
```sql
SELECT *
FROM EmployeePerformance
ORDER BY Employee_Satisfaction_Score DESC
LIMIT 1;
```
-- Least satisfied employee
```sql
SELECT *
FROM EmployeePerformance
ORDER BY Employee_Satisfaction_Score ASC
LIMIT 1;
```

#### How does satisfaction score vary by department?
```sql
SELECT 
    department, 
    AVG(Employee_Satisfaction_Score) AS avg_satisfaction
FROM 
    EmployeePerformance
GROUP BY 
    department
ORDER BY 
    avg_satisfaction DESC;
```

#### Does remote work impact employee satisfaction?
```sql
SELECT 
    Remote_Work_Frequency,
    AVG(Employee_Satisfaction_Score) AS avg_satisfaction
FROM 
    EmployeePerformance
GROUP BY 
    Remote_Work_Frequency;
```

#### How does job title impact satisfaction levels?
```sql
SELECT 
    job_title,
    AVG(Employee_Satisfaction_Score) AS avg_satisfaction
FROM 
    EmployeePerformance
GROUP BY 
    job_title
ORDER BY 
    avg_satisfaction DESC;
```

</details>

<details>
<summary>6. Attrition & Resignation Analysis</summary>

#### How many employees have resigned?
```sql
SELECT COUNT(*) AS resigned_count
FROM EmployeePerformance
WHERE resigned = 'True';
```

#### What is the resignation rate per department?
```sql
SELECT department,
       ROUND(SUM(CASE WHEN resigned = 'True' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS resignation_rate
FROM EmployeePerformance
GROUP BY department
ORDER BY resignation_rate DESC;
```
</details>

<details>
<summary>7. Training & Promotion Impact</summary>

#### How many training hours have been completed per department?
```sql
SELECT department, 
       SUM(training_hours) AS total_training_hours
FROM EmployeePerformance
GROUP BY department
ORDER BY total_training_hours DESC;
```

#### Which employees have the highest training hours?
```sql
SELECT employee_id, department, training_hours
FROM EmployeePerformance
ORDER BY training_hours DESC
LIMIT 10;
```

#### How many promotions have been given in total?
```sql
SELECT SUM(promotions) AS total_promotions
FROM EmployeePerformance;
```

#### Which employees have received the most promotions?
```sql
SELECT employee_id, department, promotions
FROM EmployeePerformance
ORDER BY promotions DESC
LIMIT 10;
```

#### Does training impact promotions?
```sql
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
```
</details>

## Additional Information
- The `hire_date` column should be stored in `DATE` format to ensure correct calculations.
- Use `INDEX` on `department`, `job_title`, `education_level`, `performance_score`, and `employee_satisfaction_score` for better query performance.

## Related Resources
- [Excel Data Cleaning](https://github.com/ksharma1908/Employee_Performance_Analysis/blob/master/excel_validations.md)
- [Project Data Files](https://github.com/ksharma1908/Employee_Performance_Analysis/tree/master/data_file)
- [SQL Queries & Scripts](https://github.com/ksharma1908/Employee_Performance_Analysis/tree/master/sql)

## Conclusion
These queries help extract meaningful insights into employee demographics, distribution, tenure, and performance. The results can be further analyzed using Power BI for visualization and strategic decision-making.

For contributions or improvements, feel free to submit a pull request!
