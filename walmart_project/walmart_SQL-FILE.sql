-- WALMART PROJECT IN MYSQL
SELECT * FROM wallmartdata.walmart_sales LIMIT 10;
-- 1 Count total records
SELECT COUNT(*) FROM walmart_sales;
-- 2 List all unique product categories
SELECT DISTINCT category FROM walmart_sales;
-- 3 List all unique payment methods used
SELECT DISTINCT payment_method FROM walmart_sales;
-- 4 List all unique customer types (e.g., Member, Normal)
SELECT DISTINCT Custom FROM walmart_sales;
-- 5 Find the earliest and latest transaction dates
SELECT MIN(date), MAX(date) FROM walmart_sales;
-- 6 Count total number of unique invoices
SELECT COUNT(DISTINCT invoice_ID) FROM walmart_sales;
-- 7 Count total number of unique transaction dates
SELECT COUNT(DISTINCT date) FROM walmart_sales;
-- // Sales and Revenue Analysis//
-- 8 Calculate total revenue from all sales
SELECT SUM(Total_Sale) FROM walmart_sales;

-- 9 Calculate average sale value
SELECT AVG(Total_Sale) FROM walmart_sales;

-- 10 Total sales grouped by city
SELECT City, SUM(Total_Sale) FROM walmart_sales GROUP BY City;
-- 11 Total sales grouped by product category
SELECT category, SUM(Total_Sale) FROM walmart_sales GROUP BY category;
-- 12 Total sales grouped by payment method
SELECT payment_method, SUM(Total_Sale) FROM walmart_sales GROUP BY payment_method;
-- 13 Daily total sales trend
SELECT date, SUM(Total_Sale) FROM walmart_sales GROUP BY date ORDER BY date;
-- Yearly total sales trend
SELECT YEAR(date) AS Year, SUM(Total_Sale) FROM walmart_sales GROUP BY Year;
-- 14 Monthly total sales trend
SELECT MONTH(date) AS Month, SUM(Total_Sale) FROM walmart_sales GROUP BY Month;
-- 15 Average unit price per category
SELECT category, AVG(unit_price) FROM walmart_sales GROUP BY category;
-- 16 Total quantity sold per category
SELECT category, SUM(quantity) FROM walmart_sales GROUP BY category;
-- 17 Highest unit price per category
SELECT category, MAX(unit_price) FROM walmart_sales GROUP BY category;
-- 18 Top 5 highest value invoices
SELECT invoice_ID, Total_Sale FROM walmart_sales ORDER BY Total_Sale DESC LIMIT 5;
-- 19 Top 3 branches by average sale value
SELECT Branch, AVG(Total_Sale) FROM walmart_sales GROUP BY Branch ORDER BY AVG(Total_Sale) DESC LIMIT 3;
-- 20 List all unique cities where sales occurred
SELECT DISTINCT City FROM walmart_sales;
-- 📉 Underperformers--////
-- 21 Bottom 3 branches by total sales
SELECT Branch, SUM(Total_Sale) FROM walmart_sales GROUP BY Branch ORDER BY SUM(Total_Sale) ASC LIMIT 3;

-- 22 Bottom 3 categories by average sale value
SELECT category, AVG(Total_Sale) FROM walmart_sales GROUP BY category ORDER BY AVG(Total_Sale) ASC LIMIT 3;

-- 23 Payment methods with lowest average sale value
SELECT payment_method, AVG(Total_Sale) FROM walmart_sales GROUP BY payment_method ORDER BY AVG(Total_Sale) ASC;

-- 24 Bottom 5 invoices by sale value
SELECT invoice_ID, Total_Sale FROM walmart_sales ORDER BY Total_Sale ASC LIMIT 5;
-- 📅 Time-Based Trends
    -- 25 Total sales grouped by day of the week
SELECT DAYNAME(date) AS Day, SUM(Total_Sale) FROM walmart_sales GROUP BY Day;
-- 26 Total sales grouped by month name
SELECT MONTHNAME(date) AS Month, SUM(Total_Sale) FROM walmart_sales GROUP BY Month;
select * from walmart_sales;






