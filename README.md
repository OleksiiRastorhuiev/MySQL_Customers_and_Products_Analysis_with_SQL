# MySQL Customers and Products Analysis
## Project Objective
The objective of this project is to analyze a database for sales data of cars, answering key business questions and extracting valuable insights for decision-making.  
The following the **key questions** that have to be answered in this project:

> * Question 1: Which products should we order more of or less of?
> * Question 2: How should we tailor marketing and communication strategies to customer behaviors?
> * Question 3: How much can we spend on acquiring new customers?

## Tools and Database
* MySQL will be utilized to perform this project.
* DB Browser for SQLITE will be used to open SQLite database called „stores.db“. This public database can be downloaded [hier](https://dq-content.s3.amazonaws.com/600/stores.db).  Following that, 8 tables will be exported in csv format. After that the data can be easily imported into MySQL database.
* Database contains no duplicated rows, which ensures data integrity and prevents data redundancy. Despite some missing values, we can perform data analysis for this specific project, knowing that those missing values will not impact our objectives.

### Explore the dataset

The database contains 8 tables:

* Customers: data related to customers
* Employees: employee information
* Offices: information about sales offices
* Orders: customers' sales orders
* OrderDetails: sales order line for each sales order
* Payments: records of customers' payment
* Products: a list of cars
* ProductLines: a list of product line categories

For the exploratory purpose, let's display a table with the following information: table name, number of attributes, number of rows:

<img width="313" src="https://github.com/user-attachments/assets/19b8e721-a5c1-48b0-bf5a-c3a3275e1565">

### Question 1: which products should we order more or less?

This question referes to inventory reports, including low stock and performance of products.
* low stock can be defined as a sum of each product ordered devided by the quantity of this product in the stock. And we will consider 10 highest rates (products "out-of-stock")
* performance represents the sum of sales per product
* products with a high priority for restockimg are those in-demand(out-of-stock) and with high performance

Low-stock products are:

<img width="200" src="https://github.com/user-attachments/assets/cfefeb5e-8539-41d4-a52d-f9d4edd1b229">

Performance of products:

<img width="200"  src="https://github.com/user-attachments/assets/d0fe3a44-d443-4de3-acb9-ce620081c713">

Priority products for restocking:

<img width="230" src="https://github.com/user-attachments/assets/b01b8ba2-fe1a-49b5-8ff7-bd90ba7806ee">

### Question 2: How should we tailor marketing and communication strategies to customer behaviors?

In order to answer this question, we need to categoruze customers into 2 groups: 

* TOP customers generate the highest profit
* less-engaged customers bring us the lowest profit

As possible marketing activity, we could organize events for VIP customers and launch marketing campain for less-engaged customers to increase their loyalty.

Top 5 customers:

<img width="315" src="https://github.com/user-attachments/assets/25970cc0-75a8-4996-942e-8a22c55192b5">

5 less-engaged customers:

<img width="315"  src="https://github.com/user-attachments/assets/d8b22c38-2f3d-4455-9a2b-228b4ae729e1">

### Question 3: How much can we spend on acquiring new customers?

Prior to answering this question, it can be worth finding the number of new customers arriving each month. By doing this we can check if it is worth to invest money on acquiring new customers.


<img width="535"  src="https://github.com/user-attachments/assets/6fa769d0-1764-4b42-81bc-43b4c972954c">

As it can be seen, the number of customers has been decreasing since 2003, reaching the lowest values in 2004. Based on that, it is reasonable to expend money acquiring new customers.

For the purpose of finding how much money we can spend acquiring new customers, we can calculate the Customer Lifetime Value (LTV), which is important KPI metric. It referes to the average amount of money a customer generates throughout its relationship with a company.

average cost for customer acquisition:

<img width="95"  src="https://github.com/user-attachments/assets/a47a0ff7-c4f7-4aca-987f-1ce6073714c7">

### Conclusion

This project has demonstrated the effectiveness of data analysis for support of business decisions in the field of sales. Analyzing of products, customers by extracting key performance indicators (KPIs), we can contribute to decisions that lead to significant time, resource, and cost savings.
