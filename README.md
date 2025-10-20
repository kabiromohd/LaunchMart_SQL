# LaunchMart Loyalty Analytics

## Business Scenario:
LaunchMart is a growing African e-commerce company that recently launched a loyalty program to increase customer retention. Customers earn points when they place orders and extra bonus points during promotions. The Data Team has been asked to analyze customer behavior, revenue performance, and loyalty engagement.

As a data engineer at LaunchMart, my manager has asked me to explore the company's customer, orders, and loyalty program data to help the marketing and operations teams make informed decisions.

This dataset includes customers, products, orders, order items, and loyalty points earned tables.

## Setup
To create the database tables, I have been provided with the database DDL statements in the 01_schema.sql file. After creating the table, used the seed data provided in the 02_see_data.sql file to insert sample data into the tables. See the 03_launchMart_erd.png file for the ERD to understand the relationship between the tables.

The Database was setup via a docker compose. Clone repo and run below command on your terminal to get started

```
git clone https://github.com/kabiromohd/LaunchMart_SQL.git

cd LaunchMart_SQL

docker-compose up

```
Connect to pgAdmin via ```localhost:8090```

Run the SQL scripts provided in 01_schema.sql and then 02_see_data.sql to populate the database.

## Task 1
- Count the total number of customers who joined in 2023.

```
SELECT COUNT(*) AS customers_joined_2023
FROM customers
WHERE join_date BETWEEN '2023-01-01' AND '2023-12-31';

```

![task1](https://github.com/user-attachments/assets/b393e741-4ebb-4e3a-b6c8-ec33150151db)

## Task 2
- For each customer return customer_id, full_name, total_revenue (sum of total_amount from orders). Sort descending.

```
SELECT
    c.customer_id,
    c.full_name,
-- Handle customers with no orders using COALESCE
    COALESCE(SUM(o.total_amount), 0) AS total_revenue
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY total_revenue DESC;
```

![task2](https://github.com/user-attachments/assets/23d139b7-6d3a-41d7-972f-5cdc9fd16e3c)

## Task 3
- Return the top 5 customers by total_revenue with their rank.

```
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.full_name,
        COALESCE(SUM(o.total_amount), 0) AS total_revenue
    FROM customers c
    LEFT JOIN orders o ON o.customer_id = c.customer_id
    GROUP BY c.customer_id, c.full_name
)
SELECT
    customer_id,
    full_name,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM customer_revenue
ORDER BY revenue_rank
LIMIT 5;
```

![task3](https://github.com/user-attachments/assets/649abc81-1d9f-43ab-b803-15290e205dcf)

## Task 4
- Produce a table with year, month, monthly_revenue for all months in 2023 ordered chronologically.

```
WITH months AS (
    SELECT generate_series(DATE '2023-01-01', DATE '2023-12-01', INTERVAL '1 month') AS month_start
)
SELECT
    EXTRACT(YEAR FROM m.month_start) AS year,
    TO_CHAR(m.month_start, 'Month') AS month,
    COALESCE(SUM(o.total_amount), 0) AS monthly_revenue
FROM months m
LEFT JOIN orders o
    ON o.order_date >= m.month_start
   AND o.order_date < (m.month_start + INTERVAL '1 month')
GROUP BY m.month_start
ORDER BY m.month_start;
```

![task4](https://github.com/user-attachments/assets/d00b31cc-67b9-462a-abc8-fab364c951a8)

## Task 5
- Find customers with no orders in the last 60 days relative to 2023-12-31 (i.e., consider last active date up to 2023-12-31). Return customer_id, full_name, last_order_date.

```
WITH last_orders AS (
    SELECT
        customer_id,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.full_name,
    lo.last_order_date
FROM customers c
LEFT JOIN last_orders lo ON c.customer_id = lo.customer_id
WHERE lo.last_order_date IS NULL
   OR lo.last_order_date <= DATE '2023-12-31' - INTERVAL '60 days'
ORDER BY lo.last_order_date NULLS FIRST;
```

![task5](https://github.com/user-attachments/assets/84a877a0-4a82-4633-9185-78f53f21fe09)

## Task 6
- Calculate average order value (AOV) for each customer: return customer_id, full_name, aov (average total_amount of their orders). Exclude customers with no orders.

![task6](https://github.com/user-attachments/assets/d3718365-f308-425e-82d3-9a01933aac7c)

## Task 7
- For all customers who have at least one order, compute customer_id, full_name, total_revenue, spend_rank where spend_rank is a dense rank, highest spender = rank 1.

![task7](https://github.com/user-attachments/assets/6ded85e6-4b8c-4361-bd18-9a4d1e8d44b5)

## Task 8
- List customers who placed more than 1 order and show customer_id, full_name, order_count, first_order_date, last_order_date.

![task8](https://github.com/user-attachments/assets/a8efab92-1560-4ec9-a632-be63d91a4f54)

## Task 9
- Compute total loyalty points per customer. Include customers with 0 points.

![task9](https://github.com/user-attachments/assets/0c3f5110-5553-4f5a-b6a7-9f90ac22cf01)

## Task 10
- Assign loyalty tiers based on total points:

Bronze: < 100
Silver: 100–499
Gold: >= 500
Output: tier, tier_count, tier_total_points

![task10](https://github.com/user-attachments/assets/a2a76e98-884f-4cdd-bdad-9faf69a407cc)

## Task 11
- Identify customers who spent more than ₦50,000 in total but have less than 200 loyalty points. Return customer_id, full_name, total_spend, total_points.

![task11](https://github.com/user-attachments/assets/8d4af110-e139-427f-9135-af31ac16c154)

## Task 12
- Flag customers as churn_risk if they have no orders in the last 90 days (relative to 2023-12-31) AND are in the Bronze tier. Return customer_id, full_name, last_order_date, total_points.

![task12](https://github.com/user-attachments/assets/9b2de198-9635-48d9-b2f6-913961f1d32d)









