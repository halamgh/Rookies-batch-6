---- Exercise 6 -----
select employees.department_id, employees.last_name, employees.job_id from employees
where employees.department_id = (select departments.department_id from departments where departments.department_name = 'Executive')
---- Exercise 7 -----
select employees.employee_id, employees.last_name, employees.salary from employees
where (employees.salary > (select AVG(employees.salary) from employees)) and 
(employees.department_id in (select employees.department_id from employees where employees.last_name like '%u%'))
---- Exercise 8 -----
select round(max(employees.salary),0) as 'Maximum', 
round(min(employees.salary),0) as 'Minium', 
round(sum(employees.salary),0) as 'Sum', 
round(avg(employees.salary),0) as 'Average' 
from employees
---- Exercise 9 -----
select employees.last_name, len(employees.last_name) as 'Length'
from employees
where employees.last_name LIKE 'J%' or employees.last_name LIKE 'A%'  or employees.last_name LIKE 'M%';
---- Exercise 10 ----
select employees.employee_id, employees.last_name, employees.salary, round(employees.salary*1.15,0) as 'New Salary' from employees
---- Exercise 11 ----
select employees.last_name, employees.department_id, departments.department_name
from employees 
full join departments 
on employees.department_id = departments.department_id;
---- Exercise 12 ----
select employees.employee_id, employees.first_name, employees.last_name, departments.location_id
from employees 
join departments 
on employees.department_id = departments.department_id
where employees.hire_date > (select employees.hire_date from employees where employees.employee_id = '100')
and departments.location_id in (select locations.location_id from locations where locations.city = 'Toronto');
