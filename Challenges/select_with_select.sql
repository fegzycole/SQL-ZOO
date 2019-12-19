SELECT name FROM world
WHERE population >
(SELECT population FROM world
WHERE name='Russia');

SELECT name FROM world
WHERE continent = 'Europe'
AND (gdp / population) > 
(SELECT (gdp / population) 
FROM world 
WHERE name = 'United Kingdom');

SELECT name, continent 
FROM world
WHERE continent 
IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia') 
ORDER BY name;

SELECT name, population 
FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Canada') 
AND population < (SELECT population FROM world WHERE name = 'Poland');

SELECT name, 
CONCAT(ROUND((population * 100) / (SELECT population FROM world WHERE name = 'Germany')), '%')
 AS population 
 FROM world 
 WHERE continent = 'Europe';

SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp FROM world WHERE gdp > 0 AND Continent = 'Europe');

SELECT continent, name, area FROM world x
WHERE area >= ALL
(SELECT area FROM world y
WHERE y.continent = x.continent
AND area>0);

-- List each continent and the name of the country that comes first alphabetically.
SELECT continent, name FROM world x
WHERE name <= ALL
(SELECT name FROM world y
WHERE y.continent = x.continent);

-- Find the continents where all countries have a population <= 25000000. Then find the names of the countries associated with these continents. Show name, continent and population.
SELECT name, continent, population FROM world x
WHERE 25000000 >= ALL
(SELECT population FROM world y
WHERE y.continent = x.continent);

-- Some countries have populations more than three times that of any of their neighbours (in the same continent). Give the countries and continents.
SELECT name, continent FROM world x
WHERE population > ALL
(SELECT (3 * population) FROM world y
WHERE y.continent = x.continent AND y.name != x.name);

SELECT game.stadium, COUNT(goal.player) 
FROM game 
JOIN goal ON game.id = goal.matchid 
GROUP BY stadium;

SELECT goal.matchid, game.mdate, COUNT(goal.teamid)
FROM goal 
JOIN game ON goal.matchid = game.id 
WHERE (game.team1 = 'POL' OR game.team2 = 'POL')
GROUP BY goal.matchid, game.mdate;

SELECT matchid, mdate, COUNT(teamid) 
FROM goal 
JOIN game 
ON matchid = id 
WHERE teamid = 'GER' 
GROUP BY matchid, mdate;

SELECT mdate,
team1,
SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
team2,
SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2;