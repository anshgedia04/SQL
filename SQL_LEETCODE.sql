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



--que

-- You are given two tables: Signups and Confirmations.

-- Each row in Signups represents a user who signed up.

-- Each row in Confirmations represents a confirmation message requested by a user, with status 'confirmed' or 'timeout'.

-- Write a query to return the confirmation rate for each user, defined as:

-- ini
-- Copy
-- Edit
-- confirmation_rate = confirmed messages / total confirmation messages
-- If a user has no confirmation requests, their confirmation rate should be 0.00.

-- Round the confirmation rate to 2 decimal places.

-- Return the result sorted by user_id.

use leetcode;

CREATE TABLE Signups (
    user_id INT PRIMARY KEY,
    time_stamp DATETIME
);

CREATE TABLE Confirmations (
    user_id INT,
    time_stamp DATETIME,
    action ENUM('confirmed', 'timeout'),
    PRIMARY KEY (user_id, time_stamp),
    FOREIGN KEY (user_id) REFERENCES Signups(user_id)
);
INSERT INTO Signups (user_id, time_stamp) VALUES
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');

INSERT INTO Confirmations (user_id, time_stamp, action) VALUES
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-07-14 14:00:00', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 12:58:28', 'confirmed'),
(7, '2021-06-14 13:59:27', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-02-28 23:59:59', 'timeout');


select * from Signups
select * from Confirmations


--step 1
select user_id , 
        COUNT(CASE WHEN c.action = 'confirmed' THEN 1 END) as CNF , 
        COUNT(c.action) as total_action
FROM Confirmations c
GROUP BY user_id ;

--step 2
SELECT s.user_id ,
        ROUND(CNF/total_action,2) as CONFORMATION_RATE
FROM Signups s
LEFT OUTER JOIN (select user_id , 
                        COUNT(CASE WHEN c.action = 'confirmed' THEN 1 END) as CNF , 
                        COUNT(c.action) as total_action
                FROM Confirmations c
                GROUP BY user_id) as temp
ON s.user_id = temp.user_id


use leetcode
--que

CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT
);

CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);

-- Insert data into Prices table
INSERT INTO Prices (product_id, start_date, end_date, price) VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

-- Insert data into UnitsSold table
INSERT INTO UnitsSold (product_id, purchase_date, units) VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

SELECT * from Prices
SELECT * from UnitsSold

--step 1
SELECT p.product_id as p_id , u.units as unit , p.price as price
FROM Prices p
INNER JOIN UnitsSold u 
ON (p.product_id = u.product_id) and (u.purchase_date between p.start_date and p.end_date)

--step2 
SELECT p_id , 
        SUM(unit*price) as rev , 
        SUM(unit) as unit_sold
FROM (SELECT p.product_id as p_id , u.units as unit , p.price as price
        FROM Prices p
        INNER JOIN UnitsSold u 
        ON (p.product_id = u.product_id) and (u.purchase_date between p.start_date and p.end_date)) as temp
GROUP BY p_id ;

--step 3
WITH answer as (
    SELECT p_id , 
        SUM(unit*price) as rev , 
        SUM(unit) as unit_sold
FROM (SELECT p.product_id as p_id , u.units as unit , p.price as price
        FROM Prices p
        INNER JOIN UnitsSold u 
        ON (p.product_id = u.product_id) and (u.purchase_date between p.start_date and p.end_date)) as temp
GROUP BY p_id 
)SELECT p_id , ROUND(rev/unit_sold , 2) as AVG_SELLING from answer ;


--another way
SELECT 
    u.product_id,
    ROUND(SUM(u.units * p.price) * 1.0 / SUM(u.units), 2) AS average_price
FROM 
    UnitsSold u
JOIN 
    Prices p
ON 
    u.product_id = p.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY 
    u.product_id;


--que
use leetcode
CREATE TABLE Project (
    project_id INT,
    employee_id INT
);

CREATE TABLE Employees (
    employee_id INT,
    name VARCHAR(50),
    experience_years INT
);

-- Data for Project table
INSERT INTO Project (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 4);

-- Data for Employee table
INSERT INTO Employees (employee_id, name, experience_years) VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);

select * from Project;
select * from Employees;


--step 1

select p.project_id , e.employee_id , e.experience_years as avg_p_expp
from Project p
INNER JOIN Employees e
ON p.employee_id = e.employee_id

--step 2
select temp.p_id, ROUND(AVG(avg_p_expp) , 2) 
FROM (select p.project_id as p_id, e.employee_id , e.experience_years as avg_p_expp
        from Project p
        INNER JOIN Employees e
        ON p.employee_id = e.employee_id) as temp
GROUP BY temp.p_id ;


--another way to do so
SELECT p.project_id , ROUND(AVG(e.experience_years),2) as avg_exp
from Project p
INNER JOIN  Employees e
ON p.employee_id = e.employee_id
GROUP BY p.project_id

use leetcode
--que
CREATE TABLE Activitys (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

INSERT INTO Activitys (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

--Find the fraction of players who logged in again exactly the next day after their first login, rounded to 2 decimal places.

--Return a single column: fraction

--step 1

SELECT a.player_id as imp_logged
FROM Activitys a
JOIN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activitys
    GROUP BY player_id
) first_day ON a.player_id = first_day.player_id
WHERE DATEDIFF(a.event_date, first_day.first_login) = 1;


--step 2
with answer as (
    SELECT a.player_id as imp_logged
FROM Activitys a
JOIN (
    SELECT player_id, MIN(event_date) AS first_login
    FROM Activitys
    GROUP BY player_id
) first_day ON a.player_id = first_day.player_id
WHERE DATEDIFF(a.event_date, first_day.first_login) = 1
)SELECT 
    ROUND(
        COUNT(DISTINCT imp_logged) * 1.0 / (Select COUNT(DISTINCT(player_id)) from Activitys),
        2
    ) AS fraction
FROM answer
