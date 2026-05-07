--Day1 SQL BASICS
-- 1. Select all columns from the Employee table.
SELECT * FROM Employee;

-- 2. Select only the name and salary columns from the Employee table.
SELECT name, salary FROM Employee;

-- 3. Select employees who are older than 30.
SELECT * FROM Employee WHERE age > 30;

-- 4. Select the names of all departments.
SELECT name FROM Department;

-- 5. Select employees who work in the IT department.
-- Note: Assuming IT department_id is 1 based on standard schema
SELECT * FROM Employee WHERE department_id = 1;

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

-- 11. Select employees who joined in 2021.
SELECT * FROM Employee WHERE YEAR(joining_date) = 2021;

-- 12. Select employees who joined in January of any year.
SELECT * FROM Employee WHERE MONTH(joining_date) = 1;

-- 13. Select employees who joined after '2022-01-01'.
SELECT * FROM Employee WHERE joining_date > '2022-01-01';

-- 14. Select the number of employees who joined each year.
SELECT YEAR(joining_date) AS join_year, COUNT(*) AS emp_count
FROM Employee
GROUP BY YEAR(joining_date);

-- 15. Select the day of the week each employee joined.
SELECT name, DAYNAME(joining_date) AS join_day FROM Employee;

-- 16. Select employees who are either in the 'IT' or 'HR' department.
SELECT * FROM Employee WHERE department_id IN (1, 2);

-- 17. Select employees who earn between 50000 and 80000.
SELECT * FROM Employee WHERE salary BETWEEN 50000 AND 80000;

-- 18. Select employees who are older than 25 and earn more than 60000.
SELECT * FROM Employee WHERE age > 25 AND salary > 60000;

-- 19. Select employees who do not work in the 'Finance' department.
SELECT * FROM Employee WHERE department_id != 3;

-- 20. Select employees whose salary is not null.
SELECT * FROM Employee WHERE salary IS NOT NULL;

-- 21. Select the total salary paid to all employees.
SELECT SUM(salary) AS total_payroll FROM Employee;

-- 22. Select the average age of employees.
SELECT AVG(age) AS average_age FROM Employee;

-- 23. Select the maximum and minimum salary in the company.
SELECT MAX(salary) AS max_salary, MIN(salary) AS min_salary FROM Employee;

-- 24. Select the number of employees in each department.
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

-- 25. Select the average salary of employees in each department.
SELECT department_id, AVG(salary) AS avg_dept_salary
FROM Employee
GROUP BY department_id;

-- 26. Select employees ordered by their salary in descending order.
SELECT * FROM Employee ORDER BY salary DESC;

-- 27. Select the first 5 employees from the Employee table.
SELECT * FROM Employee LIMIT 5;

-- 28. Select the department names in alphabetical order.
SELECT name FROM Department ORDER BY name ASC;

-- 29. Select the oldest employee.
SELECT * FROM Employee ORDER BY age DESC LIMIT 1;

-- 30. Select the top 3 highest-paid employees.
SELECT * FROM Employee ORDER BY salary DESC LIMIT 3;
