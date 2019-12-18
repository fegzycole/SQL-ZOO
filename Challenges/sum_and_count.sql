SELECT SUM(population)
FROM world;

-- List all the continents - just once each. 
SELECT DISTINCT Continent FROM world;

-- Give the total GDP of Africa 
SELECT SUM(gdp) FROM world WHERE Continent = 'Africa';

-- How many countries have an area of at least 1000000 
SELECT COUNT(name) FROM world WHERE area >= 1000000;

-- What is the total population of ('Estonia', 'Latvia', 'Lithuania') 
SELECT SUM(population) 
FROM world 
WHERE name IN ('Estonia', 'Latvia', 'Lithuania');

-- For each continent show the continent and number of countries. 
SELECT continent, COUNT(continent) 
FROM world 
GROUP BY continent;

-- For each continent show the continent and number of countries with populations of at least 10 million. 
SELECT continent, COUNT(continent) 
FROM world  
WHERE population > 10000000 
GROUP BY continent;

-- List the continents that have a total population of at least 100 million. 
SELECT continent 
FROM world 
GROUP BY continent 
HAVING SUM(population) > 100000000;

SELECT goal.player 
FROM goal 
JOIN game 
ON goal.matchid = game.id 
WHERE game.stadium = 'National Stadium, Warsaw';

SELECT DISTINCT goal.player
FROM goal 
JOIN game 
ON goal.matchid = game.id 
WHERE (team1 = 'GER' OR team2 = 'GER') 
AND goal.teamid <> 'GER';

SELECT eteam.teamname, COUNT(goal.teamid)
FROM eteam 
JOIN goal 
ON eteam.id = goal.teamid
GROUP BY eteam.teamname;