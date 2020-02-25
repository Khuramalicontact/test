INSERT INTO customers( customer_id, first_name, last_name, birth_date, phone, address, city, state, points)
VALUES(DEFAULT,'john','smith','1945-08-21',NULL,'address','city','CA',DEFAULT);

INSERT INTO orders(customer_id, order_date, comments, shipped_date, shipper_id)
VALUES(LAST_INSERT_ID(),'1945-08-21',NULL,'1945-08-21',2);
