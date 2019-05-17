#SELECT basics

#Question 1
SELECT population 
  FROM world 
 WHERE name = 'Germany';

#Question 2
SELECT name, population 
  FROM world
 WHERE name 
    IN ('Sweden', 'Norway', 'Denmark');

#Question 3
 SELECT name, area 
   FROM world
  WHERE area 
BETWEEN 200000 AND 250000;

#Quiz
1. C
2. E
3. E
4. C
5. C 
6. C
7. C
