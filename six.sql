USE TECH_COM ;

SELECT * FROM emp;
--i want number of total emps and avg salary according to location

SELECT Locations , COUNT(*) , avg(salary) FROM emp GROUP BY Locations


--now concept of joins comes in