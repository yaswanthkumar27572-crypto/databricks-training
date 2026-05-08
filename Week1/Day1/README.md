## Repository Overview
Welcome to the core database track of my Data Engineering journey. This folder houses **65 complete SQL queries** transitioning systematically from fundamental projections to advanced query mechanics like nested subqueries, CTEs, self-joins, window functions, and logic-branching. 

Each solution has been structurally optimized, commented, and verified using **DB Fiddle** and schema logic matching standard enterprise configurations.

---

## Progress Tracking Map

The training curriculum is divided into 10 structured layers of database analysis:

-  **Layer 1**: Basic Projections & Filtering (Queries 1-5)
-  **Layer 2**: Advanced Pattern & String Matching (Queries 6-10)
-  **Layer 3**: Temporal & Date Computations (Queries 11-15)
-  **Layer 4**: Boolean logic, Ranges & Nullability (Queries 16-20)
-  **Layer 5**: Quantitative Aggregations (Queries 21-25)
-  **Layer 6**: Sorting Pipelines & Boundaries (Queries 26-30)
-  **Layer 7**: Grouping Segmentation & Having Restrictions (Queries 31-35)
-  **Layer 8**: Joins & Structural Relationships (Queries 36-45)
-  **Layer 9**: Subqueries & Correlated Sub-selections (Queries 46-55)
-  **Layer 10**: Analytical Window Functions, CTEs & CASE Logic (Queries 56-65)

---

## Core Database Architectural Learnings

### 1. Row Selection Filter (`WHERE`) vs. Group Selection Filter (`HAVING`)
A foundational distinction mastered during these exercises is the query compilation pipeline order:
- **`WHERE`**: Filters records *prior* to structural grouping (cannot evaluate aggregate values like `SUM()` or `COUNT()`).
- **`HAVING`**: Filters resulting data buckets *after* group computation has completed.



### 2. Multi-table Integrations (Joins)
- **`INNER JOIN`**: Returns matching pairs across both tables.
- **`LEFT JOIN`**: Retains complete records from the parent (left) table while dynamically appending matched entries. Used to detect orphans (e.g., *find departments with no active employees*).
- **`SELF JOIN`**: Query referencing the same table twice to evaluate hierarchal relationships (e.g., *matching employees with their managers in the same entity*).

### 3. Window Analytic Functions vs. Simple Aggregates
Simple aggregates collapse our row count into group structures. Window functions (`OVER()`) maintain structural identity (retains individual employee rows) while calculating a run-rate, partition rank, or sliding frame on top.
