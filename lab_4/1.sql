-- create extension plpython3u;
-- select * from pg_language
create or replace function get_phone_number_byID(id_param int)
returns varchar
as
$$
ppl = plpy.execute("select * from fb.footballer")
for footballer in ppl:
	if footballer['id_footballer'] == id_param:
		return footballer['phone_number']
return 'doesnt exists'
$$
language plpython3u;

select * from get_phone_number_byID(25);
select * from get_phone_number_byID(1500);