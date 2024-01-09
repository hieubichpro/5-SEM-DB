create or replace function fn3(max_age int)
returns table(
	first_name varchar,
	last_name varchar,
	salary int
)
as
$$
begin
	create temp table tmp_table
	(
		first_name varchar,
		last_name varchar,
		salary int
	);
	insert into tmp_table
	select f.first_name, f.last_name, f.salary
	from fb.footballer f
	where age <= max_age;
	
	return query
	select * from tmp_table;
end
$$
language plpgsql;

select * from fn3(20)