--Hello World!
--This is a comment!

SELECT * --what are you trying to grab
FROM actor; --from where are you trying to grab it

--capitalization does not matter convention is all caps for SQL commands
--when you run any dql or query it creates a table
--; is the end of the line
--select is generally talking about a column
--* is everything in the column
SELECT *
FROM address;

--just first and last name list the name of the columns
SELECT first_name, last_name
FROM actor;

--produced over 200
--narrow it down
--WHERE clause
--this is how we filter out the results of our conditionals

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

--must use 'single quotes'
--Single quotes for Strings, literals vs Double quotes for Database identifiers

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Nick';

--wildcards for use with like: _ (underscore) and %
--% is a true wildcard - any character AND number of characters
-- _ is one character wildcard

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'N%';
-- 3 ___underscores means starts with J and 3 letters...

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J___';

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J__%';

--comparison operators:
-- = and like examples above
-- greater/less than > <  <=   >= all valid as usual
-- NOT equal <> (closed carets)

SELECT * 
FROM address
WHERE district like 'Texas';

SELECT * FROM payment;

--let's find customers who paid more than $2
SELECT customer_id, amount
FROM payment
WHERE amount > 2;

--query customers who paid less than $7.99

SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

--we can use OR AND with the WHERE clause

SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99 AND amount >0;

SELECT customer_id, amount
FROM payment
WHERE amount > 2 OR  amount > 7.99;

-- We can also use BETWEEN, works the same as <= >=

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 0 AND 7.99;

--ORDER BY clause

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 0 AND 7.99
ORDER BY amount DESC; --default is  DESC

--order matters

SELECT customer_id, amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount ASC;

SELECT customer_id, amount
FROM payment
WHERE amount > 10;

SELECT * from customer; --checking out customer table

SELECT first_name, last_name
FROM customer
WHERE customer_id = 341;

--peter menard is our big baller!

--SQL aggregations => SUM(), AVG(), COUNT() , MIN(), MAX()
--query to show the sum of amounts greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

--same but with averages!
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

--COUNT
SELECT COUNT(amount)
FROM payment;

SELECT * from payment;

--what about individual amounts - unique amounts
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount > 5.99;

--query to display min amount greater than 6.99

SELECT Min(amount)
FROM payment
WHERE amount > 6.99;

--query to display max amount greater than 6.99
SELECT MAX(amount) AS biggest_over_7
FROM payment
WHERE amount > 6.99;

--GROUP BY
--any column not in aggregate must be in group by used in conjunction
--with aggregates to modify behavior or aggregate groups rows


--example of note from above
SELECT amount, COUNT(amount), SUM(amount)
FROM payment
GROUP BY amount
ORDER BY SUM(amount) DESC;


--bring it back to more straight forward example
SELECT amount
FROM payment
WHERE amount = 6.99;


--generally when you have a group by you will have an order by
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;


-- lets look at customer ids with summed amounts for those ids
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

SELECT customer_id, amount
FROM payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;


SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

--query display customer ID that show up more than 5 times

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING count(customer_id) >0;

--having is how we modify aggregators - having is to an aggregate as where is to a column

--general rules...

SELECT customer_id, SUM(amount) -- what you want to see
FROM payment -- from where
                --BASIC BUILDING BLOCKS!
WHERE customer_id BETWEEN 70 AND 80 -- how or filter
GROUP BY customer_id --assuming we are using aggregates
HAVING SUM(amount) -- this is the how for aggregates
ORDER BY customer_id -- asc or desc which column
LIMIT 2 -- how many 
OFFSET 1;


--clauses we have talked about so far:
--SELECT <columns> <aggregates>
--FROM <table>
--WHERE <conditional>
--GROUP BY <columns>
--HAVING <conditional>
--ORDER BY <column>

SELECT customer_id, last_name
FROM payment


SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC


SELECT customer_id, last_name
FROM customer
WHERE last_name = 'William'
ORDER BY last_name DESC;

SELECT staff_id, SUM(staff_id)
FROM rental
GROUP BY staff_id
ORDER BY staff_id ASC;

SELECT film_id, SUM(film_id)
FROM inventory
GROUP BY film_id
ORDER BY SUM(film_id) DESC;

SELECT district, COUNT(district)
FROM address
GROUP BY district;

SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;


SELECT store_id, last_name
FROM customer
WHERE last_name LIKE '%es'


SELECT rating, COUNT(rating)
FROM film
GROUP BY rating

SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

    SELECT store_id, COUNT(last_name)
    FROM customer
    WHERE last_name LIKE '%es' AND store_id = 1;

SELECT COUNT(customer_id) 
FROM customer
WHERE last_name LIKE '%es' AND store_id = 1;

SELECT count(*)
FROM (SELECT amount
FROM payment
WHERE CUSTOMER_ID BETWEEN 380 AND 430
GROUP BY amount
HAVING count(amount) > 250) AS sub;