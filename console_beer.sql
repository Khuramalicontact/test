# (a) Geef een lijst van alle biercategorieen. (38)
SELECT *
FROM categories;

# (b) Toon de lijst van categorieen in dalende alfabetische volgorde zonder de
# categorie-id’s. (38)
SELECT Category
FROM categories
ORDER BY Category DESC;

# (c) Toon een lijst van alle brouwerijen die meer dan 5000 Euro turnover hebben. (54)
SELECT Turnover
FROM brewers
WHERE Turnover > 5000;

# (d) Toon nu enkel de naam en de stad van de brouwerijen die minder dan 5000 Euro
# turnover, maar niet 0. Sorteer de lijst op basis van de turnover. (53)
SELECT Name,City
FROM brewers
WHERE Turnover < 5000
AND Turnover <> 0;
# <> niet/ != ook niet

# (e) Geef een lijst van alle mogelijke alcoholgehaltes in de beers tabel. Dus geen
# dubbels. En gesorteerd van groot naar klein. (14)
SELECT DISTINCT Alcohol
FROM beers
ORDER BY Alcohol DESC;

# (f) Toon alle namen van bieren waarvan de naam “wit” bevat zonder dubbels,
# alfabetisch gesorteerd. (30)
SELECT DISTINCT beers.Name
from beers
WHERE Name LIKE '%Wit%'
ORDER BY Name;

# (g) Toon alle bieren met meer alcohol dan 3 en minder dan 7 zonder gebruik te maken
# van logische operatoren (<, >, ...) (568)
SELECT Name,Alcohol
FROM beers
WHERE Alcohol BETWEEN 3 AND 7;

# (h) Geef de top 3 van de sterkste bieren in onze database. (3)
SELECT Name,Alcohol
FROM beers
ORDER BY Alcohol DESC LIMIT 3;

# (i) Doordenker: Maak een lijst van de naam, straat, postcode en stad voor alle
# brouwers in 3 kolommen voor een adressenlijst. M.a.w. combineer de postcode en
# de stad in 1 kolom.

SELECT Name,Address,CONCAT(ZipCode,SPACE(1),City) AS City
FROM brewers;