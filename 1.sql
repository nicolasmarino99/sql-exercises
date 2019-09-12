-- Write a query to show the poplulation of German
SELECT population FROM world
    WHERE name = "Germany"
-- Write a query to show how the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ( 'Sweden', 'Norway', 'Denmark');
-- Show the country and the area for countries with an area between 200,000 and 250,000.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000