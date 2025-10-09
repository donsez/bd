-- FUNCTION
-- https://neon.com/postgresql/postgresql-plpgsql/plpgsql-function-returns-a-table

create or replace function get_film (
  p_pattern varchar
)
returns table (
	film_title varchar,
	film_release_year int
)
language plpgsql
as $$
begin
	return query
		select
			title,
			release_year::integer
		from
			film
		where
			title ilike p_pattern;
end;
$$;


SELECT get_film ('Al%');

create or replace function get_film (
	p_pattern varchar,
	p_year int
)
returns table (
	film_title varchar,
	film_release_year int
)
language plpgsql
as $$
declare
    var_r record;
begin
	for var_r in(
            select title, release_year
            from film
	     where title ilike p_pattern and
		    release_year = p_year
        ) loop  film_title := upper(var_r.title) ;
		film_release_year := var_r.release_year;
           return next;
	end loop;
end; $$


SELECT * FROM get_film ('%er', 2006);

-- SetOf
-- https://neon.com/postgresql/postgresql-plpgsql/plpgsql-returns-setof

create or replace function find_film_by_id(
	p_id int
)
returns setof film
as
$$
begin
   return query select * from film
   where film_id = p_id;
end;
$$
language plpgsql;

SELECT find_film_by_id(100);


select (find_film_by_id(100)).title;

SELECT * FROM find_film_by_id(100);
