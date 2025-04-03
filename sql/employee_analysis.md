# Employee Performance Analysis - SQL KPIs

## Overview
This document contains SQL queries to extract key performance indicators (KPIs) and insights related to employee demographics, distribution, and tenure.

## KPIs & SQL Queries

### 1. Employee Demographics & Distribution

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

#### Age Statistics of Employees (Average, Minimum, Maximum)
```sql
SELECT AVG(age) AS average_age, MIN(age) AS min_age, MAX(age) AS max_age 
FROM EmployeePerformance;
```

#### Number of Employees in Each Job Title
```sql
SELECT job_title, COUNT(*) AS count_title 
FROM EmployeePerformance
GROUP BY job_title;
```

#### Distribution of Employees Based on Education Level
```sql
SELECT education_level, COUNT(*) AS employee_count 
FROM EmployeePerformance
GROUP BY education_level
ORDER BY employee_count DESC;
```

#### Average Tenure of Employees in the Company
```sql
SELECT AVG(TIMESTAMPDIFF(YEAR, hire_date, CURDATE())) AS avg_tenure 
FROM EmployeePerformance;
```

## Additional Information
These queries help in analyzing employee distribution, demographics, and tenure, enabling data-driven decisions for HR and management teams.
