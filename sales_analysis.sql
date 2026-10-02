-- Query 1: Product Price Overview
SELECT product_name, category, unit_price
FROM products;

-- Query 2: Products Priced Above RM200
SELECT product_name, unit_price
FROM products
WHERE unit_price > 200;

-- Query 3: Top 5 Most Expensive Products
SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC
LIMIT 5;

-- Query 4: Completed Orders with Customer Names
SELECT customer_name, status
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE status = 'Completed';

-- Query 5: Order Count by Status
SELECT status, count(status)
FROM orders
GROUP BY status;

-- Query 6: Total Quantity Sold by Product
SELECT product_name, SUM(quantity) AS total_quantity
FROM products
INNER JOIN orders
ON products.product_id = orders.product_id
WHERE status != 'Cancelled'
GROUP BY product_name;

-- Query 7: Average Product Price by Category
SELECT category, avg(unit_price) as avgunitprice
from products
GROUP BY category;

-- Query 8: Revenue by Product After Discount
SELECT product_name, SUM(quantity * unit_price * (1 - discount_pct / 100.0)) AS total_revenue
FROM products
INNER JOIN orders
ON products.product_id = orders.product_id
WHERE status = 'Completed'
GROUP BY product_name;

-- Query 9: Customers with More Than 3 Completed Orders
SELECT customer_name, COUNT(orders.order_id) AS completed_orders
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE status = 'Completed'
GROUP BY customers.customer_id, customer_name
HAVING COUNT(orders.order_id) > 3;

-- Query 10: Revenue by Customer Segment
SELECT segment, sum(quantity * unit_price) AS total_revenue
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
INNER JOIN products
ON orders.product_id = products.product_id
WHERE status = 'Completed'
GROUP BY segment;
