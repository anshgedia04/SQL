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


