--Primer inner join
SELECT customer.customer_id, customer.first_name, customer.last_name--, payment.amount
	FROM public.customer 
	inner join payment on payment.customer_id=customer.customer_id;
--Alias a las tablas
SELECT c.customer_id, c.first_name, c.last_name, p.amount
	FROM public.customer c
	inner join payment p on c.customer_id=p.customer_id;
