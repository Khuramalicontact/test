SELECT *
FROM beers
WHERE Name LIKE '%wit%';

SELECT *
FROM beers
WHERE Name REGEXP 'wit';

SELECT Name
FROM beers
WHERE Name LIKE 'af%';

SELECT Name
FROM beers
WHERE Name REGEXP '^af';

SELECT *
FROM beers
WHERE Name LIKE '%a';

SELECT *
FROM beers
WHERE Name REGEXP 'a$';

SELECT *
FROM beers
WHERE Name LIKE '%wit%'
OR Name LIKE '%af%';

SELECT *
FROM beers
WHERE Name REGEXP 'wit|af';


SELECT *
FROM beers
WHERE Name REGEXP '^a|c$';

SELECT *
FROM beers
WHERE Name REGEXP '[be]a';

SELECT *
FROM beers
WHERE Name REGEXP '[c-h]a';