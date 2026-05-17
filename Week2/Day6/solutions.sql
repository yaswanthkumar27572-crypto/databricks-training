-- ==========================================
-- 1. TABLE CREATION & DATA INSERTION
-- ==========================================

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    city VARCHAR(50),
    salary VARCHAR(20),
    remarks VARCHAR(200)
);

INSERT INTO employees VALUES
(1, 'Karthik Kondpak', 'karthik.k@gmail.com', 'Data Engineering', 'Hyderabad', '75000', ' Top performer '),
(2, 'Veena Reddy', 'veena_r@company.com', 'Analytics', 'Bangalore', '65000', 'Excellent communication'),
(3, 'Ravi kumar', 'ravi.kumar@org.in', 'Data Science', 'Chennai', '85000', 'Needs improvement'),
(4, 'Anil', 'anil@abc.com', 'DEVOPS', 'Pune', '70000', NULL),
(5, ' Suresh ', 'suresh@xyz.com', 'data engineering', ' hyderabad ', '60000', ' ');


-- ==========================================
-- 2. STRING FUNCTIONS QUERIES
-- ==========================================

-- 1. LENGTH / CHAR_LENGTH: Returns number of characters
SELECT full_name, LENGTH(full_name) FROM employees;
SELECT full_name, CHAR_LENGTH(full_name) FROM employees;

-- 2. UPPER / LOWER: Convert case
SELECT UPPER(department), LOWER(city) FROM employees;

-- 3. TRIM / LTRIM / RTRIM: Remove spaces
SELECT 
    TRIM(full_name), 
    LTRIM(full_name), 
    RTRIM(full_name) 
FROM employees;

-- 4. CONCAT: Join strings
SELECT CONCAT(full_name, ' - ', department) AS emp_details 
FROM employees;

-- 5. CONCAT_WS: Join strings with separator
SELECT CONCAT_WS(' | ', emp_id, full_name, city) 
FROM employees;

-- 6. SUBSTRING / SUBSTR / MID: Extract part of string
SELECT SUBSTRING(email, 1, 7) FROM employees;
SELECT SUBSTR(email, 1, 5) FROM employees;

-- 7. LEFT / RIGHT: Extract characters from left or right
SELECT LEFT(full_name, 4), RIGHT(city, 3) 
FROM employees;

-- 8. INSTR: Position of substring
SELECT email, INSTR(email, '@') FROM employees;

-- 9. LOCATE: Position of substring (flexible)
SELECT email, LOCATE('.', email) FROM employees;

-- 10. REPLACE: Replace substring
SELECT REPLACE(department, 'Data', 'Big Data') 
FROM employees;

-- 11. REVERSE: Reverse a string
SELECT full_name, REVERSE(full_name) 
FROM employees;

-- 12. LPAD / RPAD: Pad characters on left or right
SELECT LPAD(emp_id, 5, '0') FROM employees;
SELECT RPAD(city, 15, '*') FROM employees;

-- 13. TRIM + REPLACE (Combined Usage): Clear whitespace anomalies
SELECT TRIM(REPLACE(city, ' ', '')) FROM employees;

-- 14. IFNULL: Handle NULL strings
SELECT full_name, IFNULL(remarks, 'No remarks') 
FROM employees;

-- 15. COALESCE: Return first non-NULL value
SELECT full_name, COALESCE(remarks, 'N/A') 
FROM employees;

-- 16. FIND_IN_SET: Search value in a comma-separated list (CSV)
SELECT FIND_IN_SET('Analytics', 'Data,Analytics,AI');
