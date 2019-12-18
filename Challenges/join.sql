SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';

-- Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
FROM game 
WHERE id = 1012;

SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM game 
JOIN goal 
ON (game.id = goal.matchid) 
WHERE teamid = 'GER';

-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT game.team1, game.team2, goal.player 
FROM game 
JOIN goal 
ON game.id = goal.matchid 
WHERE goal.player 
LIKE 'Mario%';

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime
FROM goal 
JOIN eteam 
ON goal.teamId = eteam.id
WHERE goal.gtime <= 10;

SELECT game.mdate, eteam.teamname 
FROM game 
JOIN eteam 
ON game.team1 = eteam.id 
WHERE eteam.coach = 'Fernando Santos';