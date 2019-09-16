-- Find the country that start with Y
SELECT name FROM world
  WHERE name LIKE 'Y%'
-- Find the countries that end with y
SELECT name FROM world
  WHERE name LIKE 'y%'
--Luxembourg has an x - so does one other country. List them both. 
SELECT name FROM world
  WHERE name LIKE '%x%'
--Find the countries that end with land
SELECT name FROM world
  WHERE name LIKE '%land'
--Find the countries that start with C and end with ia
SELECT name FROM world
  WHERE name LIKE 'C%ia'
--SELECT name FROM world
SELECT name FROM world
  WHERE name LIKE '%oo%'
--Find the countries that have three or more a in the name
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'
--India and Angola have an n as the second character. You can use the underscore as a single character wildcard. 
SELECT name FROM world
 WHERE name LIKE '_t%'
    ORDER BY name
--Find the countries that have exactly four characters. 
SELECT name FROM world
 WHERE name LIKE '____'
--Find the country where the name is the capital city.
SELECT name
  FROM world
 WHERE name = capital
--Find the country where the capital is the country plus "City".
SELECT name
  FROM world
 WHERE capital = concat(name, ' City')
--Find the capital and the name where the capital includes the name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE concat('%', name, '%')
--Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name
FROM world
WHERE capital LIKE concat(name, '_%')
--Show the name and the extension where the capital is an extension of name of the country.
SELECT name, REPLACE(capital, name, '')
FROM world
WHERE capital LIKE concat(name, '_%')