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
