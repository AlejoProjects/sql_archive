--1
SELECT film_id, title FROM film;
--2
SELECT * FROM film LIMIT 5;
--3
SELECT * FROM film WHERE film_id < 4;
--4
SELECT * FROM film WHERE rating='PG' or rating='G';
--5
SELECT * FROM actor WHERE first_name IN('Angela','Angelina','Audrey');
--6
SELECT * FROM actor WHERE first_name='Julia';
--7
SELECT * FROM actor WHERE first_name='Chris' OR first_name='Cameron' OR first_name='Cuba';
--8
SELECT * FROM customer WHERE first_name='Jamie' AND last_name='Rice';
--9
SELECT amount, payment_date FROM payment  WHERE  amount < 1;
--10
--If we ignore the null values, the maximum value is 9 days with 6 hours more or less
--However, if we assume that the null values mean that the customer is still renting, then the renting duration it´s greather than 18 years.
SELECT rental_date,return_date,AGE(return_date,rental_date) AS rental_time FROM rental WHERE return_date IS NOT NULL ORDER BY rental_time DESC ;
--11
SELECT * FROM city  ORDER BY country_id;
SELECT * FROM city  ORDER BY city;
--12
SELECT rental_id,return_date FROM rental  WHERE return_date IS NOT NULL ORDER BY return_date DESC LIMIT 3;
--13
SELECT rating, COUNT(film_id) FROM film WHERE rating='PG' OR rating='NC-17' OR rating='PG-13' GROUP BY rating;
--14
SELECT COUNT(DISTINCT customer_id) FROM rental;
--15
--since the greatest number is one, there are no clients with the same last name, two ways of doing it.
SELECT last_name,COUNT(customer_id) FROM customer GROUP BY last_name ORDER BY COUNT(customer_id)  DESC LIMIT 1;
SELECT last_name, COUNT(last_name) FROM customer GROUP BY last_name HAVING COUNT(last_name) > 1;
--16
--Film Id 508 has the greatest amount of actors.
SELECT film_id,COUNT(actor_id) FROM film_actor GROUP BY film_id ORDER BY COUNT(actor_id) DESC LIMIT 1; 
--17
--There you have it, every country with the amount of cities, same as the rating on films.
SELECT country_id,COUNT(city) FROM city GROUP BY country_id ORDER BY COUNT(city) DESC;
--18
--El promedio es de 2.98
SELECT ROUND(AVG(rental_rate),2) AS Mean FROM film;
--19
/** 
--I created a column that stores the total length of both name and last name
ALTER TABLE actor ADD COLUMN total_length numeric GENERATED ALWAYS AS (
LENGTH(first_name)+LENGTH(last_name))STORED;
*/
 SELECT * FROM actor ORDER BY total_length DESC LIMIT 10;
