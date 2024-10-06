use country;
create table region(region_id decimal(10,0), region_name varchar(50), primary key(region_id), foreign key(region_id) references states(region_id));
insert into region(region_id,region_name)values(1100,'North'),
(1200,'West'),
(1300,'North');
select * from region;
select distinct region_name, region_id from region  ;/*its howing distinct region id too*/
select  distinct region_name from region;/*its showing only the distinct or unique region*/
select distinct * from region;
/*the only way to add not null constraint is to modify add constraint can be  used in primary key foreign key and all*/
ALTER TABLE region 
MODIFY region_name VARCHAR(255) NOT NULL;
create table if not exists country.region(region_id decimal(10,0), region_name varchar(50), primary key(region_id), foreign key(region_id) references states(region_id));
/*if the table is existed don't create it again*/
create table if not exists country.jobs(job_id varchar(10) not null, job_title varchar(35) not null, max_salary decimal(6,0), primary key(job_id),
check(max_salary=50000));
/*checking the salaary is 50000*/
create table country.employees( employee_id int not null, job_id varchar(10) not null, first_name varchar(20) not null, last_name varchar(20) not null, department varchar(50), salary decimal(10,2) ,hire_date date, primary key(employee_id), foreign key (job_id) references jobs (job_id));
select * from region, states ;
insert into jobs(job_id, job_title,max_salary) values('A11','IT',50000),('A12','Finance',50000);
insert into employees values(450 ,'A11','Sweta','Nath','IT',50000,'2024-11-12'),(452,'A12','Virender','Rawat','Finance',500000,'2024-11-11');
/*SELECT DATE_FORMAT(date_column, '%m/%d/%Y') AS formatted_date
FROM your_table;*/
select count(*) as total_count, j.job_id 
from jobs j, employees e 
where j.job_id = e.job_id 
group by j.job_id;
/*first we have to make group then it will count*/
SELECT AVG(j.max_salary) AS average_salary, COUNT(*) AS count, j.job_title 
FROM jobs j, employees e 
WHERE j.job_id = e.job_id 
GROUP BY j.job_title 
ORDER BY j.job_title DESC;
/*in this we can't use the non agg function like name*/
/*calculate average salary and the total number of employees for each department, filter out departments with fewer than 3 employees, and then sort by the average salary in descending order.*/
SELECT department, 
       COUNT(*) AS total_employees, 
       AVG(salary) AS average_salary, 
       SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING COUNT(*) >= 1    -- Only include departments with at least 3 employees
   AND AVG(salary) > 25000  -- Filter departments where the average salary is greater than 25,000
ORDER BY average_salary DESC;  -- Sort by average salary in descending order
/*first calculates the total salary for each department and then finds all employees whose salary is equal to  the department average.*/
SELECT e.first_name, e.last_name, e.salary, e.department
FROM employees e
WHERE e.salary = (SELECT AVG(salary) 
                  FROM employees 
                  WHERE department = e.department)
ORDER BY e.salary DESC;
/*calculate the number of employees and total salary for each job title within the department. It filters out jobs where the total salary is less than 100,000 and orders them by total salary.*/
SELECT department, job_id, COUNT(*) AS employee_count, SUM(salary) AS total_salary
FROM employees
GROUP BY department, job_id
HAVING SUM(salary) > 100000  -- Filter out job titles with total salary below 100,000
ORDER BY total_salary DESC, employee_count ASC;
/*order by have nydefault asc ord*/
/*To sort employees by hire date in ascending order:*/
SELECT employee_id, first_name, last_name, department, salary, hire_date
FROM employees
ORDER BY hire_date ASC;
/*To sort employees by hire date in descending order:*/
SELECT employee_id, first_name, last_name, department, salary, hire_date
FROM employees
ORDER BY hire_date DESC;
-- CURDATE()This function returns the current date.
SELECT CURDATE() AS current_date;
-- DATE_FORMAT() This function formats a date value according to the specified format.
SELECT DATE_FORMAT(hire_date, '%M %d, %Y') AS formatted_hire_date 
FROM employees;
-- DATEDIFF() This function returns the difference in days between two dates.
SELECT DATEDIFF(CURDATE(), hire_date) AS days_since_hired 
FROM employees;
-- CONCAT() This function concatenates two or more strings.
SELECT CONCAT(first_name, ' ', last_name) AS full_name 
FROM employees;
--  UPPER() This function converts a string to uppercase.
SELECT UPPER(department) AS upper_department 
FROM employees;
--  LOWER() This function converts a string to lowercase.
SELECT LOWER(first_name) AS lower_first_name 
FROM employees;



