USE leetcode; 

--leetcode problem 

--problem 1



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



--problem 2 || Find the employees who earn more than their managers.

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT,
    managerId INT
);


INSERT INTO Employee (id, name, salary, managerId) VALUES
(1, 'Joe', 70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam', 60000, NULL),
(4, 'Max', 90000, NULL);


SELECT * FROM Employee

--ansswer

SELECT emp1.name as emp 
FROM Employee as emp1
JOIN Employee as managers
ON emp1.managerId = managers.id
WHERE emp1.salary > managers.salary


--que3

-- A country is considered big if:

-- It has an area of at least 3,000,000 km², or

-- It has a population of at least 25,000,000.

-- Write a SQL query to find the name, population, and area of the big countries.

-- Return the result table in any order.

CREATE TABLE World (
    name VARCHAR(100) PRIMARY KEY,
    continent VARCHAR(50),
    area INT,
    population INT,
    gdp BIGINT
);

INSERT INTO World (name, continent, area, population, gdp) VALUES
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000);

SELECT * FROM World

USE TECH_COM
--que

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    customer_id INT
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    visit_id INT,
    amount INT
);

INSERT INTO Visits (visit_id, customer_id) VALUES
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);

INSERT INTO Transactions (transaction_id, visit_id, amount) VALUES
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);

select  customer_id , transaction_id
from  Visits
LEFT JOIN Transactions
ON Visits.visit_id  = Transactions.visit_id 
WHERE transaction_id IS NULL


select customer_id , COUNT(customer_id) as count_no_trans 
FROM (select  customer_id , transaction_id
        from  Visits
        LEFT JOIN Transactions
        ON Visits.visit_id  = Transactions.visit_id 
        WHERE transaction_id IS NULL) as temp
GROUP BY customer_id
ORDER BY count_no_trans DESC ;


use leetcode
--que
CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type ENUM('start', 'end'),
    timestamp FLOAT,
    PRIMARY KEY (machine_id, process_id, activity_type)
);


INSERT INTO Activity (machine_id, process_id, activity_type, timestamp) VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end',   1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end',   4.120),
(1, 0, 'start', 0.550),
(1, 0, 'end',   1.550),
(1, 1, 'start', 0.430),
(1, 1, 'end',   1.420),
(2, 0, 'start', 4.100),
(2, 0, 'end',   4.512),
(2, 1, 'start', 2.500),
(2, 1, 'end',   5.000);


select * from Activity


SELECT 
    machine_id,
    process_id,
    MAX(timestamp) -
    MIN(timestamp) AS duration
FROM 
    Activity
GROUP BY 
    machine_id, process_id;

use leetcode


--way one

SELECT main.machine_id , ROUND(AVG(duration) , 3) 
FROM (SELECT 
    machine_id,
    process_id,
    MAX(timestamp) -
    MIN(timestamp) AS duration
FROM 
    Activity
GROUP BY 
    machine_id, process_id) as main
GROUP BY machine_id ;



--way 2

SELECT 
    machine_id,
    process_id,
    MAX(timestamp) -
    MIN(timestamp) AS duration
FROM 
    Activity
GROUP BY 
    machine_id, process_id;

--
WITH answer as (
    SELECT 
    machine_id,
    process_id,
    MAX(timestamp) -
    MIN(timestamp) AS duration
FROM 
    Activity
GROUP BY 
    machine_id, process_id;
)SELECT machine_id , ROUND(AVG(duration)) as processing_time FROM answer GROUP BY machine_id 



