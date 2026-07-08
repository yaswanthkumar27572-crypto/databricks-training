# PySpark ETL Pipeline

## Project Overview
This project demonstrates a simple ETL (Extract, Transform, Load) pipeline using PySpark in Databricks. The pipeline reads raw sales data, cleans it, performs transformations, generates aggregated reports, and stores the final output.

## Technologies Used
- Python
- PySpark
- Apache Spark
- Databricks Free Edition

## Dataset
The dataset contains sales transaction records with fields such as:
- customer_id
- product_name
- category
- quantity
- unit_price
- total_amount
- payment_method
- transaction_date

## ETL Process

### 1. Extract
- Read the CSV file using Spark DataFrame.
- Infer schema automatically.
- Read header from the CSV file.

### 2. Transform
- Remove rows containing null values.
- Filter records where total_amount > 0.
- Group data by customer_id and city.
- Calculate total sales using SUM(total_amount).
- Sort the results in descending order of total sales.

### 3. Load
- Save the transformed report as a Delta table in Databricks.

## PySpark Operations Used
- read.csv()
- na.drop()
- filter()
- groupBy()
- agg()
- sum()
- alias()
- orderBy()
- write()
- saveAsTable()

## Output
The final report contains:
- Customer ID
- City
- Total Sales

The report is stored as:

workspace.default.final_report

## How to Run

1. Upload the dataset to Databricks.
2. Create a SparkSession.
3. Read the CSV file.
4. Execute the transformation pipeline.
5. Save the final report using:

```python
report.write.mode("overwrite").saveAsTable("workspace.default.final_report")
```

6. Verify the output:

```python
spark.sql("SELECT * FROM workspace.default.final_report").show()
```

## Learning Outcomes
- Working with Spark DataFrames
- Data cleaning using PySpark
- Aggregation and grouping
- Sorting data
- Writing Spark tables
- Building an ETL pipeline in Databricks

