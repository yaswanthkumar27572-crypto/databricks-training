
# SQL Analytics: Window Functions & Common Table Expressions (CTEs)

##  Assignment Overview
This workspace targets intermediate to advanced analytic queries utilizing **Common Table Expressions (CTEs)** and **SQL Window Functions**. The solutions address critical real-world reporting requirements including salary rankings, running totals, moving metrics, lag/lead comparisons, and parent-child hierarchy resolutions.


## Core Concepts Implemented

- **Ranking Algorithms**: Implementation and logical evaluation differences between `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()`.
- **Sliding Frameworks & Aggregations**: Rolling averages using localized partitioning logic (`ROWS BETWEEN 2 PRECEDING AND CURRENT ROW`).
- **Data Offsets**: Shifting row outputs back or forward using `LAG()` and `LEAD()` without utilizing heavy joins.
- **CTEs (Common Table Expressions)**: Structural encapsulation of complex subqueries to build recursive data pipelines.

---

## Execution Pipeline Index

| Category | Topics Highlighted | Questions |
| :--- | :--- | :--- |
| **Simple Rankings** | `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` | Q1 - Q3 |
| **Category Segmentation** | `PARTITION BY`, Departmental Max, High-Earners | Q4 - Q6 |
| **Running Calculations** | Running Sums, Cumulative Aggregations, Sliding Moving Averages | Q7 - Q8, Q12 |
| **Analytical Offsets** | `LAG()`, `LEAD()`, Delta Variations | Q9 - Q11 |
| **Customer Journeys** | First vs. Last customer behavior | Q14 - Q15 |
| **Advanced CTEs** | Multiple and Recursive CTE joins, Organizational hierarchies | Q21 - Q25 |
| **Dynamic Filters** | Department Max difference, Top performer highlights | Q28 - Q30 |
| **Bonus Track** | Monthly sales, run-rate tracking, MoM growth % | Bonus |

---



---
*Author: M. Yaswanth* *Data Engineering Trainee*
