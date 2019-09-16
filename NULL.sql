--List the teachers who have NULL for their department. 
SELECT name
FROM teacher
WHERE dept IS NULL

--Note the INNER JOIN misses the teachers with no department and the departments with no teacher. 
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

--Use a different JOIN so that all teachers are listed. 
SELECT teacher.name, dept.name
FROM dept
Right JOIN teacher ON dept.id = teacher.dept

--Use a different JOIN so that all departments are listed. 
SELECT teacher.name, dept.name
FROM dept
left JOIN teacher ON dept.id = teacher.dept

--Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department. 
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher
LEFT JOIN dept ON dept.id = teacher.dept

--SELECT COUNT(name), COUNT(mobile)
SELECT COUNT(name), COUNT(mobile)
FROM teacher

--Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed. 

SELECT dept.name, COUNT(teacher.id)
FROM teacher
RIGHT JOIN dept ON teacher.dept = dept.id
GROUP BY dept.name

--Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2 and 'Art' otherwise.
SELECT name,
CASE
WHEN dept = 1 OR dept = 2 THEN 'Sci'
ELSE 'Art'
END AS Dept
FROM teacher

--Use CASE to show the name of each teacher followed by 'Sci' if the teacher is in dept 1 or 2, show 'Art' if the teacher's dept is 3 and 'None' otherwise. 
SELECT name,
CASE
WHEN dept = 1 OR dept = 2 THEN 'Sci'
WHEN dept =3 THEN 'Art'
ELSE 'None'
END AS Dept
FROM teacher