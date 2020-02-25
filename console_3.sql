-- self join
use sql_hr;
SELECT e.employee_id,
       e.first_name,
       e.job_title,
       m.first_name
FROM employees AS e
INNER JOIN employees AS m on e.reports_to = m.employee_id;

-- union
use sql_store;

SELECT order_date,
       'Active' AS status
FROM orders
WHERE order_date >= '2020-01-01'
UNION
SELECT  order_date,
       'Archived'
FROM orders
WHERE order_date < '2020-01-01';
-- UNION IS TO UNITE :P

SELECT c.customer_id,
       c.first_name,
       c.points,
       'Bronze' AS Points
FROM customers AS c
WHERE c.points < 2000
UNION
SELECT c.customer_id,
       c.first_name,
       c.points,
       'Silver' AS Points
FROM customers AS c
WHERE c.points BETWEEN 2000 AND 3000
UNION
SELECT c.customer_id,
       c.first_name,
       c.points,
       'Gold' AS Points
FROM customers AS c
WHERE c.points > 3000
ORDER BY first_name;
