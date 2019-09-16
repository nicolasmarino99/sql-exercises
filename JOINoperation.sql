--Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
SELECT matchid, player
FROM goal
WHERE teamid='GER'
--Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012
--Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT player, teamid, stadium, mdate
  FROM game
JOIN goal ON game.id = goal.matchid
WHERE goal.teamid = 'GER'
--Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT game.team1, game.team2, goal.player
FROM game
JOIN goal on game.id = goal.matchid
WHERE goal.player LIKE 'Mario%'
--Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, eteam.coach, goal.gtime
  FROM goal
JOIN eteam ON eteam.id = goal.teamid
WHERE gtime<=10
--List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT game.mdate, eteam.teamname
FROM game
JOIN eteam
ON game.team1 = eteam.id
WHERE coach = 'Fernando Santos'
--List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT goal.player
FROM game
JOIN goal
ON game.id = goal.matchid
WHERE game.stadium = 'National Stadium, Warsaw'
--Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
  FROM game 
JOIN goal ON matchid = id
WHERE goal.teamid != 'GER' AND (team1 != 'GER' XOR team2 != 'GER')
--Show teamname and the total number of goals scored.
SELECT eteam.teamname, COUNT(goal.teamid)
  FROM goal
 JOIN eteam ON eteam.id = goal.teamid
GROUP BY teamname
--Show the stadium and the number of goals scored in each stadium.
SELECT matchid, mdate, COUNT(teamid)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate
--For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT goal.matchid, game.mdate, COUNT(teamid)
  FROM game
JOIN goal ON goal.matchid = game.id
WHERE teamid = 'GER'
GROUP BY game.mdate, goal.matchid
--Sort your result by mdate, matchid, team1 and team2.