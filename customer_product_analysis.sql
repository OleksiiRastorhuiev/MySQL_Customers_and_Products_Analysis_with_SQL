-- Question 1: Which products should we order more of or less of?
-- Question 2: How should we tailor marketing and communication strategies to customer behaviors?
-- Question 3: How much can we spend on acquiring new customers?

-- Open stores.db file with DB Browser for SQLite. Export each table as csv.alter
-- Create new DB in MySql, Import csv tables (by using INSERT INTO).

-- Explore the Data
-- Create a general table 
-- Answer business questions

use customer_product_analysis;
-- create table customers
DROP TABLE customers;
CREATE TABLE customers (
  customerNumber INTEGER NOT NULL,
  customerName NVARCHAR(50) NOT NULL,
  contactLastName NVARCHAR(50) NOT NULL,
  contactFirstName NVARCHAR(50) NOT NULL,
  phone NVARCHAR(50) NOT NULL,
  addressLine1 NVARCHAR(50) NOT NULL,
  addressLine2 NVARCHAR(50) DEFAULT NULL,
  city NVARCHAR(50) NOT NULL,
  state NVARCHAR(50) DEFAULT NULL,
  postalCode NVARCHAR(15) DEFAULT NULL,
  country NVARCHAR(50) NOT NULL,
  salesRepEmployeeNumber INTEGER DEFAULT NULL,
  creditLimit DECIMAL(10,2) DEFAULT NULL);
	
-- load into customers table
LOAD DATA LOCAL INFILE '/Users/oleksiirastorhuiev/SQL Project for github/customers.csv'
INTO TABLE customers
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
DROP TABLE employees;
-- create table employees
CREATE TABLE employees (
  employeeNumber INTEGER NOT NULL,
  lastName NVARCHAR(50) NOT NULL,
  firstName NVARCHAR(50) NOT NULL,
  extension NVARCHAR(10) NOT NULL,
  email NVARCHAR(100) NOT NULL,
  officeCode NVARCHAR(10) NOT NULL,
  reportsTo INTEGER DEFAULT NULL,
  jobTitle NVARCHAR(50) NOT NULL);

-- load data into table employees
LOAD DATA LOCAL INFILE '/Users/oleksiirastorhuiev/SQL Project for github/employees.csv'
INTO TABLE employees
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- create table offices
CREATE TABLE offices (
  officeCode NVARCHAR(10) NOT NULL,
  city NVARCHAR(50) NOT NULL,
  phone NVARCHAR(50) NOT NULL,
  addressLine1 NVARCHAR(50) NOT NULL,
  addressLine2 NVARCHAR(50) DEFAULT NULL,
  state NVARCHAR(50) DEFAULT NULL,
  country NVARCHAR(50) NOT NULL,
  postalCode NVARCHAR(15) NOT NULL,
  territory NVARCHAR(10) NOT NULL);

-- load data into table offices
LOAD DATA LOCAL INFILE '/Users/oleksiirastorhuiev/SQL Project for github/offices.csv'
INTO TABLE offices
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

DROP TABLE orderdetails;
-- create table orderdetails
CREATE TABLE orderdetails (
  orderNumber INTEGER NOT NULL,
  productCode NVARCHAR(15) NOT NULL,
  quantityOrdered INTEGER NOT NULL,
  priceEach DECIMAL(10,2) NOT NULL,
  orderLineNumber INTEGER NOT NULL);

-- load data into table orderdetails
LOAD DATA LOCAL INFILE '/Users/oleksiirastorhuiev/SQL Project for github/orderdetails.csv'
INTO TABLE orderdetails
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- create table orders
CREATE TABLE orders (
  orderNumber INTEGER NOT NULL,
  orderDate DATE NOT NULL,
  requiredDate DATE NOT NULL,
  shippedDate DATE DEFAULT NULL,
  status NVARCHAR (15) NOT NULL,
  comments TEXT,
  customerNumber INTEGER NOT NULL);

-- load data into orders
LOAD DATA LOCAL INFILE '/Users/oleksiirastorhuiev/SQL Project for github/orders.csv'
INTO TABLE orders
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- create table payments
CREATE TABLE payments (
  customerNumber INTEGER NOT NULL,
  checkNumber NVARCHAR(50) NOT NULL,
  paymentDate DATE NOT NULL,
  amount DECIMAL(10,2) NOT NULL);

-- load data into table payments
LOAD DATA LOCAL INFILE '/Users/oleksiirastorhuiev/SQL Project for github/payments.csv'
INTO TABLE payments
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- create table productlines
CREATE TABLE productlines (
  productLine NVARCHAR(50) NOT NULL,
  textDescription NVARCHAR(4000) DEFAULT NULL,
  htmlDescription MEDIUMTEXT,
  image MEDIUMBLOB);

-- load data into productlines table
LOAD DATA LOCAL INFILE '/Users/oleksiirastorhuiev/SQL Project for github/productlines.csv'
INTO TABLE productlines
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- create table products
CREATE TABLE products (
  productCode NVARCHAR(15) NOT NULL,
  productName NVARCHAR(70) NOT NULL,
  productLine NVARCHAR(50) NOT NULL,
  productScale NVARCHAR(10) NOT NULL,
  productVendor NVARCHAR(50) NOT NULL,
  productDescription TEXT NOT NULL,
  quantityInStock INTEGER(6) NOT NULL,
  buyPrice DECIMAL(10,2) NOT NULL,
  MSRP DECIMAL(10,2) NOT NULL);

-- insert into table products
LOAD DATA LOCAL INFILE '/Users/oleksiirastorhuiev/SQL Project for github/products.csv'
INTO TABLE products
CHARACTER SET utf8
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- The database schema contains 8 table. For exploration purpose, let's combine them into one table with following rows: 
-- table name, number of attributes and number of rows
USE customer_product_analysis;
SELECT 'Customers' AS table_name, 
		(SELECT COUNT(*)FROM information_schema.columns
	    WHERE table_name = 'customers'
        AND table_schema = 'customer_product_analysis') AS number_of_attribute,
		COUNT(*) AS number_of_row
FROM customers
UNION ALL
SELECT 'Employees' AS table_name, 
       (SELECT COUNT(*) 
        FROM information_schema.columns 
        WHERE table_name = 'employees'
        AND table_schema = 'customer_product_analysis') AS number_of_attributes,
       COUNT(*) AS number_of_rows
FROM employees
UNION ALL
SELECT 'Offices' AS table_name, 
		(SELECT COUNT(*)FROM information_schema.columns
	    WHERE table_name = 'offices'
        AND table_schema = 'customer_product_analysis') AS number_of_attribute,
		COUNT(*) AS number_of_row
FROM offices
UNION ALL
SELECT 'Orderdetails' AS table_name,
		(SELECT COUNT(*)FROM information_schema.columns
        WHERE table_name = 'orderdetails' 
        AND table_schema = 'customer_product_analysis') AS number_of_attribute,
        COUNT(*) AS number_of_row
FROM orderdetails
UNION ALL
SELECT 'Orders' AS table_name,
		(SELECT COUNT(*) FROM information_schema.columns
        WHERE table_name = 'orders'
        AND table_schema = 'customer_product_analysis') AS number_of_attribute,
        COUNT(*) AS number_of_row
FROM orders
UNION ALL
SELECT 'Payments' AS table_name,
		(SELECT COUNT(*) FROM information_schema.columns
        WHERE table_name = 'payments'
        AND table_schema = 'customer_product_analysis') AS number_of_attribute,
        COUNT(*) AS number_of_row
FROM payments
UNION ALL
SELECT 'Productlines' AS table_name,
		(SELECT COUNT(*) FROM information_schema.columns
        WHERE table_name = 'productlines'
        AND table_schema = 'customer_product_analysis') AS number_of_attribute,
        COUNT(*) AS number_of_row
FROM productlines
UNION ALL 
SELECT 'Products' AS table_name,
		(SELECT COUNT(*) FROM information_schema.columns
        WHERE table_name = 'products'
        AND table_schema = 'customer_product_analysis') AS number_of_attribute,
        COUNT(*) AS number_of_row
FROM products;

-- Q1: Which product should we order more or less ?
-- low stock = SUM(quantity ordered/quantityInStock)
SELECT productCode, ROUND(SUM(quantityOrdered) *1.0 / (SELECT quantityInStock
	FROM products p
	WHERE od.productCode = p.productCode), 2) AS low_stock
FROM orderdetails od
GROUP BY productCode
ORDER BY low_stock DESC
LIMIT 10;
SELECT productName, quantityInstock FROM products;
-- performance of products
SELECT productCode, ROUND(SUM(quantityOrdered * priceEach), 2) AS product_perf
FROM orderdetails
GROUP BY productCode
ORDER BY product_perf DESC;

-- priority products for restocking 
WITH low_stock_table AS ( 
SELECT productCode, ROUND(SUM(quantityOrdered) *1.0 / (SELECT quantityInStock
	FROM products p
	WHERE od.productCode = p.productCode), 2) AS low_stock
FROM orderdetails od
GROUP BY productCode
ORDER BY low_stock DESC
LIMIT 10),

products_to_restock AS (
SELECT productCode, 
       SUM(quantityOrdered * priceEach) AS product_perf
  FROM orderdetails od
 WHERE productCode IN (SELECT productCode
                         FROM low_stock_table)
 GROUP BY productCode 
 ORDER BY product_perf DESC
 LIMIT 10)
 SELECT productName, productLine
  FROM products AS p
 WHERE productCode IN (SELECT productCode
                         FROM products_to_restock);

-- Question 2: How Should We Match Marketing and Communication Strategies to Customer Behavior?

-- 2.1. creating CTE, finding top 5 customers by profit:
WITH
profit_customer_table AS (
SELECT o.customerNumber, ROUND(SUM(od.quantityOrdered * (priceEach - buyPrice)),2) AS profit
FROM products p 
JOIN orderdetails od
ON od.productCode = p.productCode
JOIN orders o
ON o.orderNumber = od.orderNumber
GROUP BY o.customerNumber)

SELECT contactFirstName, city, country, pt.profit
FROM customers c
JOIN profit_customer_table pt
ON pt.customerNumber = c.customerNumber
ORDER BY pt.profit DESC
LIMIT 5; -- top five customers: Diego, Susan, Jeff, Peter, Janine

-- 2.2. creating CTE, find less-engaged 5 customers:
WITH
profit_customer_table AS (
SELECT o.customerNumber, ROUND(SUM(od.quantityOrdered * (priceEach - buyPrice)),2) AS profit
FROM products p 
JOIN orderdetails od
ON od.productCode = p.productCode
JOIN orders o
ON o.orderNumber = od.orderNumber
GROUP BY o.customerNumber)

SELECT contactFirstName, city, country, pt.profit
FROM customers c
JOIN profit_customer_table pt
ON pt.customerNumber = c.customerNumber
ORDER BY pt.profit ASC
LIMIT 5; -- 5 less-engaged customers: Mary, Leslie, Franko, Carine, Thomas


-- Question 3: How Much Can We Spend on Acquiring New Customers?

-- 3.1. find the number of new customers arriving each month

WITH
payment_with_year_month_table AS (
SELECT *,
EXTRACT(YEAR FROM paymentDate) * 100 + EXTRACT(MONTH FROM paymentDate) as year_and_month
FROM payments p
),
customers_by_month_table AS (
SELECT p1.year_and_month, COUNT(*) AS number_of_customers, SUM(p1.amount) AS total
  FROM payment_with_year_month_table p1
 GROUP BY p1.year_and_month
),

new_customers_by_month_table AS (
SELECT p1.year_and_month, 
       COUNT(DISTINCT customerNumber) AS number_of_new_customers,
       SUM(p1.amount) AS new_customer_total,
       (SELECT number_of_customers
          FROM customers_by_month_table c
        WHERE c.year_and_month = p1.year_and_month) AS number_of_customers,
       (SELECT total
          FROM customers_by_month_table c
         WHERE c.year_and_month = p1.year_and_month) AS total
  FROM payment_with_year_month_table p1
 WHERE p1.customerNumber NOT IN (SELECT customerNumber
                                   FROM payment_with_year_month_table p2
                                  WHERE p2.year_and_month < p1.year_and_month)
 GROUP BY p1.year_and_month
)

SELECT year_and_month, 
       ROUND(number_of_new_customers*100/number_of_customers,1) AS number_of_new_customers_props,
       ROUND(new_customer_total*100/total,1) AS new_customers_total_props
  FROM new_customers_by_month_table;


-- As it can be seen, the number of customers has been decreasing since 2003, reaching the lowest values in 2004. 
-- Based on that, it is reasonable to expend money acquiring new customers.

-- For the purpose of finding how much money we can spend acquiring new customers, we can calculate the Customer Lifetime Value (LTV), 
-- which is important KPI metric. It referes to the average amount of money a customer generates throughout its relationship with a company.

--  How much can we spend on acquiring new customers?

WITH
profit_customer_table AS (
SELECT o.customerNumber, ROUND(SUM(od.quantityOrdered * (priceEach - buyPrice)),2) AS profit
FROM products p 
JOIN orderdetails od
ON od.productCode = p.productCode
JOIN orders o
ON o.orderNumber = od.orderNumber
GROUP BY o.customerNumber)
SELECT ROUND(AVG(pt.profit),2) AS lifetimevalue
  FROM profit_customer_table pt; -- 39032.54






