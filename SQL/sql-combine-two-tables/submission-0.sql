-- Write your query below
SELECT first_name, last_name, city, state
FROM person
NATURAL LEFT JOIN address;