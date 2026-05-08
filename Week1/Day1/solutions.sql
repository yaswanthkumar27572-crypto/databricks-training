-- Week 1 | Day 1 : Complete SQL Practice Solutions (65 Queries)

-- PART 1: BASIC QUERIES (1 - 5)

-- 1. Select all columns from the Employee table.
SELECT * FROM Employee;

-- 2. Select only the name and salary columns from the Employee table.
SELECT name, salary FROM Employee;

-- 3. Select employees who are older than 30.
SELECT * FROM Employee WHERE age > 30;

-- 4. Select the names of all departments.
SELECT name FROM Department;

-- 5. Select employees who work in the IT department.
-- Note: Based on the schema provided, IT department has department_id = 1
SELECT * FROM Employee WHERE department_id = 1;


-- =========================================================================
-- PART 2: STRING MATCHING QUERIES (6 - 10)
-- =========================================================================

-- 6. Select employees whose names start with 'J'.
SELECT * FROM Employee WHERE name LIKE 'J%';

-- 7. Select employees whose names end with 'e'.
SELECT * FROM Employee WHERE name LIKE '%e';

-- 8. Select employees whose names contain 'a'.
SELECT * FROM Employee WHERE name LIKE '%a%';

-- 9. Select employees whose names are exactly 9 characters long.
SELECT * FROM Employee WHERE LENGTH(name) = 9;

-- 10. Select employees whose names have 'o' as the second character.
SELECT * FROM Employee WHERE name LIKE '_o%';


-- =========================================================================
-- PART 3: DATE QUERIES (11 - 15)
-- =========================================================================

-- 11. Select employees hired in the year 2020.
SELECT * FROM Employee WHERE YEAR(hire_date) = 2020;

-- 12. Select employees hired in January of any year.
SELECT * FROM Employee WHERE MONTH(hire_date) = 1;

-- 13. Select employees hired before 2019.
SELECT * FROM Employee WHERE hire_date < '2019-01-01';

-- 14. Select employees hired on or after March 1, 2021.
SELECT * FROM Employee WHERE hire_date >= '2021-03-01';

-- 15. Select employees hired in the last 2 years.
-- Note: Adapting to dynamic database runtime. For static training context, 2 years from 2023 is used.
SELECT * FROM Employee WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);


-- =========================================================================
-- PART 4: AGGREGATE QUERIES (16 - 20)
-- =========================================================================

-- 16. Select the total salary of all employees.
SELECT SUM(salary) AS total_salary FROM Employee;

-- 17. Select the average salary of employees.
SELECT AVG(salary) AS average_salary FROM Employee;

-- 18. Select the minimum salary in the Employee table.
SELECT MIN(salary) AS minimum_salary FROM Employee;

-- 19. Select the number of employees in each department.
SELECT department_id, COUNT(*) AS employee_count 
FROM Employee 
GROUP BY department_id;

-- 20. Select the average salary of employees in each department.
SELECT department_id, AVG(salary) AS average_salary 
FROM Employee 
GROUP BY department_id;


-- =========================================================================
-- PART 5: GROUP BY QUERIES (21 - 25)
-- =========================================================================

-- 21. Select the total salary for each department.
SELECT department_id, SUM(salary) AS total_salary 
FROM Employee 
GROUP BY department_id;

-- 22. Select the average age of employees in each department.
SELECT department_id, AVG(age) AS average_age 
FROM Employee 
GROUP BY department_id;

-- 23. Select the number of employees hired in each year.
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employees_hired 
FROM Employee 
GROUP BY YEAR(hire_date);

-- 24. Select the highest salary in each department.
SELECT department_id, MAX(salary) AS highest_salary 
FROM Employee 
GROUP BY department_id;

-- 25. Select the department with the highest average salary.
SELECT department_id, AVG(salary) AS avg_salary 
FROM Employee 
GROUP BY department_id 
ORDER BY avg_salary DESC 
LIMIT 1;


-- =========================================================================
-- PART 6: HAVING QUERIES (26 - 30)
-- =========================================================================

-- 26. Select departments with more than 2 employees.
SELECT department_id, COUNT(*) AS employee_count 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 2;

-- 27. Select departments with an average salary greater than 55000.
SELECT department_id, AVG(salary) AS average_salary 
FROM Employee 
GROUP BY department_id 
HAVING AVG(salary) > 55000;

-- 28. Select years with more than 1 employee hired.
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employees_hired 
FROM Employee 
GROUP BY YEAR(hire_date) 
HAVING COUNT(*) > 1;

-- 29. Select departments with a total salary expense less than 100000.
SELECT department_id, SUM(salary) AS total_salary_expense 
FROM Employee 
GROUP BY department_id 
HAVING SUM(salary) < 100000;

-- 30. Select departments with the maximum salary above 75000.
SELECT department_id, MAX(salary) AS max_salary 
FROM Employee 
GROUP BY department_id 
HAVING MAX(salary) > 75000;


-- =========================================================================
-- PART 7: ORDER BY QUERIES (31 - 35)
-- =========================================================================

-- 31. Select all employees ordered by their salary in ascending order.
SELECT * FROM Employee ORDER BY salary ASC;

-- 32. Select all employees ordered by their age in descending order.
SELECT * FROM Employee ORDER BY age DESC;

-- 33. Select all employees ordered by their hire date in ascending order.
SELECT * FROM Employee ORDER BY hire_date ASC;

-- 34. Select employees ordered by their department and then by their salary.
SELECT * FROM Employee ORDER BY department_id ASC, salary DESC;

-- 35. Select departments ordered by the total salary of their employees.
SELECT department_id, SUM(salary) AS total_salary 
FROM Employee 
GROUP BY department_id 
ORDER BY total_salary ASC;


-- =========================================================================
-- PART 8: JOIN QUERIES (36 - 45)
-- =========================================================================

-- 36. Select employee names along with their department names.
SELECT e.name AS employee_name, d.name AS department_name 
FROM Employee e
INNER JOIN Department d ON e.department_id = d.department_id;

-- 37. Select project names along with the department names they belong to.
SELECT p.name AS project_name, d.name AS department_name 
FROM Project p
INNER JOIN Department d ON p.department_id = d.department_id;

-- 38. Select employee names and their corresponding project names.
SELECT e.name AS employee_name, p.name AS project_name 
FROM Employee e
INNER JOIN Project p ON e.department_id = p.department_id;

-- 39. Select all employees and their departments, including those without a department.
SELECT e.name AS employee_name, d.name AS department_name 
FROM Employee e
LEFT JOIN Department d ON e.department_id = d.department_id;

-- 40. Select all departments and their employees, including departments without employees.
SELECT d.name AS department_name, e.name AS employee_name 
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id;

-- 41. Select employees who are not assigned to any project.
-- Note: Assuming project assignment is linked through matching department_id
SELECT e.name AS employee_name 
FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
WHERE p.project_id IS NULL;

-- 42. Select employees and the number of projects their department is working on.
SELECT e.name AS employee_name, COUNT(p.project_id) AS project_count 
FROM Employee e
LEFT JOIN Project p ON e.department_id = p.department_id
GROUP BY e.emp_id, e.name;

-- 43. Select the departments that have no employees.
SELECT d.name AS department_name 
FROM Department d
LEFT JOIN Employee e ON d.department_id = e.department_id
WHERE e.emp_id IS NULL;

-- 44. Select employee names who share the same department with 'John Doe'.
SELECT name FROM Employee 
WHERE department_id = (SELECT department_id FROM Employee WHERE name = 'John Doe')
  AND name != 'John Doe';

-- 45. Select the department name with the highest average salary.
SELECT d.name AS department_name 
FROM Department d
INNER JOIN Employee e ON d.department_id = e.department_id
GROUP BY d.department_id, d.name
ORDER BY AVG(e.salary) DESC 
LIMIT 1;


-- =========================================================================
-- PART 9: NESTED AND CORRELATED QUERIES (46 - 55)
-- =========================================================================

-- 46. Select the employee with the highest salary.
SELECT * FROM Employee 
WHERE salary = (SELECT MAX(salary) FROM Employee);

-- 47. Select employees whose salary is above the average salary.
SELECT * FROM Employee 
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- 48. Select the second highest salary from the Employee table.
SELECT MAX(salary) FROM Employee 
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- 49. Select the department with the most employees.
SELECT department_id 
FROM Employee 
GROUP BY department_id 
ORDER BY COUNT(*) DESC 
LIMIT 1;

-- 50. Select employees who earn more than the average salary of their department.
SELECT * FROM Employee e
WHERE salary > (
    SELECT AVG(salary) 
    FROM Employee 
    WHERE department_id = e.department_id
);

-- 51. Select the nth highest salary (for example, 3rd highest using OFFSET).
SELECT DISTINCT salary 
FROM Employee 
ORDER BY salary DESC 
LIMIT 1 OFFSET 2; -- Change OFFSET to (N-1) to get the Nth highest salary

-- 52. Select employees who are older than all employees in the HR department.
-- Note: HR department_id is 2
SELECT * FROM Employee 
WHERE age > ALL (
    SELECT age 
    FROM Employee 
    WHERE department_id = 2
);

-- 53. Select departments where the average salary is greater than 55000.
SELECT department_id 
FROM Employee 
GROUP BY department_id 
HAVING AVG(salary) > 55000;

-- 54. Select employees who work in a department with at least 2 projects.
SELECT * FROM Employee 
WHERE department_id IN (
    SELECT department_id 
    FROM Project 
    GROUP BY department_id 
    HAVING COUNT(project_id) >= 2
);

-- 55. Select employees who were hired on the same date as 'Jane Smith'.
SELECT * FROM Employee 
WHERE hire_date = (SELECT hire_date FROM Employee WHERE name = 'Jane Smith')
  AND name != 'Jane Smith';


-- =========================================================================
-- PART 10: COMBINED MODERATE DIFFICULTY QUERIES (56 - 65)
-- =========================================================================

-- 56. Select the total salary of employees hired in the year 2020.
SELECT SUM(salary) AS total_salary_2020 
FROM Employee 
WHERE YEAR(hire_date) = 2020;

-- 57. Select the average salary of employees in each department, ordered by the average salary in descending order.
SELECT department_id, AVG(salary) AS avg_salary 
FROM Employee 
GROUP BY department_id 
ORDER BY avg_salary DESC;

-- 58. Select departments with more than 1 employee and an average salary greater than 55000.
SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 1 AND AVG(salary) > 55000;

-- 59. Select employees hired in the last 2 years, ordered by their hire date.
-- Note: Fallback to static mock timeline or dynamic logic
SELECT * FROM Employee 
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR) 
ORDER BY hire_date ASC;

-- 60. Select the total number of employees and the average salary for departments with more than 2 employees.
SELECT department_id, COUNT(*) AS total_employees, AVG(salary) AS average_salary 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 2;

-- 61. Select the name and salary of employees whose salary is above the average salary of their department.
SELECT e.name, e.salary 
FROM Employee e
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM Employee 
    WHERE department_id = e.department_id
);

-- 62. Select the names of employees who are hired on the same date as the oldest employee in the company.
SELECT name FROM Employee 
WHERE hire_date = (
    SELECT hire_date 
    FROM Employee 
    WHERE age = (SELECT MAX(age) FROM Employee)
);

-- 63. Select the department names along with the total number of projects they are working on, ordered by the number of projects.
SELECT d.name AS department_name, COUNT(p.project_id) AS project_count 
FROM Department d
LEFT JOIN Project p ON d.department_id = p.department_id
GROUP BY d.department_id, d.name
ORDER BY project_count ASC;

-- 64. Select the employee name with the highest salary in each department.
SELECT e.name, e.department_id, e.salary 
FROM Employee e
WHERE e.salary = (
    SELECT MAX(salary) 
    FROM Employee 
    WHERE department_id = e.department_id
);

-- 65. Select the names and salaries of employees who are older than the average age of employees in their department.
SELECT e.name, e.salary 
FROM Employee e
WHERE e.age > (
    SELECT AVG(age) 
    FROM Employee 
    WHERE department_id = e.department_id
);
