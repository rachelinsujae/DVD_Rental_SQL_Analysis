
use sakila;
-- Write a query to find the full name of the actor who has acted in the maximum number of movies.(Busiest Actor)
SELECT CONCAT(First_Name,' ',Last_Name)
FROM actor AS A
INNER JOIN film_actor AS F
ON A.Actor_Id = F.Actor_Id
GROUP BY F.Actor_Id
ORDER BY COUNT(F.Actor_Id) DESC 
LIMIT 1;

-- Write a query to find the full name of the actor who has acted in the third most number of movies (Third most busiest Actor)
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS ACTOR_NAME
FROM ACTOR AS A
INNER JOIN FILM_ACTOR AS F
ON A.ACTOR_ID = F.ACTOR_ID
GROUP BY ACTOR_NAME
ORDER BY COUNT(F.ACTOR_ID) DESC
LIMIT 2,1;

-- Write a query to find the film which grossed the highest revenue for the video renting organisation. (Highest Grossing Film)
SELECT TITLE
FROM FILM
INNER JOIN INVENTORY
USING(FILM_ID)
INNER JOIN RENTAL
USING(INVENTORY_ID)
INNER JOIN PAYMENT 
USING(RENTAL_ID)
GROUP BY TITLE
ORDER BY SUM(AMOUNT) DESC
LIMIT 1;


-- Write a query to find the city which generated the maximum revenue for the organisation. (Film-obsessed City)
SELECT CITY
FROM CITY INNER JOIN ADDRESS USING (CITY_ID)
INNER JOIN CUSTOMER USING (ADDRESS_ID)
INNER JOIN PAYMENT USING (CUSTOMER_ID)
GROUP BY CITY
ORDER BY SUM(AMOUNT) DESC
LIMIT 1;

-- Write a query to find out how many times a particular movie category is rented. Arrange these categories in the decreasing order of the number of times they are rented. (Analysis of Movie Category)
SELECT NAME, COUNT(RENTAL_ID) AS RENTAL_COUNT
FROM CATEGORY INNER JOIN FILM_CATEGORY USING (CATEGORY_ID)
INNER JOIN FILM USING (FILM_ID)
INNER JOIN INVENTORY USING (FILM_ID)
INNER JOIN RENTAL USING (INVENTORY_ID)
GROUP BY NAME
ORDER BY RENTAL_COUNT DESC;

-- Write a query to find the full names of customers who have rented sci-fi movies more than 2 times. Arrange these names in the alphabetical order.(Science Fiction Enthusiasts)
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS CUSTOMER_NAME
FROM CATEGORY INNER JOIN FILM_CATEGORY USING (CATEGORY_ID)
INNER JOIN FILM USING (FILM_ID)
INNER JOIN INVENTORY USING (FILM_ID)
INNER JOIN RENTAL USING (INVENTORY_ID)
INNER JOIN CUSTOMER USING (CUSTOMER_ID)
WHERE NAME = 'Sci-Fi'
GROUP BY CUSTOMER_NAME HAVING COUNT(RENTAL_ID)>2
ORDER BY CUSTOMER_NAME;

-- Write a query to find the full names of those customers who have rented at least one movie and belong to the city Arlington.(Movie Fans from Arlington)
SELECT  CONCAT(FIRST_NAME,' ',LAST_NAME) AS CUSTOMER_NAME
FROM CITY INNER JOIN ADDRESS USING (CITY_ID)
INNER JOIN CUSTOMER USING (ADDRESS_ID)
INNER JOIN RENTAL USING (CUSTOMER_ID)
WHERE CITY ='ARLINGTON'
GROUP BY CUSTOMER_NAME HAVING COUNT(RENTAL_ID) >0; 


-- Write a query to find the number of movies rented across each country. Display only those countries where at least one movie was rented. Arrange these countries in the alphabetical order.(Country-wise Analysis of Movies)
SELECT COUNTRY,COUNT(RENTAL_ID) AS RENTAL_COUNT
FROM COUNTRY INNER JOIN CITY USING(COUNTRY_ID)
INNER JOIN ADDRESS USING(CITY_ID)
INNER JOIN CUSTOMER USING(ADDRESS_ID)
INNER JOIN RENTAL USING (CUSTOMER_ID)
GROUP BY COUNTRY HAVING RENTAL_COUNT > 0
ORDER BY COUNTRY;
 




