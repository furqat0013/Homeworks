---------------------------------JOINS----------------------
-----------task 1
--select first_name, last_name, e.department_id, department_name from employees e
--join departments d on e.DEPARTMENT_ID= d.department_id

-----------task 2
--select e.first_name, e.last_name, d.department_name, l.city, l.state_province from departments d
--join employees e on d.department_id = e.department_id 
--join locations l on d.location_id = l.location_id 

----------task 3
--select distinct e.first_name, e.last_name, e.salary, j.grade_level from employees e
--join job_grades j on e.salary between j.lowest_sal and j.highest_sal

------------task 4
--select e.first_name, e.last_name, e.department_id, d.department_name from employees e
--join departments d on e.department_id= d.department_id and e.department_id in (80,40)

------------task 5
--select e.first_name, e.last_name, d.department_name, l.city, l.state_province from departments d
--join employees e on d.department_id = e.department_id 
--join locations l on d.location_id = l.location_id 
--where e.first_name like '%z%'

------------task 6
--select e.first_name, e.last_name, e.department_id, d.department_name from employees e
--right join departments d on e.department_id = d.department_id 

------------task 7
--select first_name, last_name, salary from employees
--where salary < (select salary from employees 
--                where employee_id = 182)

--select e1.first_name, e1.last_name, e1.salary from employees e1
--join employees e2 on e1.salary < e2.salary and e2.employee_id = 182

------------task 8
--select e1.first_name as employee_name, e2.first_name as manager from employees e1
--join employees e2 on e2.employee_id = e1.manager_id

-------------task 9
--select d.department_name, l.city, l.state_province from departments d
--join locations l on d.location_id= l.location_id

---------------task 10
--select e.first_name, e.last_name, d.department_id, d.department_name from departments d
--right join employees e on d.department_id= e.DEPARTMENT_ID

--------------task 11
--select e1.first_name as employee_name, e2.first_name as manager from employees e1
--left join employees e2 on e2.employee_id= e1.MANAGER_ID

--------------task 12
--select e1.first_name, e1.last_name, e2.department_id from employees e1
--join employees e2 on e2.department_id= e1.department_id and e2.last_name = 'Taylor'

---------------task 13
--select js.job_title, d.department_name, CONCAT_WS(' ', e.first_name, e.last_name) as employee_name, j.start_date from job_history j
--join employees e on e.employee_id= j.employee_id 
--join jobs js on js.job_id = e.job_id
--join departments d on d.department_id = e.department_id
--and j.start_date >= '1993-01-01'
--and j.start_date <= '1997-08-31'

--------------task 14
--select j.job_title, CONCAT_WS(' ', e.first_name, e.last_name) as employee_name, (j.max_salary- e.salary) as salary_difference 
--from employees e
--join jobs j on j.job_id= e.job_id

------------task 15
--select d.department_name, avg(e.salary) as avg, count(e.commission_pct) as count from employees e
--join departments d on d.department_id= e.department_id
--group by d.department_name
--order by count desc

------------task 16
--select j.job_title, CONCAT_WS(' ', e.first_name, e.last_name) as employee_name, (j.max_salary- e.salary) as salary_difference 
--from employees e
--join jobs j on j.job_id= e.job_id
--where e.DEPARTMENT_ID = 80

------------task 17
--select c.country_name, l.city, d.department_name from countries c
--join locations l on l.country_id= c.country_id
--join departments d on d.location_id = l.location_id

--------------task 18
--select d.department_name, CONCAT_WS(' ', e.first_name, e.last_name) as name_of_manager 
--from departments d
--join employees e on d.manager_id= e.employee_id 

-------------task 19
--select job_title, avg(salary) 
--from employees e
--join jobs j 
--             on j.job_id = e.job_id 
--group by job_title

---------------task 20

--select e.employee_id, start_date, end_date, j.job_id, e.department_id
--from employees e
--join job_history j 
--            on j.employee_id = e.employee_id
--where salary >= 12000

------------ task 21   ......................

--select country_name, city, count(d.DEPARTMENT_ID)
--from countries c
--join locations l on c.country_id = l.country_id
--join departments d on d.location_id = l.location_id
--where d.department_id in 
--           (select department_id 
--            from employees 
--            group by DEPARTMENT_ID
--            having count(DEPARTMENT_ID) >= 2)
--group by country_name, city

------------task 22

--select d.department_name, CONCAT_WS(' ', e.first_name, e.last_name) as name_of_manager, l.city 
--from employees e
--join departments d on d.manager_id = e.employee_id
--join locations l on d.location_id = l.location_id

--------------- task 23
--select h.employee_id, j.job_title, datediff(day, h.start_date, h.end_date) as days 
--from jobs j
--join job_history h on h.job_id = j.job_id
--where h.department_id = 80

------------- task 24
--select CONCAT_WS(' ', e.first_name, e.last_name) as full_name, e.salary
--from employees e 
--join departments d on d.department_id = e.DEPARTMENT_ID
--join locations l on l.location_id= d.location_id
--where l.city = 'London'

------------- task 25
--select CONCAT_WS(' ', e.first_name, e.last_name) as employee_name, j.job_title, max(h.start_date), max(h.end_date), h.employee_id
--from employees e 
--join job_history h on e.EMPLOYEE_ID = h.employee_id
--join jobs j on j.job_id = e.job_id
--where e.COMMISSION_PCT = 0 
--group by e.first_name, e.last_name, h.employee_id, j.job_title

------------ task 26
--select d.department_name, count(e.employee_id), d.department_id 
--from employees e
--join departments d on d.department_id = e.DEPARTMENT_ID
--group by d.department_name, d.department_id

------------ task 27
--select CONCAT_WS(' ', e.first_name, e.last_name) as employee_name, e.employee_id, c.country_name 
--from employees e
--join departments d on d.department_id = e.DEPARTMENT_ID
--join locations l on l.location_id = d.location_id
--join countries c on c.COUNTRY_ID = l.country_id





