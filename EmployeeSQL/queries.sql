-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT EMP_NO,
	LAST_NAME,
	FIRST_NAME,
	SEX,
	(SELECT SALARIES.SALARY
		FROM SALARIES
		WHERE EMPLOYEES.EMP_NO = SALARIES.EMP_NO)
FROM EMPLOYEES
order by last_name;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT FIRST_NAME, LAST_NAME, hire_date
from employees
WHERE hire_date BETWEEN '1986/1/1' AND '1986/12/31'
order by hire_date;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no,employees.last_name, employees.first_name
from dept_manager
join employees on employees.emp_no = dept_manager.emp_no
join departments on departments.dept_no = dept_manager.dept_no
order by dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT EMPLOYEES.EMP_NO, EMPLOYEES.LAST_NAME, EMPLOYEES.FIRST_NAME, departments.dept_name
from employees
join dept_emp on dept_emp.emp_no = employees.emp_no
join departments on departments.dept_no = dept_emp.dept_no
order by last_name;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT EMPLOYEES.EMP_NO, EMPLOYEES.LAST_NAME, EMPLOYEES.FIRST_NAME,departments.dept_name
from dept_emp
join employees on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales';

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT EMPLOYEES.EMP_NO, EMPLOYEES.LAST_NAME, EMPLOYEES.FIRST_NAME,departments.dept_name
from dept_emp
join employees on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where departments.dept_name in ('Sales','Development');

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
select last_name, count(last_name) as "frequency counts"
from employees
group by last_name
order by "frequency counts" desc;

