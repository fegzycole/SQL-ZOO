SELECT id, title
FROM movie
WHERE yr=1962;

SELECT yr FROM movie 
WHERE title = 'Citizen Kane';

SELECT id, title, yr 
FROM movie 
WHERE title LIKE '%Star Trek%' 
ORDER BY yr;

SELECT id 
FROM actor 
WHERE name = 'Glenn Close';

SELECT id 
FROM movie 
WHERE title = 'Casablanca';

SELECT actor.name 
FROM actor 
JOIN casting 
ON actor.id = casting.actorid 
WHERE casting.movieid = 11768;

SELECT actor.name 
FROM actor 
JOIN casting 
ON actor.id = casting.actorid 
WHERE casting.movieid = (SELECT id FROM movie WHERE title = 'Alien');

SELECT title 
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
WHERE casting.actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford');

SELECT title 
FROM movie 
JOIN casting 
ON movie.id = casting.movieid 
WHERE casting.actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') 
AND casting.ord <> 1; 

SELECT movie.title, actor.name 
FROM movie 
JOIN casting ON movie.id = casting.movieid 
JOIN actor ON casting.actorid = actor.id 
WHERE movie.yr = 1962 AND casting.ord = 1;

SELECT yr,COUNT(title) 
FROM movie
JOIN casting ON movie.id = movieid
JOIN actor ON actorid = actor.id
WHERE name = 'Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

SELECT title, name FROM movie 
JOIN casting ON (movie.id = casting.movieid AND casting.ord = 1)
JOIN actor ON (casting.actorid = actor.id)
WHERE movie.id IN (
SELECT casting.movieid FROM casting 
WHERE casting.actorid IN(SELECT id FROM actor WHERE name = 'Julie Andrews'));

SELECT name FROM actor 
JOIN casting ON (casting.actorid = actor.id AND ord = 1) 
JOIN movie ON (movie.id = casting.movieid) 
GROUP BY actor.name 
HAVING COUNT(name) >= 30;

SELECT title, COUNT(actor.id) 
FROM movie 
JOIN casting ON movie.id = casting.movieid 
JOIN actor ON casting.actorid = actor.id 
WHERE movie.yr = 1978 
GROUP BY title
ORDER BY COUNT(actor.id) DESC, title;

SELECT name FROM actor 
JOIN casting ON actorid = actor.id 
JOIN movie ON movieid = movie.id 
WHERE movie.title IN 
(SELECT movie.title FROM movie 
JOIN casting ON movieid = movie.id 
JOIN actor ON actorid = actor.id 
WHERE actor.id = (SELECT id FROM actor WHERE name = 'Art Garfunkel') ) 
AND actor.name <> 'Art Garfunkel';