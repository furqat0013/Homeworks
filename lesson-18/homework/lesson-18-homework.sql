--task 1
--select * from Employees
--where salary=(select min(salary) from Employees)

--task 2
--select * from Products
--where price > (select avg(price) from Products)

--task 3
--select department_name, name, department_id from Departments d
--join Employees e on d.id = e.Department_id
--where department_id = (select id from Departments where department_name = 'Sales')

--task 4
--select c.customer_id, name from Customers c
--where not exists (select 1 from Orders o where c.customer_id = o.customer_id)

--task 5
--select product_name, price as highest_price, category_id from Products
--where price in (select max(price) from Products group by category_id)

--task 6
--select d.department_name, 
--       e.name, 
--	   salary 
--from Departments d
--join Employees e on d.id = e.department_id
--where d.id = (select top 1 department_id 
--              from Employees  
--              group by department_id 
--			  order by avg(salary) desc )

--task 7
--select e.name, e.salary, e.department_id, av.average_salary from Employees e
--join (
--select department_id, avg(salary) as average_salary from employees
--group by department_id
--) av on av.department_id = e.department_id
--where e.salary > av.average_salary

--task 8
--select s.student_id, s.name, g.course_id, g.grade
--from students s
--join grades g on s.student_id = g.student_id
--where g.grade in (select max(grade) as gr from grades group by course_id)

--task 9
--select tbl.product_name, tbl.category_id, tbl.price from  (
--select *, row_number() over (partition by category_id order by price desc) as num from products) tbl
--where num = 3

--task 10
--select e.name, e.salary, e.department_id from employees e
--join (
--select department_id, max(salary) dep_max from employees
--group by department_id
--) dt on e.department_id = dt.department_id
--where e.salary < dt.dep_max
--and e.salary > (select avg(salary) as com_avg from employees)



