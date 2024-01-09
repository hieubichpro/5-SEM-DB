create or replace procedure get_footbaler(age_begin int, age_end int)
as
$$
declare
	res text := '';
	row_data record;
	my_cursor cursor(age_b int, age_e int)
			for select first_name, age from fb.footballer where age between age_b and age_e;
begin
	open my_cursor(age_begin, age_end);
	loop
		fetch my_cursor into row_data;
		exit when not found;
		if row_data.first_name like 'A%' then
			res := res || row_data.first_name || ':' || row_data.age;
		end if;
	end loop;
	raise notice '%', res;
	close my_cursor;
end;
$$
language plpgsql;

call get_footbaler(18, 20);
