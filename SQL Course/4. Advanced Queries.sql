-- Window Functions


Select gender, AVG(salary) as avg_salary
from employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id
Group by gender;


Select dem.first_name, dem.last_name, gender, AVG(salary) over(partition by gender)
from employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id;
    
Select dem.first_name, gender, SUM(salary) over(partition by gender order by dem.employee_id) as Rolling_Total
from employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id;

Select dem.employee_id, dem.first_name,dem.last_name, gender, salary, row_number() over(partition by gender order by salary desc) as row_num, 
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num 
from employee_demographics dem
Join employee_salary sal
	on dem.employee_id = sal.employee_id;
    
-- CTEs
WITH CTE_Example AS 
(SELECT gender, AVG(salary) avg_sal, MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
) SELECT AVG(avg_sal)
From CTE_Example;

-- Temp Tables
Create TEMPORARY TABLE temp_table 
( first_name varchar(50), 
last_name varchar(50),
favorite_movie varchar(100)
);
SELECT * from temp_table;

INSERT INTO temp_table
VALUES ('Sachit', 'Pegallapati', 'Big Hero 6');

Select * from temp_table;

SELECT * from employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT * FROM employee_salary
where salary >= 50000;

SELECT * FROM salary_over_50k;