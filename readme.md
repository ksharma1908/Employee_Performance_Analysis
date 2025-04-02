# Employee Performance Analysis - README

## Overview
This project involves cleaning and analyzing employee performance data using Excel, SQL, and Power BI. The dataset was first validated in Excel to ensure accuracy, then imported into SQL for transformation, and finally visualized in Power BI for insights.

## Workflow

### 1. Data Cleaning in Excel
Before importing the data into SQL, thorough data validation and cleaning were performed in Excel. Steps included:
- **Duplicate Removal:** Identified and removed duplicate employee records.
- **Handling Missing Values:** Used filtering techniques to find blanks and applied appropriate methods to fill them.
- **Fixing Typos & Standardization:** Applied functions like `TRIM`, `UPPER`, and `PROPER` to maintain consistency.
- **Validating Data Types:** Ensured numeric values and dates were correctly formatted.
- **Identifying Outliers:** Used conditional formatting to highlight anomalies.

More details: [Excel Data Cleaning](https://github.com/ksharma1908/Employee_Performance_Analysis/blob/master/excel_validations.md)

### 2. Data Storage in SQL
After cleaning, the data was imported into SQL for further transformation and querying. SQL operations performed include:
- **Schema Design:** Created normalized tables for efficient storage.
- **Data Import:** Used `BULK INSERT` and `COPY` commands.
- **Constraints & Indexing:** Applied `PRIMARY KEY`, `FOREIGN KEY`, and indexing for performance.
- **Data Transformation:** Utilized `JOINs`, `CTEs`, `CASE` statements, and aggregation functions.

SQL scripts: [SQL Queries & Scripts](https://github.com/ksharma1908/Employee_Performance_Analysis/tree/master/sql)

### 3. Data Visualization in Power BI
The processed data was imported into Power BI for interactive reporting. Key dashboards include:
- **Employee Performance Trends**
- **Attrition Analysis**
- **Department-wise Productivity Metrics**

The Power BI dashboard provides insights into employee performance, retention patterns, and overall workforce trends.

## Data Files
All raw and cleaned datasets are stored here: [Project Data Files](https://github.com/ksharma1908/Employee_Performance_Analysis/tree/master/data_file)

## Conclusion
This end-to-end project demonstrates the importance of data validation, transformation, and visualization in making data-driven decisions. By leveraging Excel for data cleaning, SQL for structured querying, and Power BI for reporting, the project delivers comprehensive insights into employee performance.

For any queries or improvements, feel free to contribute!
