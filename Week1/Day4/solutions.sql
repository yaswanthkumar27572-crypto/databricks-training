-- SQL Assignment: Window Functions and CTEs

-- 1. Use ROW_NUMBER() to assign a row number to employees ordered by salary descending.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- 2. Use RANK() to rank employees by salary.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- 3. Use DENSE_RANK() to rank employees by salary.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_dense_rank
FROM employees;

-- 4. Find the top 3 highest-paid employees using a window function.
WITH RankedEmployees AS (
    SELECT 
        employee_id, 
        employee_name, 
        department, 
        salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT employee_id, employee_name, department, salary
FROM RankedEmployees
WHERE rnk <= 3;

-- 5. Rank employees within each department using PARTITION BY.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_salary_rank
FROM employees;

-- 6. Display the highest salary in each department using a window function.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    MAX(salary) OVER (PARTITION BY department) AS max_dept_salary
FROM employees;

-- 7. Calculate the running total of order amounts ordered by order_date.
SELECT 
    order_id, 
    customer_id, 
    order_date, 
    total_amount,
    SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

-- 8. Calculate the cumulative sales amount for each employee.
SELECT 
    order_id, 
    employee_id, 
    order_date, 
    total_amount,
    SUM(total_amount) OVER (PARTITION BY employee_id ORDER BY order_date) AS cumulative_employee_sales
FROM orders;

-- 9. Use LAG() to show the previous order amount for each customer.
SELECT 
    order_id, 
    customer_id, 
    order_date, 
    total_amount,
    LAG(total_amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_amount
FROM orders;

-- 10. Use LEAD() to show the next order amount for each customer.
SELECT 
    order_id, 
    customer_id, 
    order_date, 
    total_amount,
    LEAD(total_amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS next_order_amount
FROM orders;

-- 11. Find the difference between the current order amount and previous order amount.
WITH OrderDifferences AS (
    SELECT 
        order_id, 
        customer_id, 
        order_date, 
        total_amount,
        LAG(total_amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS prev_amount
    FROM orders
)
SELECT 
    order_id, 
    customer_id, 
    order_date, 
    total_amount,
    prev_amount,
    (total_amount - COALESCE(prev_amount, 0)) AS amount_difference
FROM OrderDifferences;

-- 12. Calculate a moving average of the last 3 orders.
SELECT 
    order_id, 
    customer_id, 
    order_date, 
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY order_date 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_3_orders
FROM orders;

-- 13. Use NTILE(4) to divide employees into salary quartiles.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;

-- 14. Find the first order placed by each customer using ROW_NUMBER().
WITH FirstOrders AS (
    SELECT 
        order_id, 
        customer_id, 
        order_date, 
        total_amount,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date ASC) AS rn
    FROM orders
)
SELECT order_id, customer_id, order_date, total_amount
FROM FirstOrders
WHERE rn = 1;

-- 15. Find the latest order placed by each customer.
WITH LatestOrders AS (
    SELECT 
        order_id, 
        customer_id, 
        order_date, 
        total_amount,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date DESC) AS rn
    FROM orders
)
SELECT order_id, customer_id, order_date, total_amount
FROM LatestOrders
WHERE rn = 1;

-- 16. Display employee salaries along with department average salary.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary
FROM employees;

-- 17. Find employees earning above their department average salary.
WITH DeptSalaryInfo AS (
    SELECT 
        employee_id, 
        employee_name, 
        department, 
        salary,
        AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary
    FROM employees
)
SELECT employee_id, employee_name, department, salary, dept_avg_salary
FROM DeptSalaryInfo
WHERE salary > dept_avg_salary;

-- 18. Use SUM() OVER(PARTITION BY department) to calculate department payroll.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    SUM(salary) OVER (PARTITION BY department) AS department_payroll
FROM employees;

-- 19. Find the percentage contribution of each employee salary within their department.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    ROUND((salary * 100.0) / SUM(salary) OVER (PARTITION BY department), 2) AS pct_contribution
FROM employees;

-- 20. Use COUNT() OVER() to show total number of employees alongside each row.
SELECT 
    employee_id, 
    employee_name, 
    department, 
    salary,
    COUNT(*) OVER () AS total_employee_count
FROM employees;

-- 21. Create a CTE to calculate total sales per employee.
WITH EmployeeSales AS (
    SELECT 
        employee_id, 
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
)
SELECT 
    e.employee_id, 
    e.employee_name, 
    COALESCE(es.total_sales, 0) AS total_sales
FROM employees e
LEFT JOIN EmployeeSales es ON e.employee_id = es.employee_id;

-- 22. Use a CTE to find employees whose sales exceed the company average.
WITH EmployeeSales AS (
    SELECT 
        employee_id, 
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
),
AvgCompanySales AS (
    SELECT AVG(total_sales) AS company_avg_sales 
    FROM EmployeeSales
)
SELECT 
    e.employee_name, 
    es.total_sales
FROM EmployeeSales es
JOIN employees e ON es.employee_id = e.employee_id
CROSS JOIN AvgCompanySales acs
WHERE es.total_sales > acs.company_avg_sales;

-- 23. Create multiple CTEs to calculate customer total spending and rankings.
WITH CustomerSpending AS (
    SELECT 
        customer_id, 
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
),
CustomerRankings AS (
    SELECT 
        customer_id, 
        total_spent,
        DENSE_RANK() OVER (ORDER BY total_spent DESC) AS spend_rank
    FROM CustomerSpending
)
SELECT customer_id, total_spent, spend_rank
FROM CustomerRankings;

-- 24. Write a recursive CTE to generate numbers from 1 to 10.
WITH RECURSIVE NumberGenerator AS (
    SELECT 1 AS num
    UNION ALL
    SELECT num + 1 
    FROM NumberGenerator 
    WHERE num < 10
)
SELECT num FROM NumberGenerator;

-- 25. Use a recursive CTE to display employee hierarchy data.
-- Note: Assuming an optional 'manager_id' column exists in employees table for representation.
WITH RECURSIVE EmployeeHierarchy AS (
    -- Anchor member: employees with no managers (Top level)
    SELECT 
        employee_id, 
        employee_name, 
        department, 
        salary,
        1 AS org_level
    FROM employees
    WHERE employee_id = 4 -- Diana Prince as top boss for schema example
    
    UNION ALL
    
    -- Recursive member: Joining subordinates
    SELECT 
        e.employee_id, 
        e.employee_name, 
        e.department, 
        e.salary,
        eh.org_level + 1
    FROM employees e
    INNER JOIN EmployeeHierarchy eh ON e.employee_id = eh.employee_id + 1 -- Mock hierarchy step link
    WHERE eh.org_level < 4
)
SELECT * FROM EmployeeHierarchy;

-- 26. Create a CTE that filters orders above the average order amount.
WITH AvgOrder AS (
    SELECT AVG(total_amount) AS avg_amount FROM orders
)
SELECT o.* FROM orders o
CROSS JOIN AvgOrder ao
WHERE o.total_amount > ao.avg_amount;

-- 27. Use a CTE and window function together to rank customers by total spending.
WITH CustomerTotals AS (
    SELECT 
        customer_id, 
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)
SELECT 
    customer_id, 
    total_spent,
    RANK() OVER (ORDER BY total_spent DESC) AS customer_rank
FROM CustomerTotals;

-- 28. Find the second-highest salary in each department.
WITH SalaryRankings AS (
    SELECT 
        employee_name,
        department,
        salary,
        DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT department, employee_name, salary
FROM SalaryRankings
WHERE rnk = 2;

-- 29. Display the difference between each employee salary and the department maximum salary.
WITH DeptMax AS (
    SELECT 
        employee_id,
        employee_name,
        department,
        salary,
        MAX(salary) OVER (PARTITION BY department) AS max_dept_salary
    FROM employees
)
SELECT 
    employee_name, 
    department, 
    salary, 
    max_dept_salary,
    (max_dept_salary - salary) AS salary_diff_from_max
FROM DeptMax;

-- 30. Combine CTEs and window functions to find the top-performing employee in each department based on total sales.
WITH EmployeeTotalSales AS (
    SELECT 
        employee_id, 
        SUM(total_amount) AS total_sales
    FROM orders
    GROUP BY employee_id
),
RankedPerformers AS (
    SELECT 
        e.employee_name,
        e.department,
        COALESCE(ets.total_sales, 0) AS total_sales,
        ROW_NUMBER() OVER (PARTITION BY e.department ORDER BY COALESCE(ets.total_sales, 0) DESC) AS performance_rank
    FROM employees e
    LEFT JOIN EmployeeTotalSales ets ON e.employee_id = ets.employee_id
)
SELECT department, employee_name, total_sales
FROM RankedPerformers
WHERE performance_rank = 1;


-- =========================================================================
-- BONUS CHALLENGE
-- =========================================================================
-- Report showing monthly sales trends using CTEs, Running totals, LAG(), and Percentage growth.

WITH MonthlySales AS (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
        SUM(total_amount) AS monthly_sales
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
),
SalesTrends AS (
    SELECT 
        sales_month,
        monthly_sales,
        SUM(monthly_sales) OVER (ORDER BY sales_month) AS running_total_sales,
        LAG(monthly_sales, 1) OVER (ORDER BY sales_month) AS previous_month_sales
    FROM MonthlySales
)
SELECT 
    sales_month,
    monthly_sales,
    running_total_sales,
    COALESCE(previous_month_sales, 0) AS previous_month_sales,
    ROUND(
        CASE 
            WHEN previous_month_sales IS NULL THEN 0.00
            ELSE ((monthly_sales - previous_month_sales) * 100.0) / previous_month_sales 
        END, 
        2
    ) AS monthly_growth_percentage
FROM SalesTrends;
