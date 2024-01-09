drop function fn2;

create or replace function fn2()
returns table
(
	city varchar,
	num_of_fans integer
)
as
$$
begin
	return query
	select c.city, c.num_of_fans
	from fb.club c
	where c.num_of_fans >= (select avg(c.num_of_fans)
						 from fb.club c)
	and foundation_year >= 2000;
end
$$
language plpgsql;
-- создать таблицу, заносит в нее инф о городе и количество фонатов
select * from fn2();