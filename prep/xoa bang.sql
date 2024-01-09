-- create table rk2.info
-- (
-- 	name_table varchar,
-- 	cnt integer
-- );

-- create or replace function rk2.get_info(name_schema varchar)
-- returns void as
-- $$
-- declare row_data record;
-- 		tmp integer;
-- begin
-- 	for row_data in select table_schema||'.'||table_name as n
-- 					from information_schema.tables
-- 					where table_schema = $1
-- 	loop
-- 		execute 'select count(*) from '||row_data.n into tmp;
-- 		insert into rk2.info values(row_data.n, tmp);
-- 	end loop;
-- end;
-- $$
-- language plpgsql

-- select rk2.get_info('rk2');
-- select * from rk2.info
create or replace function my_delete5(nameschema varchar, buff varchar)
returns void as
$$
declare row_data varchar;
begin
	for row_data in execute 'select table_name from information_schema.tables
                            where table_type = '|| CHR(39) || 'BASE TABLE'|| CHR(39)|| ' AND table_name like ' || CHR(39) || buff || '%' || CHR(39)
	loop
		execute('drop table '||nameschema||'.'||row_data||' cascade');
	end loop;
end
$$
language plpgsql

select my_delete5('rk2', 'a');