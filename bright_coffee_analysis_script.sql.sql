-- To see the columns in my table and the data types
SELECT*
FROM BRIGHTCOFFEE
LIMIT 10;

SELECT MIN(transaction_time) AS opening_time
FROM BRIGHTCOFFEE,

SELECT MAX(transaction_time) AS closing_time
FROM BRIGHTCOFFEE;

SELECT

     --DATES
    TO_DATE(transaction_date) AS purchase_date,
    DAYOFMONTH(TO_DATE(transaction_date)) AS day_of_month,
    DAYNAME(TO_DATE(transaction_date)) AS day_name,
    MONTHNAME(TO_DATE(transaction_date)) AS Month_name,
    TO_CHAR(TO_DATE(transaction_date), 'YYYYMM') AS month_id,

    CASE
       WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
       WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
       WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
       ELSE 'Night'
       END AS time_bucket,
       
    CASE 
       WHEN day_name NOT IN ('Sat', 'Sun') THEN 'Weekday'
       ELSE 'Weekend'
    END AS day_classification,

      ROUND(SUM(IFNULL(transaction_qty,0)*IFNULL(unit_price,0))) AS revenue,


    --COUNTS
    COUNT(DISTINCT transaction_id) AS number_of_sales,
    COUNT(DISTINCT product_id) AS number_of_unique_products,
    COUNT(DISTINCT store_id) AS number_of_shops,
    
    --Categories
    store_location,
    product_category,
    product_detail,
    product_type,

    
FROM BRIGHTCOFFEE,
GROUP BY ALL;
