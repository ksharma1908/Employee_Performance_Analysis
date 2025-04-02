# Excel Data Validation - README

## Overview
This document outlines the steps taken to validate and clean data in Excel before importing or starting a project. These steps ensure data accuracy, consistency, and integrity.

## Steps for Data Validation

### 1. Checking for Duplicates
- Used **Conditional Formatting → Highlight Duplicates** to identify repeated values in key fields (e.g., Employee ID, Email, Phone Number).
- Applied `COUNTIF(range, criteria)` to check for duplicates in critical columns.

### 2. Handling Missing Values
- Used **Filters** to locate blank cells in essential columns (e.g., Name, Department, Hire Date).
- Applied `=COUNTA(range)` to check completeness and `=COUNTBLANK(range)` to find missing values.
- Filled missing numeric values using **average or median**, where applicable.

### 3. Detecting Typos & Inconsistencies
- Used **Spell Check (F7)** to correct common typos in names and descriptions.
- Standardized text formatting using `TRIM`, `UPPER`, and `PROPER` functions.
- Checked for inconsistent naming in categorical fields (Department, Job Title) using **Pivot Tables**.

### 4. Validating Data Types
- Applied **Data Validation Rules** to ensure numeric fields contain only valid numbers (e.g., positive salary values, age >18).
- Ensured date fields were formatted correctly using `TEXT(date, "YYYY-MM-DD")`.

### 5. Removing Extra Spaces & Special Characters
- Used `TRIM(A1)` to eliminate leading, trailing, and double spaces.
- Applied `CLEAN(A1)` to remove non-printable characters in text fields.

### 6. Standardizing Formats
- Formatted date columns in `YYYY-MM-DD` format for consistency.
- Applied **Number Formatting** to currency, percentages, and decimal places.

### 7. Identifying Outliers & Incorrect Entries
- Used **Conditional Formatting** to highlight anomalies (e.g., negative salaries, unrealistic ages).
- Applied `=IF(A2>1000000, "Check Value", "")` to flag threshold-based outliers.

## Conclusion
By performing these checks, the data is cleaned, standardized, and ready for further processing or import into SQL databases. These steps ensure accuracy and prevent errors in analysis and reporting.
