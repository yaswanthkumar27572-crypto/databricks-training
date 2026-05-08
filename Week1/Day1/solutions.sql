
-- Week 1 | Day 1 : Comprehensive SQL Practice Solutions (65 Queries)


-- 1. Select all columns from the Employee table.
SELECT * FROM Employee;

-- 2. Select only the name and salary columns from the Employee table.
SELECT name, salary FROM Employee;

-- 3. Select employees who are older than 30.
SELECT * FROM Employee WHERE age > 30;

-- 4. Select the names of all departments.
SELECT name FROM Department;

-- 5. Select employees who work in the IT department (assuming department_id = 1).
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

-- 16. Select employees who are either in the 'IT' or 'HR' department (assuming department_ids 1, 2).
SELECT * FROM Employee WHERE department_id IN (1, 2);

-- 17. Select employees who earn between 50000 and 80000.
SELECT * FROM Employee WHERE salary BETWEEN 50000 AND 80000;

-- 18. Select employees who are older than 25 and earn more than 60000.
SELECT * FROM Employee WHERE age > 25 AND salary > 60000;

-- 19. Select employees who do not work in the 'Finance' department (assuming Finance department_id = 3).
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

-- 31. Select departments with more than 5 employees.
SELECT department_id, COUNT(*) AS emp_count 
FROM Employee 
GROUP BY department_id 
HAVING COUNT(*) > 5;

-- 32. Select departments where the total salary bill exceeds 250,000.
SELECT department_id, SUM(salary) AS total_salary 
FROM Employee 
GROUP BY department_id 
HAVING SUM(salary) > 250000;

-- 33. Select departments where the average age of employees is over 28.
SELECT department_id, AVG(age) AS avg_age 
FROM Employee 
GROUP BY department_id 
HAVING AVG(age) > 28;

-- 34. Select job titles (designations) with an average salary greater than 50000.
SELECT designation, AVG(salary) AS avg_sal 
FROM Employee 
GROUP BY designation 
HAVING AVG(salary) > 50000;

-- 35. Find departments with at least 2 employees earning more than 60000.
SELECT department_id, COUNT(*) AS high_earners 
FROM Employee 
WHERE salary > 60000 
GROUP BY department_id 
HAVING COUNT(*) >= 2;

-- 36. Select employee names along with their department names (Inner Join).
SELECT e.name AS employee_name, d.name AS department_name 
FROM Employee e
INNER JOIN Department d ON e.department_id = d.id;

-- 37. Display all departments and any employees assigned to them (Left Join).
SELECT d.name AS department_name, e.name AS employee_name 
FROM Department d
LEFT JOIN Employee e ON d.id = e.department_id;

-- 38. Display all employees and their project names (assuming a Project and Employee_Project table exists).
SELECT e.name AS employee_name, p.name AS project_name 
FROM Employee e
INNER JOIN Employee_Project ep ON e.id = ep.employee_id
INNER JOIN Project p ON ep.project_id = p.id;

-- 39. Find employees who do not belong to any department.
SELECT e.name 
FROM Employee e
LEFT JOIN Department d ON e.department_id = d.id
WHERE e.department_id IS NULL;

-- 40. Find departments that have no employees.
SELECT d.name 
FROM Department d
LEFT JOIN Employee e ON d.id = e.department_id
WHERE e.id IS NULL;

-- 41. Join Employee, Department, and Project tables to show employee details, their department, and their assigned projects.
SELECT e.name AS employee_name, d.name AS department_name, p.name AS project_name 
FROM Employee e
INNER JOIN Department d ON e.department_id = d.id
INNER JOIN Employee_Project ep ON e.id = ep.employee_id
INNER JOIN Project p ON ep.project_id = p.id;

-- 42. Display employees who work on the project 'Phoenix' (assuming project name is 'Phoenix').
SELECT e.* FROM Employee e
INNER JOIN Employee_Project ep ON e.id = ep.employee_id
INNER JOIN Project p ON ep.project_id = p.id
WHERE p.name = 'Phoenix';

-- 43. Display departments located in 'Chicago' (assuming location is a column in Department).
SELECT * FROM Department WHERE location = 'Chicago';

-- 44. Get employee name and their manager's name (Self Join - assuming manager_id column exists in Employee).
SELECT e.name AS employee_name, m.name AS manager_name 
FROM Employee e
LEFT JOIN Employee m ON e.manager_id = m.id;

-- 45. Find all employees who earn more than their manager.
SELECT e.name AS employee_name, e.salary AS employee_salary, m.name AS manager_name, m.salary AS manager_salary 
FROM Employee e
INNER JOIN Employee m ON e.manager_id = m.id
WHERE e.salary > m.salary;

-- 46. Find employees who earn more than the overall average company salary.
SELECT * FROM Employee 
WHERE salary > (SELECT AVG(salary) FROM Employee);

-- 47. Find employees who earn the highest salary in their respective department.
SELECT * FROM Employee e
WHERE salary = (
    SELECT MAX(salary) 
    FROM Employee 
    WHERE department_id = e.department_id
);

-- 48. Select departments that have an average salary higher than the company's average salary.
SELECT department_id, AVG(salary) 
FROM Employee 
GROUP BY department_id 
HAVING AVG(salary) > (SELECT AVG(salary) FROM Employee);

-- 49. Find the second highest salary in the company.
SELECT MAX(salary) FROM Employee 
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- 50. Find employees who are younger than the average age of the department they work in.
SELECT * FROM Employee e
WHERE age < (
    SELECT AVG(age) 
    FROM Employee 
    WHERE department_id = e.department_id
);

-- 51. Find departments with at least one employee earning more than 90000 (Using EXISTS).
SELECT d.name 
FROM Department d
WHERE EXISTS (
    SELECT 1 FROM Employee e 
    WHERE e.department_id = d.id AND e.salary > 90000
);

-- 52. Select employees who do not work on any project (Using NOT IN).
SELECT * FROM Employee 
WHERE id NOT IN (SELECT DISTINCT employee_id FROM Employee_Project);

-- 53. Find the department with the maximum number of employees.
SELECT department_id, COUNT(*) AS emp_count 
FROM Employee 
GROUP BY department_id 
ORDER BY emp_count DESC 
LIMIT 1;

-- 54. Get employees who joined on the same date as 'John Doe' (assuming name 'John Doe').
SELECT * FROM Employee 
WHERE joining_date = (SELECT joining_date FROM Employee WHERE name = 'John Doe')
AND name != 'John Doe';

-- 55. Find the employee who has the lowest salary but is older than 40.
SELECT * FROM Employee 
WHERE age > 40 
ORDER BY salary ASC 
LIMIT 1;

-- 56. Classify employees into salary brackets (High, Medium, Low) using CASE.
SELECT name, salary,
       CASE 
           WHEN salary >= 80000 THEN 'High'
           WHEN salary >= 50000 AND salary < 80000 THEN 'Medium'
           ELSE 'Low'
       END AS salary_bracket
FROM Employee;

-- 57. Classify employees based on experience (Senior: joined before 2020, Mid: 2020-2023, Junior: after 2023).
SELECT name, joining_date,
       CASE 
           WHEN joining_date < '2020-01-01' THEN 'Senior'
           WHEN joining_date BETWEEN '2020-01-01' AND '2023-12-31' THEN 'Mid'
           ELSE 'Junior'
       END AS experience_level
FROM Employee;

-- 58. Calculate the bonus for employees: 10% of salary for IT, 5% for HR, and 2% for others.
SELECT name, salary, department_id,
       CASE 
           WHEN department_id = 1 THEN salary * 0.10
           WHEN department_id = 2 THEN salary * 0.05
           ELSE salary * 0.02
       END AS calculated_bonus
FROM Employee;

-- 59. Rank employees within their department based on salary (using Window Function DENSE_RANK).
SELECT name, department_id, salary,
       DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS salary_rank
FROM Employee;

-- 60. Find cumulative salary spending for the company ordered by joining date.
SELECT name, joining_date, salary,
       SUM(salary) OVER (ORDER BY joining_date) AS running_total_payroll
FROM Employee;

-- 61. Get the department name, total employees, and total payroll in a single consolidated report.
SELECT d.name AS department_name, COUNT(e.id) AS total_employees, SUM(e.salary) AS total_payroll 
FROM Department d
LEFT JOIN Employee e ON d.id = e.department_id
GROUP BY d.name;

-- 62. Find duplicate employee names in the system.
SELECT name, COUNT(*) AS occurrence 
FROM Employee 
GROUP BY name 
HAVING COUNT(*) > 1;

-- 63. Find employees whose names have exactly 3 vowels.
-- Note: Simplified representation using character analysis pattern
SELECT name FROM Employee 
WHERE (LENGTH(name) - LENGTH(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LOWER(name), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', ''))) = 3;

-- 64. List of employees who joined in the last quarter of any year (October, November, December).
SELECT * FROM Employee 
WHERE MONTH(joining_date) IN (10, 11, 12);

-- 65. Display employee details alongside a column indicating if their salary is above or below their department's average.
WITH DeptAvg AS (
    SELECT department_id, AVG(salary) AS avg_sal 
    FROM Employee 
    GROUP BY department_id
)
SELECT e.name, e.salary, e.department_id, da.avg_sal,
       CASE 
           WHEN e.salary > da.avg_sal THEN 'Above Average'
           ELSE 'Below or Equal Average'
       END AS salary_status
FROM Employee e
INNER JOIN DeptAvg da ON e.department_id = da.department_id;
