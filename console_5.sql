SELECT CURDATE() AS DATE,
       CURTIME() AS TIME ,
       DAYOFMONTH(NOW()) AS DAY;


SELECT YEAR(NOW()),
       MONTH(NOW()),
       DAY(NOW()),
       HOUR(NOW()),
       MINUTE(NOW()),
       SECOND(NOW());

SELECT  DAYNAME(NOW()),
        MONTHNAME(NOW()),
        EXTRACT(YEAR FROM NOW());

USE sql_store;
SELECT *
FROM orders
WHERE order_date >= '2019-01-01';

SELECT *
FROM orders
WHERE YEAR(order_date) >= YEAR('2019-01-01');

SELECT DATE_FORMAT(NOW(), '%d,%m,%y');

SELECT DATE_FORMAT(NOW(), '%D,%M,%Y');

SELECT TIME_FORMAT(NOW(),'%H:%i %p');

SELECT DATE_ADD(NOW(),INTERVAL -1 DAY );

SELECT DATE_SUB(NOW(), INTERVAL 1 DAY );

SELECT DATEDIFF('2020-02-25' , '2020-02-20');

SELECT order_id,
       ifnull(shipper_id,'NOT ASSIGNED')
FROM orders;


SELECT order_id,
       COALESCE(shipper_id,comments,'NOT ASSIGNED') AS shipper
FROM orders;

SELECT CONCAT(first_name,SPACE(1),last_name) AS Customer,
IFNULL(phone,'unknown') AS PhoneNr
FROM customers;

SELECT order_id,
       order_date,
       IF(YEAR(order_date) = YEAR(NOW()),'Active','Archived')
FROM orders;

SELECT customer_id,
       first_name,
       points,
       CASE
WHEN points < 2000 THEN 'BRONZE'
WHEN points BETWEEN 2000 AND 3000 THEN 'SILVER'
WHEN points >= 3000 THEN 'GOLD'
END AS customer_type
FROM customers
ORDER BY first_name;

USE sql_invoicing;
DELETE
FROM invoices
WHERE invoice_id = 10;

SELECT *
FROM invoices;

