USE TECH_COM ;

-- Table 1: Users
CREATE TABLE Users (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Insert sample data into Users
INSERT INTO Users (id, name) VALUES (1, 'Ansh');
INSERT INTO Users (id, name) VALUES (2, 'Riya');
INSERT INTO Users (id, name) VALUES (3, 'Karan');
INSERT INTO Users (id, name) VALUES (4, 'Sneha');
INSERT INTO Users (id, name) VALUES (5, 'Aman');

-- Table 2: March (for transactions)

CREATE TABLE March (
    acc_id INT,
    transaction_id INT PRIMARY KEY,
    value DECIMAL(10, 2),
    FOREIGN KEY (acc_id) REFERENCES Users(id)
);

-- Insert sample data into March
INSERT INTO March (acc_id, transaction_id, value) VALUES (1, 1001, 500.00);
INSERT INTO March (acc_id, transaction_id, value) VALUES (2, 1002, 1200.50);
INSERT INTO March (acc_id, transaction_id, value) VALUES (3, 1003, 340.75);
INSERT INTO March (acc_id, transaction_id, value) VALUES (4, 1004, 980.00);
INSERT INTO March (acc_id, transaction_id, value) VALUES (5, 1005, 150.25);

INSERT INTO March (acc_id, transaction_id, value) VALUES (1, 1006, 4895.00);
INSERT INTO March (acc_id, transaction_id, value) VALUES (1, 1007, 757.00);

INSERT INTO March (acc_id, transaction_id, value) VALUES (4, 1008, 780.00);


SELECT * FROM March;

SELECT * FROM Users;


--give me id , name , numbers of trans. by user , total value of trans

--way one
SELECT id , name as name_of_the_user , number_trans , total_value
FROM Users
JOIN (SELECT distinct acc_id , COUNT(transaction_id) OVER (PARTITION BY acc_id) as number_trans , sum(value)  OVER (PARTITION BY acc_id) as total_value  FROM March) as temp
ON Users.id = temp.acc_id

--way 2
SELECT id , name as name_of_the_user , number_trans , total_value
FROM Users
JOIN (SELECT acc_id  ,COUNT(transaction_id) as number_trans , sum(value) as total_value  FROM March GROUP BY acc_id) as temp
ON Users.id = temp.acc_id



--give the rank to the march according to max transation 


--step 1
SELECT acc_id  ,COUNT(transaction_id) as number_trans , sum(value) as total_value  FROM March GROUP BY acc_id

--2 

SELECT * , DENSE_RANK() OVER (ORDER BY total_value DESC) 
FROM (SELECT acc_id  ,COUNT(transaction_id) as number_trans , sum(value) as total_value  FROM March GROUP BY acc_id) as temp