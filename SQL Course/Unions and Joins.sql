-- Joins

Select * from employee_demographics;

Select * from employee_salary;
-- Inner Join
Select dem.employee_id, age, occupation, salary from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
;
-- Outer Join 
Select * from employee_demographics as dem
right outer join employee_salary as sal
	on dem.employee_id = sal.employee_id
;

-- Self Join
Select emp1.employee_id as emp_santa, emp1.first_name as santa_fn, emp1.last_name as santa_ln, emp1.employee_id as emp_santa, emp1.first_name as emp_fn, emp1.last_name as emp_ln
from employee_salary emp1  
join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id
;

-- Join multiple tables
Select * from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id
;

Select * 
from parks_departments;

-- Unions
Select first_name, last_name from employee_demographics
union distinct
select first_name, last_name from employee_salary;

Select first_name, last_name, 'Old Man' as Label
from employee_demographics
where age > 40 and gender = 'Male'
union 
Select first_name, last_name, 'Old Lady' as Label
from employee_demographics
where age > 40 and gender = 'Female'
union
select first_name, last_name, 'Highly Paid Employee' as Label
from employee_salary
where salary > 70000
Order by first_name, last_name;