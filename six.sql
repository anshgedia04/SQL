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

--use of partition by 

SELECT fname, lname, Locations,
COUNT(Locations) OVER (PARTITION BY Locations) AS Total,
AVG(Salary) OVER (PARTITION BY Locations) AS AVG_Salary
FROM emp


--window functions 
--row_rumber 

SELECT fname , lname , salary , ROW_NUMBER() OVER (ORDER BY salary DESC) as Priority_num FROM emp;

--in above case diffn priorities has been given to the same salary
--that is why rank comes in picture

SELECT fname , lname , salary , RANK() OVER (ORDER BY salary DESC) as Priority_num FROM emp;



--dense_rank

SELECT fname , lname , salary , DENSE_RANK() OVER (ORDER BY salary DESC) as Priority_num FROM emp;


--give me name of the person with  second highest salary 

SELECT * FROM 
(SELECT fname , lname , salary , DENSE_RANK() OVER (ORDER BY salary DESC) as Priority_num FROM emp) as temp
where Priority_num = 2


--give me details of highest earned people based on location 

--step  one
SELECT * , ROW_NUMBER() OVER (PARTITION BY Locations ORDER BY salary DESC) from emp

--step 2 

SELECT * FROM 
(SELECT * , ROW_NUMBER() OVER (PARTITION BY Locations ORDER BY salary DESC) as sal_num from emp) as temp
where sal_num = 1 ;


--another way to achive

--step  one 
SELECT Locations , max(salary) as max_sal FROM emp GROUP BY Locations

--2
SELECT fname , lname , salary , emp.Locations FROM emp 
INNER JOIN (SELECT Locations , max(salary) as max_salary FROM emp GROUP BY Locations) as sub_query
ON emp.salary = sub_query.max_salary ; 




--leetcode problem 

--table of score is given 

CREATE TABLE Scores(
    id INT PRIMARY KEY,
    score DECIMAL(3,2)
);

-- Write a solution to find the rank of the scores. The ranking should be calculated according to the following rules:

-- The scores should be ranked from the highest to the lowest.

-- If there is a tie between two scores, both should have the same ranking.

-- After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.

-- Return the result table ordered by score in descending order.

INSERT INTO Scores VALUES(1,3.2);
INSERT INTO Scores VALUES(2,3.65);
INSERT INTO Scores VALUES(3,3.9);
INSERT INTO Scores VALUES(4,4);
INSERT INTO Scores VALUES(5,4.5);
INSERT INTO Scores VALUES(6,3.9);
INSERT INTO Scores VALUES(7,4.5);

SELECT * FROM Scores;

--answer 

SELECT *, DENSE_RANK() OVER (ORDER BY score DESC) as rank_number FROM Scores



