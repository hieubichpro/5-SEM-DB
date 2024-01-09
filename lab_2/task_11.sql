drop table if exists tmp_table;

select name, city, foundation_year
into tmp_table
from fb.club
where name like '%Madrid%';

select * from tmp_table

-- Создать временную таблицу, содержающую все клубы, в название которых входит Madrid