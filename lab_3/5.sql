create or replace procedure pr5(id_param int)
language plpgsql
as
$$
begin
	update fb.footballer
	set country = 'Russia'
	where id_footballer = id_param;
end;
$$

call pr5(23);

select * from fb.footballer where id_footballer = 23;
