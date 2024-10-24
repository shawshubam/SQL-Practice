Select * from employee;
Select * from works;
Select* from company;
Select * from manager;

/* 1. Find the names, street address, and cities of residence for all
 employees who work for 'Techcrop' and earn more than 73,000. */
 
 Select e.employee_name, e.city, e.street from employee e join works w
 on e.employee_id = w.employee_id where company_name = 'TechCorp' and w.Salary > 73000;
 
 /* 2. Find the names of all employees in the database who live in the same cities as the companies for which they work. */
 
SELECT e.employee_name
FROM employee e
JOIN works w ON e.employee_id = w.employee_id
JOIN company c ON w.company_name = c.company_name
WHERE e.city = c.city;

 /* 3. Find the names of all employees in the database who do not work for 'BizInc'. 
 Assume that all people work for exactly one company. */
 
 Select E.employee_name from employee as E
 inner join works as w
 on E.employee_id = w.employee_id
 where company_name != 'BizInc';
 
  Select E.employee_name from employee as E
 inner join works as w
 on E.employee_id = w.employee_id
 where company_name <> 'BizInc';
 
 /* 4 Find the names of all employees in the database who earn more than every employee of 'BizInc' or Maximum salary. */
 
SELECT e.employee_name, w.salary
FROM employee e
JOIN works w ON e.employee_id = w.employee_id
WHERE w.company_name = 'BizInc' AND w.salary = (
    SELECT MAX(salary)
    FROM works
    WHERE company_name = 'BizInc'
);

/* 5. Find the names of all employees who earn more than the average salary of all employees of their company. */

Select E.employee_name, w.salary from employee as E
inner join works as w
on E.employee_id = w.employee_id
where w.salary >(select avg(salary) from works
 WHERE company_name = w.company_name); 

 /* 6.Find the name of the employee_id that has the smallest salary */
 
 Select employee_id, salary from works
 where salary = (select min(salary) from works);
 
 
 