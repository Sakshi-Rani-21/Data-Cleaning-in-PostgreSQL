# Data Cleaning Project

This project demonstrates data cleaning techniques applied to a dataset using SQL. The goal was to clean and prepare data for analysis.

## Project Overview
In Data Analysis, the analyst must ensure that the data is 'clean' before doing any analysis. 'Dirty' data can lead to unreliable, inaccurate and/or misleading result

The project involves the following steps:
1. **Removing Duplicates**: Identifying and removing duplicate records from the dataset.
2. **Standardizing Data**: Cleaning and standardizing data entries.
3. **Handling Null or Blank Values**: Addressing missing or blank values.
4. **Removing Unnecessary Columns**: Dropping columns that are no longer needed.

## Scripts

- `create_staging_table.sql`: Creates a staging table for safe data cleaning.
- `remove_duplicates.sql`: Removes duplicate records from the staging table.
- `standardize_data.sql`: Standardizes data values in the staging table.
- `handle_null_values.sql`: Handles null or blank values in the dataset.
- `remove_columns.sql`: Removes unnecessary columns from the cleaned dataset.

## Key Tasks:

- **Removed Duplicates:** Utilized SQL queries to identify and eliminate duplicate records, ensuring data consistency.
- **Standardized Data:** Cleaned and standardized data formats, including text normalization, date formatting, and country names.
- **Handled Missing Values:** Addressed null or blank values by updating entries and applying appropriate default values or placeholders.
- **Data Validation:** Performed data validation to ensure accuracy and integrity, including checking for anomalies and inconsistencies.
- **Optimized Performance:** Enhanced query performance for data processing by using efficient SQL techniques and staging tables.


## Getting Started
1. Clone this repository to your local machine.
2. Open the Excel file for the raw data [world_layoffs](https://github.com/Sakshi-Rani-21/HR-Analytics-Dashboard-Excel/blob/0fe73d91700f8b5ee5bc39d2d1395d55839cab75/hr%20analytics%20dashboard.xlsx) or [layoffs csv](https://github.com/Sakshi-Rani-21/Data-Cleaning-in-PostgreSQL/blob/main/layoffs.csv).
3. Open the file [Data Cleaning Process](https://github.com/Sakshi-Rani-21/Data-Cleaning-in-PostgreSQL/blob/main/data%20cleaning.sql) for the sql queries.
4. Check here the cleand data [Cleaned data](https://github.com/Sakshi-Rani-21/Data-Cleaning-in-PostgreSQL/blob/f96a7d78555143ffb0f86d6f6607d384083f4782/cleaned%20data.csv)





