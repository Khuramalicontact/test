# Step 1 :
# Wat zijn je favoriete boeken? U kunt een database tabel maken om ze in op te slaan! In
# deze eerste stap maak je een tabel om je lijst met boeken in op te slaan. Het moet
# kolommen hebben voor id, naam en beoordeling.
CREATE table book_list(
    id integer primary key auto_increment,
    book_name varchar(50),
    reviews varchar(255)
);

# Step 2 :
# Voeg nu drie van je favoriete boeken toe aan de tabel.
INSERT INTO book_list(book_name, reviews)
VALUE('Boek1','Good Book :D');

INSERT INTO book_list(book_name, reviews)
VALUE('Boek2','Good Book :D');

INSERT INTO book_list(book_name, reviews)
VALUE('Boek3','Good Book :D');

# Step 1 :
# Deze database bevat een onvolledige lijst van hits van de box office en hun release-jaar. In
# deze uitdaging ga je de resultaten op verschillende manieren weer uit de database halen! In
# deze eerste stap selecteer je gewoon alle films.

CREATE table film_list(
    id integer primary key auto_increment,
    film_name varchar(50),
    film_year integer
);

INSERT INTO film_list(film_name, film_year)
VALUE ('film 1', 1999);

INSERT INTO film_list(film_name, film_year)
VALUE ('film 2', 2016);

INSERT INTO film_list(film_name, film_year)
VALUE('film 3', 2000);

# Step 2 :
# Voeg nu een tweede query toe na de eerste, die alleen de films ophaalt die zijn uitgebracht
# in het jaar 2000 of later, niet eerder. Sorteer de resultaten zodat de eerdere films als eerste
# worden vermeld. Na deze stap moet u 2 SELECT statements hebben.

SELECT film_name, film_year
FROM film_list
WHERE film_year >= 2000
ORDER BY film_year;

# Step 1
# maak een todo_lists tabel aan met de kolommen (id, item, min ) . Voeg meerdere
# items/taken toe aan uw todolijst met de geschatte minuten die nodig zijn om elk item te
# voltooien.

CREATE table todo_lists(
    id integer primary key auto_increment,
    item varchar(30),
    min integer
);

INSERT INTO todo_lists(item, min)
VALUE ('ToDO1', 30);

INSERT INTO todo_lists(item, min)
VALUE ('ToDO2', 20);

INSERT INTO todo_lists(item, min)
VALUE ('ToDO3', 10);

# Step 2
# Selecteer het SUM van de minuten die nodig zijn om alle items op uw TODO-lijst uit te
# voeren. U zou slechts één SELECT statement moeten hebben.

SELECT SUM(min)
FROM todo_lists;

# Step 1
# Ooit karaoke gezongen? Het is een plek waar je liedjes zingt met je vrienden, en het is erg
# leuk. Maak een tabel met de volgende gegevens: id, titel, artiest, stemming, duur, jaartal, en
# in deze uitdaging gebruik je vragen om te beslissen welke nummers je wilt zingen. Selecteer
# voor de eerste stap alle titels van de nummers.

CREATE TABLE karaoke_song_selector(
    id integer primary key auto_increment,
    titel varchar(10),
    artist varchar(10),
    mood varchar(10),
    duration integer,
    year integer
);

INSERT INTO karaoke_song_selector(titel, artist, mood, duration, year)
VALUE ('Poison','X','Sad',1.30,2013);

INSERT INTO karaoke_song_selector(titel, artist, mood, duration, year)
VALUE ('Sad','X','Slow',3.30,2018);

INSERT INTO karaoke_song_selector(titel, artist, mood, duration, year)
VALUE ('Moonlight','X','Epic',2.30,2011);

SELECT titel
FROM karaoke_song_selector;


# moeite met OR en AND
SELECT titel
FROM karaoke_song_selector
WHERE mood = 'Sad' OR year > 2011;

SELECT titel
FROM karaoke_song_selector
WHERE mood = 'Epic' AND year >= 2011;