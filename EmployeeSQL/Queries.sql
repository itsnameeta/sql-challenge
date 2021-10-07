-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT E.emp_no,E.first_name, E.last_name, E.sex, S.salary
FROM employees E
JOIN salaries S 
ON E.emp_no= S.emp_no
ORDER BY E.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees 
WHERE EXTRACT (YEAR FROM hire_date) = '1986';


-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT DM.dept_no, D.dept_name, DM.emp_no, E.last_name, E.first_name
FROM dept_manager DM
JOIN employees E
ON DM.emp_no = E.emp_no
JOIN departments D
ON DM.dept_no = D.dept_no
ORDER BY DM.dept_no;


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no;


-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;

 
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
JOIN departments 
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY employees.emp_no;


-- 8. In descending order, list the frequency count of employee last names,i.e., how many employees share each last name.
SELECT employees.last_name, count (*) frequency
FROM employees
GROUP BY employees.last_name
ORDER BY frequency DESC;

--Data presence/ columns check
SELECT *
FROM employees;

SELECT *
FROM salaries;

SELECT *
FROM titles;

SELECT *
FROM departments;

SELECT *
FROM dept_emp;

SELECT *
FROM dept_manager;

--Duplication/ Relationship check
SELECT count(*), emp_title_id
FROM employees
group by emp_title_id 
having count(*)> 1;

SELECT count(*), emp_no
FROM salaries
group by emp_no 
having count(*)> 1;

SELECT count(*), title_id
FROM titles
group by title_id 
having count(*)> 1;

SELECT count(*), dept_no
FROM departments
group by dept_no 
having count(*)> 1;

SELECT count(*), emp_no
FROM dept_emp
group by emp_no 
having count(*)> 1;

SELECT count(*), emp_no
FROM dept_manager
group by emp_no 
having count(*)> 1;
