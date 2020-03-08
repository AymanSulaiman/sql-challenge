-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp_no, last_name, first_name, gender FROM employees;
SELECT emp_no, salary FROM salaries;

SELECT 
	e.emp_no
	,e.last_name
	,e.first_name
	,e.gender 
	, s.salary
FROM employees e
LEFT JOIN salaries s ON e.emp_no = s.emp_no;

-- 2. List employees who were hired in 1986.
SELECT * 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
ORDER BY emp_no;

-- 3. List the manager of each department with the following information: 
-- 	department number, 
-- 	department name, 
-- 	the manager's employee number, 
-- 	last name, 
-- 	first name, 
-- 	and start and end employment dates.
--Sanity checks
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT COUNT(*) FROM dept_manager;
SELECT * FROM employees;

-- Joining 2 tables sanity check
SELECT
	dep_man.emp_no,
	dep_man.dept_no,
	dep.dep_name
FROM dept_manager dep_man
INNER JOIN departments dep ON dep.dept_no = dep_man.dept_no
ORDER BY dep_man.emp_no;

-- Joining 3 tables
SELECT
	dep_man.dept_no,
	dep.dep_name,
	dep_man.emp_no,	
	e.first_name,
	e.last_name,
	dep_man.from_date,
	dep_man.to_date
FROM dept_manager dep_man
INNER JOIN departments dep ON dep.dept_no = dep_man.dept_no
INNER JOIN employees e ON e.emp_no = dep_man.emp_no
ORDER BY dep_man.emp_no;

-- 4. List the department of each employee with the following information: 
-- 	employee number, 
-- 	last name, 
-- 	first name, 
-- 	and department name.

-- Sanity checks
SELECT * FROM employees;
SELECT COUNT(*) FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM departments;

SELECT 
	e.emp_no
	,e.last_name
	,e.first_name
	,dept_emp.dept_no
	,dept_emp.from_date
	,dept_emp.to_date
	,d.dep_name
FROM employees e
INNER JOIN dept_emp ON e.emp_no = dept_emp.emp_no
INNER JOIN departments d ON d.dept_no = dept_emp.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.


-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.