CREATE DATABASE ecomm_sales;


USE ecomm_sales;
CREATE TABLE sales_data (
    order_id VARCHAR(50),
    order_date VARCHAR(50),
    ship_date VARCHAR(50),
    ship_mode VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    market VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales INT,
    quantity INT,
    discount FLOAT,
    profit FLOAT,
    shipping_cost FLOAT,
    order_priority VARCHAR(50),
    year int
);

drop table sales_data;

SET GLOBAL local_infile = 1;

-- one way
LOAD DATA LOCAL INFILE 'C:/Users/DELL/Desktop/Sales_Dataset.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SHOW GLOBAL VARIABLES LIKE 'local_infile';

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sales_Dataset.csv'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from sales_data;

ALTER TABLE sales_data
ADD COLUMN order_date_converted DATE,
ADD COLUMN ship_date_converted DATE;

UPDATE sales_data
SET
  order_date_converted = STR_TO_DATE(order_date, '%d-%m-%Y'),
  ship_date_converted = STR_TO_DATE(ship_date, '%d-%m-%Y');


--give 3 states with highest shipping cost


--1
SELECT state , MAX(shipping_cost) as ship_cost FROM sales_data GROUP BY state 

--2

SELECT state , MAX(shipping_cost) as ship_cost FROM sales_data GROUP BY state ORDER BY ship_cost DESC

--3
SELECT state , MAX(shipping_cost) as ship_cost FROM sales_data GROUP BY state ORDER BY ship_cost DESC LIMIT 3
