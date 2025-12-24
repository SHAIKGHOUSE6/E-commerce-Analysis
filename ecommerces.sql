use laptop_db;
select * from ecommerce;
SELECT COUNT(*) AS total_products
FROM ecommerce;
SELECT COUNT(DISTINCT category) AS total_categories
FROM ecommerce;
DELETE FROM ecommerce
WHERE product_id NOT IN (
    SELECT MIN(product_id)
    FROM ecommerce
    GROUP BY productTitle, category, price
);
UPDATE ecommerce
SET category = 'Others'
WHERE category IS NULL;

SELECT
    ROUND(SUM(price * sold), 2) AS total_revenue
FROM ecommerce;
SELECT 
    SUM(sold) AS total_units_sold
FROM ecommerce;
SELECT 
    ROUND(AVG(price), 2) AS avg_price
FROM ecommerce;
SELECT 
    category,
    ROUND(SUM(price * sold), 2) AS revenue
FROM ecommerce
GROUP BY category
ORDER BY revenue DESC;
SELECT 
    category,
    SUM(sold) AS units_sold
FROM ecommerce
GROUP BY category
ORDER BY units_sold DESC;
SELECT 
    category,
    ROUND(AVG(price), 2) AS avg_price
FROM ecommerce
GROUP BY category
ORDER BY avg_price DESC;
SELECT 
    productTitle,
    SUM(sold) AS units_sold
FROM ecommerce
GROUP BY productTitle
ORDER BY units_sold DESC
LIMIT 10;
SELECT 
    productTitle,
    ROUND(SUM(price * sold), 2) AS revenue
FROM ecommerce
GROUP BY productTitle
ORDER BY revenue DESC
LIMIT 10;
SELECT 
    CASE 
        WHEN price < 100 THEN 'Low Price'
        WHEN price BETWEEN 100 AND 300 THEN 'Mid Price'
        ELSE 'High Price'
    END AS price_band,
    SUM(sold) AS units_sold
FROM ecommerce
GROUP BY price_band
ORDER BY units_sold DESC;
SELECT 
    category,
    COUNT(DISTINCT productTitle) AS total_products,
    SUM(sold) AS total_units_sold,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(SUM(price * sold), 2) AS total_revenue
FROM ecommerce
GROUP BY category
ORDER BY total_revenue DESC;



