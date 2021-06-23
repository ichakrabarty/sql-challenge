--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees as e
join salaries as s
on e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

select e.first_name, e.last_name, e.hire_date 
from employees as e
where e.hire_date 
between '1986-01-01' and '1986-12-31';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select d.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name 
from departments as d
join dept_manager as m
on d.dept_no = m.dept_no
join employees as e
on e.emp_no = m.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name 
from departments as d
join dept_emp as ed
on d.dept_no = ed.dept_no
join employees as e
on ed.emp_no = e.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select  e.first_name, e.last_name, e.sex 
from employees as e
where e.first_name = 'Hercules'
and e.last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
join dept_emp as de
on de.dept_no = d.dept_no
join employees as e
on e.emp_no = de.emp_no
where d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
join dept_emp as de
on de.dept_no = d.dept_no
join employees as e
on e.emp_no = de.emp_no
where d.dept_name = 'Sales' or  d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

create view last_name_count as
select e.last_name, count(e.last_name) 
from employees as e
group by e.last_name
order by count(e.last_name) desc

select * from last_name_count



