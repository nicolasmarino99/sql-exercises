--List the films where the yr is 1962 [Show id, title] 
SELECT id, title
 FROM movie
 WHERE yr=1962
 --Give year of 'Citizen Kane'. 
 SELECT yr
FROM movie
WHERE title = 'Citizen Kane' 
--List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year. 
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr
--What id number does the actor 'Glenn Close' have? 
SELECT id
FROM actor 
WHERE name = 'Glenn Close'
--What is the id of the film 'Casablanca' 
SELECT id
FROM movie
WHERE title = 'Casablanca' 
--Use movieid=11768, (or whatever value you got from the previous question) 
SELECT actor.name
FROM  movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE title = 'Casablanca'
--List the films in which 'Harrison Ford' has appeared 
SELECT movie.title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Harrison Ford'
--List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role] 
SELECT movie.title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE casting.ord != 1 AND actor.name = 'Harrison Ford'
--List the films together with the leading star for all 1962 films. 
SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON actor.id = casting.actorid
WHERE casting.ord = 1 AND movie.yr = 1962
--Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies. 
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
--List the film title and the leading actor for all of the films 'Julie Andrews' played in. 
SELECT movie.title, actor.name
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE casting.ord = 1 AND movie.id IN (
SELECT movieid FROM casting WHERE actorid = 179)
--Obtain a list, in alphabetical order, of actors who've had at least 30 starring roles
SELECT DISTINCT actor.name
FROM actor
JOIN casting ON casting.actorid = actor.id
WHERE casting.ord = 1 AND casting.actorid IN
(SELECT COUNT(movieid)
FROM casting
GROUP BY actorid
HAVING COUNT(movieid) >= 30
)
ORDER BY actor.name
--List the films released in the year 1978 ordered by the number of actors in the cast, then by title
SELECT movie.title, COUNT(actorid)
FROM movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY COUNT(actorid) DESC, movie.title

