SELECT film_id, title, description 
	FROM public.film where title ilike '%Truman%' order by title asc;
	
	select * from payment where amount > 5.99 limit 5