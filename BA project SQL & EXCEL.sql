CREATE DATABASE customer_analysis;
USE customer_analysis;
SELECT * FROM sales_data;
ALTER TABLE sales_data
CHANGE `Customer Name` customer_name VARCHAR(50);
ALTER TABLE sales_data
CHANGE `Product Name` product_name VARCHAR(500);
ALTER TABLE sales_data
CHANGE `Order Date` order_date VARCHAR(50);


#Total sales
SELECT sum(sales) as total_spent FROM sales_data;

#Top Customers
SELECT customer_name, sum(sales) AS total_spent 
FROM sales_data
group by customer_name
order by total_spent desc
LIMIT 10;
 
 #Sales by region
 SELECT region, Sum(sales) AS total_spent
 FROM sales_data
 GROUP BY region
 ORDER BY total_spent Desc;
 
 #Most Popular Product
 SELECT product_name, SUM(quantity) AS total_quantity
 FROM sales_data
 GROUP BY product_name
 ORDER BY total_quantity desc
 LIMIT 10;
 
 #category performance
 SELECT category, sum(sales) as total_spent
 FROM sales_data
 group by category
 order by total_spent desc
 limit 10; 	
 
 #monthly sales trend
 SELECT MONTHNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) as month, SUM(sales) AS monthly_sales
 FROM sales_data
 GROUP BY month
 ORDER BY month;
