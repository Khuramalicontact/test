# 2 dingen joinen
USE sql_store;
SELECT *
FROM orders AS o
INNER JOIN customers AS c
    ON o.customer_id = c.customer_id;

SELECT o.order_id,
       first_name,
       last_name,
       c.customer_id
from orders AS o
JOIN customers c on o.customer_id = c.customer_id;



Select order_id,
       p.product_id,
       quantity,
       p.unit_price,
       quantity * p.unit_price AS total_price,
       name
FROM products AS p
JOIN order_items oi on p.product_id = oi.order_id;


Select oi.product_id,
       p.name,
       oi.quantity,
       oi.unit_price
FROM order_items AS oi
JOIN products p on oi.product_id = p.product_id;

USE sql_invoicing;
SELECT date,
       c.name,
       p.name,
       payment_method
FROM payment_methods AS p
JOIN payments p2 on p.payment_method_id = p2.payment_method
JOIN clients c on p2.client_id = c.client_id;

USE sql_store;
SELECT c.customer_id,
       c.first_name,
       o.customer_id
FROM customers AS c
LEFT JOIN orders o on c.customer_id = o.customer_id;

SELECT c.customer_id,
       c.first_name,
       o.customer_id
FROM customers AS c
LEFT JOIN orders o USING(customer_id);
# LEFT LAAT OOK MENSEN DIE NIET BESTELD HEBBEN PRINTEN

SELECT c.customer_id,
       c.first_name,
       o.customer_id
FROM orders AS o
    RIGHT JOIN customers c USING(customer_id);
# ENKEL DE BESTELLING


SELECT p.product_id,
       p.name,
       oi.quantity
FROM order_items AS oi
JOIN products p on oi.product_id = p.product_id
LEFT OUTER JOIN orders o on oi.order_id = o.order_id;

# 3. OUTER JOIN
# ● Schrijf een query die dit resultaat oplevert.
# Dus we hebben hier 3 kolommen, product_id, naam, quantity die ik uit de
# order_items tabel heb geselecteerd.
# Dus hier moeten we de products tabel met order_items tabel samenvoegen,
# zodat we kunnen zien hoeveel keer elk product is besteld.
# Echter, als we een inner join doen, zullen we alleen de producten zien die zijn
# besteld, maar hier doe ik een outer join, dus ga je gang en schrijf een query
# om dit resultaat te produceren

SELECT p.product_id,
       p.name,
       SUM(o.quantity) AS total_sum
FROM order_items AS o
LEFT OUTER JOIN products p USING(product_id)
GROUP BY p.product_id, p.name
ORDER BY product_id;

# first_name(customer),customer_id(orders),name(shipper)

SELECT o.customer_id,
       c.first_name,
       s.name
FROM customers c
LEFT JOIN orders o USING(customer_id)
LEFT JOIN shippers s USING (shipper_id);






