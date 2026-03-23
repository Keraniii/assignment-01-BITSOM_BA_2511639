-- Q1: List all customers along with the total number of orders they have placed
/* Logic: Join the customer CSV with the order JSON and count the occurrences 
of order_id for each customer. */
SELECT 
    c.name, 
    COUNT(o.order_id) AS total_orders
FROM read_csv_auto('datasets/customers.csv') AS c
JOIN read_json_auto('datasets/orders.json') AS o 
    ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Q2: Find the top 3 customers by total order value
/* Logic: Sum the 'total_amount' from the JSON file for each customer 
and sort in descending order. */
SELECT 
    c.name, 
    SUM(o.total_amount) AS total_spent
FROM read_csv_auto('datasets/customers.csv') AS c
JOIN read_json_auto('datasets/orders.json') AS o 
    ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore
/* Logic: Perform a 3-way join across all file formats and filter 
by the city 'Bangalore'. */
SELECT DISTINCT p.product_name
FROM read_csv_auto('datasets/customers.csv') AS c
JOIN read_json_auto('datasets/orders.json') AS o 
    ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') AS p 
    ON o.order_id = p.order_id
WHERE c.city = 'Bangalore';

-- Q4: Join all three files to show: customer name, order date, product name, and quantity
/* Logic: Create a unified view by joining the CSV (customer info), 
JSON (order dates), and Parquet (product line items). */
SELECT 
    c.name AS customer_name, 
    o.order_date, 
    p.product_name, 
    p.quantity
FROM read_csv_auto('datasets/customers.csv') AS c
JOIN read_json_auto('datasets/orders.json') AS o 
    ON c.customer_id = o.customer_id
JOIN read_parquet('datasets/products.parquet') AS p 
    ON o.order_id = p.order_id;
