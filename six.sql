USE TECH_COM ;

SELECT * FROM emp;
--i want number of total emps and avg salary according to location

SELECT Locations , COUNT(*) , avg(salary) FROM emp GROUP BY Locations


--now concept of joins comes in

--what i want is it includes also firsr name , last name also 
-- i want fname , lname , location , total emps , avg salary 


SELECT emp.fname , emp.lname , emp.Locations , total_emps , avg_salary
FROM emp
INNER JOIN (SELECT Locations , COUNT(*) as total_emps , avg(salary) as avg_salary FROM emp GROUP BY Locations) as temp
ON emp.Locations = temp.Locations

