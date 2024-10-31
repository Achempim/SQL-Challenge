-- # 1. List the employee number, last name, first name, and salary of each employee.

SELECT e.emp_no, e.last_name, e.first_name, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no;


-- # 2. List the first name, last name, and hire date for the employees who were hired in 1986.
	
SELECT first_name, last_name, hire_date
FROM employees
WHERE RIGHT(hire_date, 4) = '1986';


-- # 3. List the manager of each department with their department number, department name, employee number, last name, and first name.

SELECT dm.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN employees e ON dm.emp_no = e.emp_no
JOIN departments d ON dm.dept_no = d.dept_no;


-- # 4. List the department number for each employee along with their employee number, last name, first name, and department name.

SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = de.dept_no;


-- # 5. List the first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with B.

SELECT e.first_name, e.last_name
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';



-- # 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT e.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
JOIN employees AS e ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';



-- # 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


-- # 8. List the frequency counts, in descending order, of all the employee last names.

SELECT last_name, COUNT(*) AS name_count
FROM employees
GROUP BY last_name
ORDER BY name_count DESC;
