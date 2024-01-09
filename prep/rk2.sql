-- create schema rk2;

-- create table rk2.parents(
-- 	id_parent serial primary key,
-- 	fio_parent varchar,
-- 	age int,
-- 	type_parent varchar
-- );

-- create table rk2.groups(
-- 	id_group serial primary key,
-- 	name_group varchar,
-- 	fio_teacher varchar,
-- 	max_hours int
-- );

-- create table rk2.childrens(
-- 	id_children serial primary key,
-- 	fio_children varchar,
-- 	birthday date,
-- 	sex varchar,
-- 	address varchar,
-- 	cafedra varchar,
-- 	id_group int references rk2.groups(id_group)
-- );


-- create table rk2.PC(
-- 	id_parent int,
-- 	id_children int
-- );

-- insert into rk2.parents (fio_parent, age, type_parent) values ('Cirillo Blanche', 70, 'M');
-- insert into rk2.parents (fio_parent, age, type_parent) values ('Delora Szubert', 35, 'P');
-- insert into rk2.parents (fio_parent, age, type_parent) values ('Brannon Rosberg', 33, 'P');
-- insert into rk2.parents (fio_parent, age, type_parent) values ('Johnna Meco', 32, 'M');
-- insert into rk2.parents (fio_parent, age, type_parent) values ('Harmonie Baldack', 53, 'P');
-- insert into rk2.parents (fio_parent, age, type_parent) values ('Pinchas Dartnell', 68, 'M');
-- insert into rk2.parents (fio_parent, age, type_parent) values ('Meghan Reely', 36, 'P');
-- insert into rk2.parents (fio_parent, age, type_parent) values ('Sophia Morling', 41, 'M');
-- insert into rk2.parents (fio_parent, age, type_parent) values ('Augustine Keford', 34, 'P');
-- insert into rk2.parents (fio_parent, age, type_parent) values ('Alvina McSweeney', 32, 'M');

-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('Hand Sanitizer Lemon Scent', 'Christoper Jamblin', 15);
-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('Nitroglycerin Transdermal Delivery System', 'Lance Pither', 26);
-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('pain relief and pain relief pm', 'Lemar Cleare', 23);
-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('Rite Aid Ultimate Sheer', 'Madelon Haensel', 26);
-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('SurfersSkin Sunscreen Zinc', 'Toddie Fritche', 23);
-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('Western Family Sensitive Whitening Fluoride', 'Lisabeth Clarricoates', 8);
-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('Dexamethasone Sodium Phosphate', 'Cassondra Gouly', 7);
-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('PROPECIA', 'Moira Patley', 28);
-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('Antibacterial', 'Darb Gribbell', 14);
-- insert into rk2.groups (name_group, fio_teacher, max_hours) values ('Antiseptic', 'Esmeralda Rosario', 16);

-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Tod Orange', '2023-06-11', 'M', '48 Monterey Alley', 'Plexiglass', 2);
-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Isac Malloy', '2023-01-06', 'M', '7921 Talmadge Hill', 'Stone', 4);
-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Joshuah Arstingall', '2023-01-12', 'M', '2469 Loftsgordon Trail', 'Glass', 2);
-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Lola Simonin', '2023-10-09', 'F', '93 Graceland Way', 'Aluminum', 3);
-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Stavro Broderick', '2023-07-11', 'M', '2 Burrows Park', 'Glass', 6);
-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Timmy Gerdts', '2023-08-11', 'M', '4709 Waxwing Street', 'Wood',7);
-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Rebbecca Deaves', '2023-01-30', 'F', '608 Carpenter Junction', 'Wood', 9);
-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Barbra Jeanes', '2023-10-03', 'M', '525 Miller Place', 'Glass', 3);
-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Ash Killshaw', '2023-01-14', 'M', '8 Westerfield Center', 'Glass', 8);
-- insert into rk2.childrens (fio_children, birthday, sex, address, cafedra, id_group) values ('Charyl Mergue', '2023-06-07', 'F', '60361 Chinook Terrace', 'Aluminum', 5);

-- insert into rk2.pc (id_parent, id_children) values (9, 9);
-- insert into rk2.pc (id_parent, id_children) values (2, 5);
-- insert into rk2.pc (id_parent, id_children) values (2, 5);
-- insert into rk2.pc (id_parent, id_children) values (5, 4);
-- insert into rk2.pc (id_parent, id_children) values (5, 3);
-- insert into rk2.pc (id_parent, id_children) values (4, 2);
-- insert into rk2.pc (id_parent, id_children) values (6, 1);
-- insert into rk2.pc (id_parent, id_children) values (3, 8);
-- insert into rk2.pc (id_parent, id_children) values (3, 1);
-- insert into rk2.pc (id_parent, id_children) values (6, 3);

-- SELECT + предикат с квантором
-- Найдите информацию о родителях, возраст которых превышает возраст всех отцов.
-- SELECT id_parent, fio_parent, age
-- FROM rk2.parents
-- WHERE age > ALL ( SELECT age
--  FROM rk2.parents
--  WHERE type_parent = 'P')

-- SELECT + BETWEEN
-- найти информацию об учениках, название класса 
-- и максимальное количество часов и максимальное количество часов от 20 до 28
--  select fio_children, name_group, max_hours
--  from rk2.childrens c join rk2.groups g on c.id_group = g.id_group
--  where max_hours between 20 and 28
 
-- SELECT + агрегатная функция в выражениях столбцов
-- Найдите средний возраст отцов и матерей.
-- select type_parent, avg(age) as average_age
-- from rk2.parents
-- group by type_parent

-- CREATE OR REPLACE PROCEDURE index_info
-- (
--     db_name_in VARCHAR(32),
--     table_name_in VARCHAR(32)
-- )
-- AS '
-- DECLARE
--     elem RECORD;
-- BEGIN
--     FOR elem in
--         SELECT *
--         -- В каталоге pg_index содержится часть информации об индексах.
--         -- Остальная информация в основном находится в pg_class.
--         FROM pg_index
--         --  В каталоге pg_class описываются таблицы и практически всё,
--         --  что имеет столбцы или каким-то образом подобно таблице.
--         --  Сюда входят индексы.
--         JOIN pg_class ON pg_index.indrelid = pg_class.oid
--         WHERE relname = table_name_in
--     LOOP
--         RAISE NOTICE ''elem: %'', elem;
--     END LOOP;
-- END;

-- create or replace function deleteIndex(name_schema varchar, name_table varchar)
-- returns void as
-- $$
-- declare row_data record;
-- begin
-- 	for row_data in (select indexname as m
-- 					FROM pg_indexes 
-- 					WHERE schemaname = name_schema and tablename = name_table)
-- 	loop
-- 		execute 'drop index '|| row_data.m;
-- 	end loop;
-- end;
-- $$
-- language plpgsql

-- select deleteIndex('rk2', 'parents');
 