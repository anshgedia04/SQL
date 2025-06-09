USE TECH_COM;
CREATE TABLE  IF NOT EXISTS emp(
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    Fname VARCHAR(20),
    Lname VARCHAR(20),
    salary INT,
    Locations VARCHAR(25)
);

SHOW tables;

INSERT INTO emp(Fname,Lname,salary,Locations) VALUES ("ANSH" , "GEDIA" , 20000 , "BASERA" );
INSERT INTO emp(Fname,Lname,salary,Locations) VALUES ("PANKAJ" , "PATEL" , 5200 , "BASERA" );
INSERT INTO emp(Fname,Lname,salary,Locations) VALUES ("PRATIK" , "BHATIA" , 4800 , "ujjain" );

SELECT * FROM emp ;
SELECT Fname , Lname FROM emp ;
SELECT Fname , Lname FROM emp WHERE EmpID = 2;

SELECT Fname , Lname FROM emp ORDER BY salary DESC

DROP TABLE emp ;


