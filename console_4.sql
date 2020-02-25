USE sql_store;

-- subquerry
SELECT *
FROM products
WHERE unit_price > (
    SELECT unit_price
    FROM products
    WHERE product_id = 3
    );

-- subquerry wordt als eerst uitgevoerd
-- als je geen joins wil gebruiken,

USE sql_invoicing;

SELECT  invoice_id,
       invoice_total,
       (SELECT TRUNCATE(AVG(invoice_total),2)
           FROM invoices) AS InvoiceAverage,
      TRUNCATE(invoice_total - (SELECT AVG(invoice_total)
           FROM invoices),2) AS difference
       FROM invoices;


SELECT *
FROM(SELECT client_id,
            name,
            (SELECT SUM(invoice_total)
                FROM invoices
                WHERE client_id = c.client_id) AS TotalSales
    FROM clients as c ) AS SaleSummary
WHERE TotalSales IS NOT NULL;

USE sql_hr;
# In onze hr-database, schrijf een query om alle werknemers te vinden die meer
# dan gemiddeld verdienen
SELECT first_name,
       last_name,
       salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees);
# Zoek klanten zonder facturen (gebruik NOT IN)
USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id NOT IN (
    SELECT client_id
    FROM invoices);



# confusing
# SELECT salary,
#        first_name,
#        employee_id,
#        (SELECT AVG(salary) AS Average
#        FROM employees
#        WHERE salary >  (SELECT AVG(salary) AS A))
# FROM employees;
#
#
# SELECT salary,
#        first_name,
#        employee_id
# FROM employees
# WHERE salary > (SELECT AVG(salary) FROM employees);

# Zoek klanten die lettuce hebben besteld (id = 3). Selecteer in uw Select
# statement de customer_id, first_name, last_name.
# We kunnen dit probleem oplossen door zowel de subquery als de join te
# gebruiken. Dus als onderdeel van deze oefening, wil ik dat je met beide
# oplossingen komt en degene kiest die meer leesbaar is.

USE sql_store;

# Moeilijke manier
# SELECT  customer_id,
#        first_name,
#        last_name
# FROM customers
# WHERE customer_id IN (
#     SELECT o.customer_id
#     FROM orders AS o
#     WHERE o.order_id IN (
#         SELECT order_id
#         FROM order_items
#         WHERE product_id = 3
#         ));
# Subquery manier
SELECT  customer_id,
       first_name,
       last_name
FROM customers
WHERE customer_id IN (
    SELECT o.customer_id
    FROM orders AS o
    INNER JOIN  order_items oi USING (order_id)
WHERE product_id = 3);

# with inner join
SELECT DISTINCT customer_id,
       first_name,
       last_name
FROM customers
INNER JOIN orders USING (customer_id)
INNER JOIN order_items USING (order_id)
WHERE product_id = 3;

# schrijf een query tegen de invoices tabel om dit rapport te genereren
#
# Hier hebben we 4 kolommen date_range, total_sales,
# total_payment,what_we_expect wat het verschil is tussen deze 2
# kolommen(2,3).in deze tabel hebben we 3 records, we zien eerst alle
# bedragen voor de eerste helft van 2019, dan voor de tweede helft van 2019
# en dan gevolgd door het totaal

USE sql_invoicing;
SELECT 'First half of 2019' AS date_range,
       SUM(invoice_total) AS total_sales,
       SUM(payment_total) AS total_payments,
       (SUM(invoice_total) - SUM(payment_total)) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT 'Second half of 2019' AS date_range,
       SUM(invoice_total) AS total_sales,
       SUM(payment_total) AS total_payments,
       (SUM(invoice_total) - SUM(payment_total)) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT 'Total' AS date_range,
       SUM(invoice_total) AS total_sales,
       SUM(payment_total) AS total_payments,
       (SUM(invoice_total) - SUM(payment_total)) AS what_we_expect
FROM invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-12-31'