# Databricks notebook source
# Extraction
from pyspark.sql import SparkSession
spark = SparkSession.builder.getOrCreate()
df=spark.read.csv("/Workspace/Users/yaswanthkumar27572@gmail.com/dirty_sales_data.csv",header=True,inferSchema=True)
df.show()

# COMMAND ----------

from pyspark.sql import SparkSession
from pyspark.sql.functions import col, sum
spark = SparkSession.builder.getOrCreate()
df = df.na.drop()
sales=df.filter(col("total_amount")>0)
report = sales.groupBy("customer_id").agg(sum("total_amount").alias("total_sales")).orderBy(col("total_sales").desc())
                                                                     
report.show()

# COMMAND ----------

report.write \
    .mode("overwrite") \
    .saveAsTable("workspace.default.final_report")

# COMMAND ----------

spark.sql("SHOW CATALOGS").show()

# COMMAND ----------

spark.sql("SHOW SCHEMAS IN workspace").show()


# COMMAND ----------

spark.sql("SHOW VOLUMES IN workspace.default").show()