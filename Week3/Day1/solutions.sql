-- ==========================================
-- 1. TABLE CREATION AND DATA INSERTION
-- ==========================================


CREATE TABLE employees (    
    emp_id INT,    
    emp_name VARCHAR(50),    
    department VARCHAR(50),    
    salary INT,    
    join_date DATE
);

INSERT INTO employees VALUES
(1, 'Amit', 'Chennai', 2000, '2023-01-01'),
(2, 'Ravi', 'Hyderabad', 1500, '2023-01-02'),
(3, 'Sneha', 'Chennai', 3000, '2023-01-03'),
(4, 'Kiran', 'Bangalore', 2500, '2023-01-04'),
(5, 'Priya', 'Chennai', 2000, '2023-01-05'),
(6, 'Arjun', 'Hyderabad', 1800, '2023-01-06'),
(7, 'Neha', 'Bangalore', 2200, '2023-01-07'),
(8, 'Vikas', 'Chennai', 3000, '2023-01-08'),
(9, 'Anjali', 'Hyderabad', 1700, '2023-01-09'),
(10, 'Rahul', 'Bangalore', 2600, '2023-01-10'),
(11, 'Suresh', 'Chennai', 2800, '2023-01-11'),
(12, 'Pooja', 'Hyderabad', 1600, '2023-01-12'),
(13, 'Manoj', 'Bangalore', 2400, '2023-01-13'),
(14, 'Divya', 'Chennai', 2100, '2023-01-14'),
(15, 'Karthik', 'Hyderabad', 1900, '2023-01-15'),
(16, 'Meena', 'Bangalore', 2300, '2023-01-16'),
(17, 'Raj', 'Chennai', 2700, '2023-01-17'),
(18, 'Simran', 'Hyderabad', 2000, '2023-01-18'),
(19, 'Deepak', 'Bangalore', 2500, '2023-01-19'),
(20, 'Nisha', 'Chennai', 2600, '2023-01-20');


-- ==========================================
-- 2. ROW_NUMBER() ONLY QUESTIONS
-- ==========================================

-- Q: Assign a unique row number to all employees based on salary (highest first).
SELECT *, 
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num 
FROM employees;

-- Q: Assign row numbers to employees within each department based on salary descending.
SELECT *, 
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num 
FROM employees;

-- Q: Assign row numbers based on employee joining date (latest first).
SELECT *, 
       ROW_NUMBER() OVER(ORDER BY join_date DESC) AS row_num 
FROM employees;

-- Q: Assign row numbers within each department based on earliest joining date.
SELECT *, 
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY join_date ASC) AS row_num 
FROM employees;

-- Q: Assign row numbers to orders based on order date.
-- Note: Mapped to employee join_date as per the dataset schema.
SELECT *, 
       ROW_NUMBER() OVER(ORDER BY join_date ASC) AS row_num 
FROM employees;

-- Q: Assign row numbers to orders within each city based on order amount (highest first).
-- Note: Mapped to department and salary as per the dataset schema.
SELECT *, 
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num 
FROM employees;

-- Q: Assign row numbers to employees based on salary (lowest first).
SELECT *, 
       ROW_NUMBER() OVER(ORDER BY salary ASC) AS row_num 
FROM employees;

-- Q: Assign row numbers within department for employees based on name alphabetically.
SELECT *, 
       ROW_NUMBER() OVER(PARTITION BY department ORDER BY emp_name ASC) AS row_num 
FROM employees;


-- ==========================================
-- 3. RANK() ONLY QUESTIONS
-- ==========================================

-- Q: Rank all employees based on salary (highest first).
SELECT *, 
       RANK() OVER(ORDER BY salary DESC) AS rank_num 
FROM employees;

-- Q: Rank employees within each department based on salary.
SELECT *, 
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_num 
FROM employees;

-- Q: Rank employees based on joining date (latest gets rank 1).
SELECT *, 
       RANK() OVER(ORDER BY join_date DESC) AS rank_num 
FROM employees;

-- Q: Rank orders based on order amount (highest first).
-- Note: Mapped to salary as per the dataset schema.
SELECT *, 
       RANK() OVER(ORDER BY salary DESC) AS rank_num 
FROM employees;

-- Q: Rank orders within each city based on order amount.
-- Note: Mapped to department and salary as per the dataset schema.
SELECT *, 
       RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank_num 
FROM employees;

-- Q: Rank employees within department based on salary (lowest first).
SELECT *, 
       RANK() OVER(PARTITION BY department ORDER BY salary ASC) AS rank_num 
FROM employees;

-- Q: Rank employees based on name alphabetically.
SELECT *, 
       RANK() OVER(ORDER BY emp_name ASC) AS rank_num 
FROM employees;

-- Q: Rank orders within each city based on order date.
-- Note: Mapped to department and join_date as per the dataset schema.
SELECT *, 
       RANK() OVER(PARTITION BY department ORDER BY join_date ASC) AS rank_num 
FROM employees;


-- ==========================================
-- 4. DENSE_RANK() ONLY QUESTIONS
-- ==========================================

-- Q: Assign dense rank to employees based on salary (highest first).
SELECT *, 
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rnk 
FROM employees;

-- Q: Assign dense rank within each department based on salary.
SELECT *, 
       DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rnk 
FROM employees;

-- Q: Assign dense rank to employees based on joining date.
SELECT *, 
       DENSE_RANK() OVER(ORDER BY join_date ASC) AS dense_rnk 
FROM employees;

-- Q: Assign dense rank to orders based on order amount.
-- Note: Mapped to salary as per the dataset schema.
SELECT *, 
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rnk 
FROM employees;

-- Q: Assign dense rank within each city based on order amount.
-- Note: Mapped to department and salary as per the dataset schema.
SELECT *, 
       DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rnk 
FROM employees;

-- Q: Assign dense rank to employees based on salary (lowest first).
SELECT *, 
       DENSE_RANK() OVER(ORDER BY salary ASC) AS dense_rnk 
FROM employees;

-- Q: Assign dense rank within department based on joining date.
SELECT *, 
       DENSE_RANK() OVER(PARTITION BY department ORDER BY join_date ASC) AS dense_rnk 
FROM employees;

-- Q: Assign dense rank to orders based on order date.
-- Note: Mapped to join_date as per the dataset schema.
SELECT *, 
       DENSE_RANK() OVER(ORDER BY join_date ASC) AS dense_rnk 
FROM employees;
