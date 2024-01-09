-- DROP PROCEDURE rec_procedure(integer,integer)
create or replace procedure rec_procedure(id_curr int, id_end int)
as
$$
declare
	name_club varchar;
begin
	select cl.name
	from fb.club as cl
	where cl.id_club = id_curr
	into name_club;
	
	if id_curr < id_end then
		raise notice 'id %, name %', id_curr, name_club;
		id_curr = id_curr * 3;
		call rec_procedure(id_curr, id_end);
	else
		raise notice 'end loop';
	end if;
end;
$$
language plpgsql;

call rec_procedure(1, 30);