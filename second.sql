USE TECH_COM ;

-- USE TECH_COM;
-- CREATE TABLE  IF NOT EXISTS emp(
--     EmpID INT PRIMARY KEY AUTO_INCREMENT,
--     Fname VARCHAR(20),
--     Lname VARCHAR(20),
--     salary INT,
--     Locations VARCHAR(25)
-- );

-- SHOW tables;

-- INSERT INTO emp(Fname,Lname,salary,Locations) VALUES ("ANSH" , "GEDIA" , 20000 , "BASERA" );
-- INSERT INTO emp(Fname,Lname,salary,Locations) VALUES ("PANKAJ" , "PATEL" , 5200 , "BASERA" );
-- INSERT INTO emp(Fname,Lname,salary,Locations) VALUES ("PRATIK" , "BHATIA" , 4800 , "ujjain" );

-- SELECT * FROM emp ;
-- SELECT Fname , Lname FROM emp ;
-- SELECT Fname , Lname FROM emp WHERE EmpID = 2;

-- SELECT Fname , Lname FROM emp ORDER BY salary DESC

-- DROP TABLE emp ;



UPDATE emp SET Lname = "jogia" WHERE EmpID = 3;
SELECT * FROM emp ;


DELETE FROM emp WHERE EmpID = 2 ;
SELECT * FROM emp ;


INSERT INTO emp(Fname,Lname,salary,Locations) VALUES ("anil" , "GEDIA" , 20000 , "BASERA" );
INSERT INTO emp(Fname,Lname,salary,Locations) VALUES ("krishna" , "PATEL" , 5200 , "BASERA" );
INSERT INTO emp(Fname,Lname,salary,Locations) VALUES ("john" , "BHATIA" , 4800 , "ujjain" );


ALTER TABLE emp MODIFY Fname VARCHAR(10);
DESCRIBE emp ;


ALTER TABLE emp ADD age INT ;
DESCRIBE emp ;

ALTER TABLE emp MODIFY age INT NOT NULL;
DESCRIBE emp ;
-- we can also use DELETE for deleting specific column 
SELECT * FROM emp ;

UPDATE emp SET age = 20 WHERE EmpID = 1;
UPDATE emp SET age = 22 WHERE EmpID = 3;
UPDATE emp SET age = 18 WHERE EmpID = 4;
UPDATE emp SET age = 25 WHERE EmpID = 5;
UPDATE emp SET age = 30 WHERE EmpID = 6;

SELECT * FROM emp ;


-- aggrigatiing commands 
-- count , max  ,min , groupby , sum 

SELECT COUNT(*) FROM emp ; 


SELECT COUNT(*)  AS Total_emps FROM emp ;  

SELECT MAX(salary) AS max_salary FROM emp ;

-- not working SELECT Fname, MAX(salary)  FROM emp ;

SELECT SUM(salary) AS SUM_salary FROM emp ;

SELECT * FROM emp;