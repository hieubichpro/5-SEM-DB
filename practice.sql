-- select * from rk2.parents
-- select * from rk2.parents
-- where age = 68 and type_parent = 'M'

-- explain select * from rk2.parents
-- where age = 68 and type_parent = 'M'

-- create index idx_age
-- on rk2.parents(age)

-- explain select * from rk2.parents
-- where age = 68

-- select * from pg_indexes
-- where schemaname = 'rk2' and tablename = 'parents'

-- create or replace function add_ints(int, int)
-- returns int as
-- $$
-- 	select $1 + $2;
-- $$
-- language sql

-- select add_ints(2, 3);

-- select * from rk2.childrens
-- create or replace function update_address(varchar)
-- returns void as
-- $$
-- 	update rk2.childrens
-- 	set address = '123 Mosvow'
-- 	where fio_children = $1
-- $$
-- language sql

-- select * from rk2.childrens

-- select update_address('Tod Orange');

-- select * from rk2.childrens order by id_children
-- drop function get_full_by_sex;

-- create or replace function get_full_by_sex(mysex varchar)
-- returns setof rk2.childrens as
-- $$
-- 	select * from rk2.childrens
-- 	where sex = mysex
-- $$
-- language sql

-- select (get_full_by_sex('M')).*;

-- create or replace function get_sum(a int, b int)
-- returns int as
-- $$
-- declare
-- 	res int;
-- begin
-- -- 	res := a + b;
-- 	select a + b into res;
-- 	return res;
-- end
-- $$
-- language plpgsql;

-- select get_sum(4, 5)

create or replace function fn_get_random_children()
returns varchar as
$$
declare
	rand int;
	row_data record;
begin
	rand = random()*(10 - 1) + 1;
	select * from rk2.childrens into row_data
	where id_children = rand;
	return row_data.fio_children;
end
$$
language plpgsql;

select fn_get_random_children();





