-- Default Statement
Select * from employee_demographics;

Select * 
from employee_salary
where first_name = 'Leslie';

Select * 
from employee_salary
where salary <= 50000;

Select * 
from employee_demographics
where birth_date > '1985-01-01';

-- And/Or/Not operators
Select * 
from employee_demographics
where (first_name = 'Leslie' and age = 44) or age > 55;

-- Like statements
Select * 
from employee_demographics
where birth_date like '1985%';

-- Group By
Select gender
from parks_and_recreation.employee_demographics
group by gender;

Select gender, AVG(age), MAX(age), MIN(age), COUNT(age) 
from employee_demographics
group by gender;

Select occupation, salary
from employee_salary
group by occupation, salary;

-- Order By

Select * 
from employee_demographics
ORDER BY gender, age DESC ;

-- Limit and Aliasing
Select * 
from employee_demographics
Order by age desc 
limit 2, 1;

Select gender, AVG(age) as avg_age 
from employee_demographics
group by gender
having avg_age > 40;



