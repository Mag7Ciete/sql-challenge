--List the employee number, last name, first name, sex, and salary of each employee.

SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salary.salary
FROM employees employee
INNER JOIN salaries salary ON employee.emp_no = salary.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.


SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT depts.dept_no, depts.dept_name, employee.emp_no, employee.last_name, employee.first_name
FROM dept_manager dm
INNER JOIN departments depts ON dm.dept_no = depts.dept_no
INNER JOIN employees employee ON dm.emp_no = employee.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employee.last_name, employee.first_name, departments.dept_name
FROM dept_emp dept_emp
INNER JOIN departments departments ON dept_emp.dept_no = dept_emp.dept_no
INNER JOIN employees employee ON dept_emp.emp_no = employee.emp_no;



--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employee.emp_no, employee.last_name, employee.first_name
FROM employees employee
INNER JOIN dept_emp dept_emp ON employee.emp_no = dept_emp.emp_no
INNER JOIN departments departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';


--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employee.emp_no, employee.last_name, employee.first_name, department.dept_name
FROM employees employee
INNER JOIN dept_emp dept_emp ON employee.emp_no = dept_emp.emp_no
INNER JOIN departments department ON dept_emp.dept_no = dept_emp.dept_no
WHERE department.dept_name IN ('Sales', 'Development');


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(*) as count
FROM employees
GROUP BY last_name
ORDER BY count DESC;

