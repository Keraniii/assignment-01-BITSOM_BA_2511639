-- Q1: Total Sales Revenue by Store City
-- Helps identify which city is the top performer.
SELECT s.store_city, SUM(f.total_sales_amount) AS total_revenue
FROM FactSales f
JOIN DimStore s ON f.store_key = s.store_key
GROUP BY s.store_city
ORDER BY total_revenue DESC;

-- Q2: Top 3 Product Categories by Units Sold
-- Shows which types of items are moving fastest.
SELECT p.category, SUM(f.units_sold) AS total_units
FROM FactSales f
JOIN DimProduct p ON f.product_key = p.product_key
GROUP BY p.category
ORDER BY total_units DESC
LIMIT 3;

-- Q3: Monthly Sales Trend for 2023
-- Identifies seasonal peaks in shopping behavior.
SELECT d.month, SUM(f.total_sales_amount) AS monthly_revenue
FROM FactSales f
JOIN DimDate d ON f.date_key = d.date_key
WHERE d.year = 2023
GROUP BY d.month
ORDER BY d.month;
