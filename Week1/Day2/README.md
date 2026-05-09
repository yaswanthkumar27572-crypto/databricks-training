
# SQL Advanced Filters & Aggregations (Day 2)

## Overview
Today's training session was designed to deepen understanding of essential SQL filtering, grouping, logical conditions, and string matching techniques. This repository directory contains a single `solutions.sql` file featuring **55 queries** crafted to parse, slice, and consolidate employee records based on complex corporate scenarios.

## Day 2 Progress Map
The queries target the following 11 architectural segments of data querying:

- [x] **Section 1**: Projections & Standard Queries (1–5)
- [x] **Section 2**: Simple Criteria Filtering with `WHERE` (6–10)
- [x] **Section 3**: Categorical Aggregations using `GROUP BY` (11–15)
- [x] **Section 4**: Post-aggregation constraints using `HAVING` (16–20)
- [x] **Section 5**: Window-boundary emulation using `LIMIT` / `TOP` (21–25)
- [x] **Section 6**: Redundancy Elimination via `DISTINCT` (26–30)
- [x] **Section 7**: Direct Comparison Operators (`>=`, `<=`, `<>`) (31–35)
- [x] **Section 8**: Multiple-Condition Logic (`AND`, `OR`, `NOT`) (36–40)
- [x] **Section 9**: Set Membership (`IN` / `NOT IN`) (41–45)
- [x] **Section 10**: Numerical & ID Range Scopes (`BETWEEN`) (46–50)
- [x] **Section 11**: Text Wildcards & Pattern Recognition (`LIKE`) (51–55)

---

## Architectural SQL Takeaways

### 1. `GROUP BY` Multi-Group Evaluations
When utilizing aggregate calculations like `SUM()`, `AVG()`, `MAX()`, or `MIN()`, grouping allows us to collapse detailed tables into high-level business metrics.
```sql
SELECT department, SUM(salary) AS total_payroll 
FROM Employees 
GROUP BY department;
```

### 2. Eliminating Redundancy with `DISTINCT`
The `DISTINCT` keyword evaluates records on a row-by-row basis to clean out repeated listings. When applying `DISTINCT` over multiple columns (e.g., `DISTINCT department, city`), it evaluates unique **combinations** of the two, rather than treating them individually.

### 3. Wildcard Precision (`LIKE` Operators)
- `'R%'` : Matches any text starting with 'R' of any length.
- `'%a'` : Matches any text ending with 'a'.
- `'%v%'` : Matches strings containing 'v' at any index position.

---

## Testing Environment
- **Database Engine**: `MySQL 8.0` / `PostgreSQL 15` / `Databricks SQL`
- **Compiler Platform**: [DB Fiddle](https://www.db-fiddle.com/)

---
