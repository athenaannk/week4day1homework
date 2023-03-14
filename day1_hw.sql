-- 1. How many actors are there with the last name ‘Wahlberg’?
    -- ANSWER: 2

    -- SELECT last_name
    -- FROM actor
    -- WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
    --ANSWER: 0

    -- SELECT customer_id, amount
    -- FROM payment
    -- WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
    -- ANSWER: THERE IS A BUNCH WITH A MAX OF 8

    -- SELECT film_id, COUNT(film_id)
    -- FROM inventory
    -- GROUP BY film_id
    -- ORDER BY COUNT(film_id) DESC;

-- 4. How many customers have the last name ‘William’?
    --ANSWER = 0 HOWEVER THERE IS WILLIAMS AND WILLIAMSON...

    -- SELECT customer_id, last_name
    -- FROM customer
    -- WHERE last_name = 'William'
    -- ORDER BY last_name DESC;


-- 5. What store employee (get the id) sold the most rentals?
    --ANSWER: STAFF_ID 2 (16008)

    -- SELECT staff_id, SUM(staff_id)
    -- FROM rental
    -- GROUP BY staff_id
    -- ORDER BY staff_id ASC;

-- 6. How many different district names are there?
    --ANSWER: 378

    -- SELECT district, COUNT(district)
    -- FROM address
    -- GROUP BY district

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
    --ANSWER: FILM ID 508
    
    -- SELECT film_id, COUNT(film_id)
    -- FROM film_actor
    -- GROUP BY film_id
    -- ORDER BY COUNT(film_id) DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
    --ANSWER: 13

    -- SELECT COUNT(customer_id) 
    -- FROM customer
    -- WHERE last_name LIKE '%es' AND store_id = 1;

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)    

    --ANSWER 3

    --SELECT count(*)
    --FROM (SELECT amount
    -- FROM payment
    -- WHERE CUSTOMER_ID BETWEEN 380 AND 430
    -- GROUP BY amount
    -- HAVING count(amount) > 250) AS sub;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?    
    --ANSWER: 5 RATING CATEGORIES - PG13 HAS MOST MOVIES AT 223
   
    --SELECT rating, COUNT(rating)
    -- FROM film
    -- GROUP BY rating