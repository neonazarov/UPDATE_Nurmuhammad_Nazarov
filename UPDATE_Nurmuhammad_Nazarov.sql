UPDATE film
SET rental_duration = 21, rental_rate = 9.99
WHERE title = 'Forsage';


UPDATE customer
SET
    first_name = 'jafar',
    last_name = 'djurayev',
    email = 'jafardjurayev@example.com',
    address_id = (SELECT address_id FROM address WHERE address = 'MYExistingAddress'), 
    create_date = current_date
WHERE customer_id IN (
    SELECT c.customer_id
    FROM customer c
    JOIN rental r ON c.customer_id = r.customer_id
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id
    HAVING COUNT(r.rental_id) >= 10 AND COUNT(p.payment_id) >= 10
);