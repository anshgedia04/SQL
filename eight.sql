USE TECH_COM;

SELECT * FROM courses

--case statements


SELECT CourseID, CourseName, CourseFee,
    CASE
        WHEN CourseFee > 3999 THEN 'Expensive Course'

        WHEN CourseFee > 1499 THEN 'Moderate Course'

        ELSE 'Cheap Course'

END AS CourseFeeStatus

FROM Courses             



--case expresstions 

SELECT CourseID, CourseName, CourseFee,
    CASE CourseFee 
    WHEN 4999 THEN 'Premium Course' 
    WHEN 3999 THEN 'Plus Course' 
    ELSE 'Regular Course' 
 END AS CourseFEES_TYPE 
FROM Courses


CREATE TABLE Orders(
OrderID INT AUTO_INCREMENT,
Order_Date TIMESTAMP NOT NULL,
Order_Learner_Id INT NOT NULL,
OrderStatus VARCHAR(30) NOT NULL,
PRIMARY KEY(OrderID),

FOREIGN KEY (Order_Learner_Id) REFERENCES learners(learner_id));


INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-21', 1, 'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12', 1, 'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-02-22', 3, 'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-15', 4, 'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12', 5, 'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-16', 7, 'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-13', 5, 'COMPLETE');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-14', 7, 'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-22', 1, 'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-12', 5, 'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-25', 1, 'PENDING');
INSERT INTO Orders(Order_Date, Order_Learner_Id, OrderStatus) VALUES ('2024-01-11', 7, 'CLOSED');


SELECT * FROM learners

SELECT * FROM orders


--give total order placed by the student 
--order_lerner_id , total_orders


SELECT Order_Learner_Id , Count(Order_Learner_Id) as total_orders FROM orders GROUP BY Order_Learner_Id

--ot
SELECT distinct Order_Learner_Id , COUNT(Order_Learner_Id) OVER (PARTITION BY Order_Learner_Id) as total_orders FROM Orders


--give total order placed by the student 
--order_lerner_id ,learnerfname , lname  , total_orders

SELECT LearnerFirstName , LearnerLastName , Order_Learner_Id ,total_orders
FROM learners
JOIN (SELECT Order_Learner_Id , Count(Order_Learner_Id) as total_orders FROM orders GROUP BY Order_Learner_Id) as temp
ON learners.Learner_Id = temp.Order_Learner_Id


--now i want -order_lerner_id ,learnerfname , learnerlastname  , total_orders , avg of total orders

SELECT LearnerFirstName , LearnerLastName , Order_Learner_Id ,total_orders ,  
(SELECT AVG(order_count) 
   FROM (
     SELECT COUNT(*) AS order_count 
     FROM orders 
     GROUP BY Order_Learner_Id
   ) AS subquery) AS average_orders_per_learner
FROM learners
JOIN (SELECT Order_Learner_Id , Count(Order_Learner_Id) as total_orders FROM orders GROUP BY Order_Learner_Id) as temp
ON learners.Learner_Id = temp.Order_Learner_Id


--2
SELECT LearnerFirstName , LearnerLastName , Order_Learner_Id ,total_orders , AVG(SUM(temp.total_orders)) OVER() as average_orders_per_learner
FROM 
(SELECT Order_Learner_Id , Count(Order_Learner_Id) as total_orders FROM orders GROUP BY Order_Learner_Id) as temp
JOIN learners
ON learners.Learner_Id = temp.Order_Learner_Id
GROUP BY temp.Order_Learner_Id



--CTE COMES IN

  SELECT LearnerFirstName , LearnerLastName , Order_Learner_Id ,total_orders ,  
(SELECT AVG(order_count) 
   FROM (
     SELECT COUNT(*) AS order_count 
     FROM orders 
     GROUP BY Order_Learner_Id
   ) AS subquery) AS average_orders_per_learner
FROM learners
JOIN (SELECT Order_Learner_Id , Count(Order_Learner_Id) as total_orders FROM orders GROUP BY Order_Learner_Id) as temp
ON learners.Learner_Id = temp.Order_Learner_Id


--
WITH Premium_user as(

  SELECT LearnerFirstName , LearnerLastName , Order_Learner_Id ,total_orders ,  
(SELECT AVG(order_count) 
   FROM (
     SELECT COUNT(*) AS order_count 
     FROM orders 
     GROUP BY Order_Learner_Id
   ) AS subquery) AS average_orders_per_learner
FROM learners
JOIN (SELECT Order_Learner_Id , Count(Order_Learner_Id) as total_orders FROM orders GROUP BY Order_Learner_Id) as temp
ON learners.Learner_Id = temp.Order_Learner_Id

)SELECT LearnerFirstName , LearnerLastName FROM Premium_user where total_orders > average_orders_per_learner;
