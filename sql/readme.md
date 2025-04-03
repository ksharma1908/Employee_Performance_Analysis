# Employee Performance Analysis - SQL KPIs

## Overview
This document contains SQL queries to analyze employee performance data. The dataset is stored in MySQL, and the queries help extract key insights such as employee distribution, demographics, and tenure.

## Execution Environment
- **Database:** MySQL
- **Table Name:** `EmployeePerformance`
- **Prerequisites:** Ensure the table structure is properly set up with columns like `department`, `gender`, `age`, `job_title`, `education_level`, and `hire_date`.

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

## Additional Information
- The `hire_date` column should be stored in `DATE` format to ensure correct calculations.
- Use `INDEX` on `department`, `job_title`, and `education_level` for better query performance.

## Related Resources
- [Excel Data Cleaning](https://github.com/ksharma1908/Employee_Performance_Analysis/blob/master/excel_validations.md)
- [Project Data Files](https://github.com/ksharma1908/Employee_Performance_Analysis/tree/master/data_file)
- [SQL Queries & Scripts](https://github.com/ksharma1908/Employee_Performance_Analysis/tree/master/sql)

## Conclusion
These queries help extract meaningful insights into employee demographics, distribution, and tenure. The results can be further analyzed using Power BI for visualization and strategic decision-making.

For contributions or improvements, feel free to submit a pull request!
