# LaunchMart Loyalty Analytics

## Business Scenario:
LaunchMart is a growing African e-commerce company that recently launched a loyalty program to increase customer retention. Customers earn points when they place orders and extra bonus points during promotions. The Data Team has been asked to analyze customer behavior, revenue performance, and loyalty engagement.

As a data engineer at LaunchMart, my manager has asked me to explore the company's customer, orders, and loyalty program data to help the marketing and operations teams make informed decisions.

This dataset includes customers, products, orders, order items, and loyalty points earned tables.

## Setup
To create the database tables, I have been provided with the database DDL statements in the 01_schema.sql file. After creating the table, used the seed data provided in the 02_see_data.sql file to insert sample data into the tables. See the 03_launchMart_erd.png file for the ERD to understand the relationship between the tables.

The Database was setup via a docker compose.

## Task 1
- Count the total number of customers who joined in 2023.

![task1](https://github.com/user-attachments/assets/b393e741-4ebb-4e3a-b6c8-ec33150151db)

## Task 2
- For each customer return customer_id, full_name, total_revenue (sum of total_amount from orders). Sort descending.

![task2](https://github.com/user-attachments/assets/23d139b7-6d3a-41d7-972f-5cdc9fd16e3c)

## Task 3
- Return the top 5 customers by total_revenue with their rank.

![task3](https://github.com/user-attachments/assets/649abc81-1d9f-43ab-b803-15290e205dcf)


