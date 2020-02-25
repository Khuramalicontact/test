# Tellen
SELECT COUNT(*)
FROM beers;

SELECT COUNT(Image)
FROM beers;

# maximum
SELECT MAX(Alcohol) AS Maximum
FROM beers;

# minumum
SELECT MIN(Alcohol) AS Minimum
FROM beers;

# sum
SELECT SUM(Alcohol * 1) as Total
FROM beers;

SELECT AVG(Alcohol) AS Average,Name
FROM beers
GROUP BY BrewerId;

SELECT LEFT(Name,1) AS firstletter,AVG(Alcohol) AS average
FROM  beers
GROUP BY firstletter;

# afgerond
SELECT ROUND(Price,2)
FROM beers;

SELECT MIN(Alcohol) AS Minimum,BrewerId
FROM beers
GROUP BY BrewerId
HAVING Minimum < 5;

SELECT MIN(Alcohol) AS Minimum,BrewerId, MIN(Stock) AS Stock_Name
FROM beers
GROUP BY BrewerId
HAVING Stock_Name < 5;

SELECT BrewerId, AVG(Alcohol) AS Average
FROM beers
GROUP BY BrewerId
HAVING COUNT(*) > 10;

SELECT name,
       Turnover *  0.80,
       Turnover * 0.96
FROM brewers;

# (a) Hoeveel verschillende brouwers zitten er in de database? (118)
SELECT COUNT(Name) AS Total
FROM brewers;

# (b) Bereken de gemiddelde turnover van alle brouwers.
# (114302.1525)
SELECT AVG(Turnover) AS Average
FROM brewers;

# (c) Geef het laagste, gemiddelde en hoogste alcoholgehalte uit de beers tabel in 1
# instructie.
# (0, 5.8706, 15)
SELECT MIN(Alcohol),
       TRUNCATE(AVG(Alcohol),4),
       MAX(Alcohol)
FROM beers;

# (d) Bereken de gemiddelde turnover van alle brouwers in de provincie Brabant
# (postcodes die beginnen met een 1) maar negeer de brouwerij ‘Palm’.
# (39525.7143)

SELECT AVG(Turnover)
FROM brewers
WHERE LEFT(ZipCode,1) = 1 AND Name NOT LIKE 'Palm';

# WHERE ZipCode LIKE '1%'
# AND Name NOT LIKE 'Palm';


# (e) Bereken het gemiddelde alcohol per categorie(id).
# (39)
SELECT AVG(Alcohol)
FROM beers
GROUP BY CategoryId;

# (f) Toon de hoogste bier prijs per categorie maar negeer alle bieren die niet in stock
# zijn. Sorteer het resultaat op categorieid. Zorg er ook voor dat we enkel prijzen zien
# die hoger zijn dan 3.
# (5 records)
SELECT MAX(Price) max
from beers
WHERE Stock <> 0
GROUP BY CategoryId
HAVING max > 3;