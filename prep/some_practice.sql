-- create table company
-- (
-- 	id 		int primary key,
-- 	name 	varchar,
-- 	age 	int,
-- 	address varchar,
-- 	salary real
-- );

-- create table audit
-- (
-- 	emp_id int,
-- 	entry_date varchar
-- );

-- create or replace function auditlog()
-- returns trigger as
-- $$
-- begin
-- 	insert into audit values(new.id, current_timestamp);
-- 	return new;
-- end
-- $$
-- language plpgsql;

-- create trigger test_trigger after insert on company
-- for each row execute procedure auditlog();

-- insert into company values (1, 'hieu', 25, 'Hanoi', 123.45);

-- select * from company
-- select * from audit

-- syntax triggers
-- 1, create function, it invoke when occur an event
-- 2, bind the function to the table

-- create function triggerr_function()
-- returns trigger as
-- $$
-- begin
-- end
-- $$
-- language plpgsql

-- create trigger trigger_name
-- {before | after} {event}  -- event: insert, delete, update
-- on table_name
-- 	[for [each] {row | statement}] execute procedure trigger_function

--cursor in postgresql
-- create table students
-- (
-- 	id_student serial primary key,
-- 	fio varchar(30),
-- 	branch int
-- );

-- insert into students
-- values
--     (1, 'M.S Dhoni', NULL),
--     (2, 'Sachin Tendulkar', 1),
--     (3, 'R. Sharma', 1),
--     (4, 'S. Raina', 1),
--     (5, 'B. Kumar', 1),
--     (6, 'Y. Singh', 2),
--     (7, 'Virender Sehwag ', 2),
--     (8, 'Ajinkya Rahane', 2),
--     (9, 'Shikhar Dhawan', 2),
--     (10, 'Mohammed Shami', 3),
--     (11, 'Shreyas Iyer', 3),
--     (12, 'Mayank Agarwal', 3),
--     (13, 'K. L. Rahul', 3),
--     (14, 'Hardik Pandya', 4),
--     (15, 'Dinesh Karthik', 4),
--     (16, 'Jasprit Bumrah', 7),
--     (17, 'Kuldeep Yadav', 7),
--     (18, 'Yuzvendra Chahal', 8),
--     (19, 'Rishabh Pant', 8),
--     (20, 'Sanju Samson', 8);

-- begin;
-- declare
-- 	my_cursor cursor for select * from students;

-- fetch 10 from my_cursor
-- fetch prior from my_cursor
-- fetch 6 from my_cursor
-- commit;

--define cursors
-- declare
-- 	cur_film cursor for select * from film;
-- 	cur_film2 cursor(year int) for select * from films where release_year = year;
-- -- open cursors
-- open cur_film;
-- open cur_film2(year:=2001)
-- -- using cursors FETCH, MOVE, UPDATE, DELETE

-- create or replace function get_film_titles(p_year int)
-- returns varchar as
-- $$
-- declare
-- 	titles varchar := '';
-- 	row_data record;
-- 	cur_film cursor(p_year int) for select title, release_year
-- 									from film
-- 									where release_year = p_year;

-- begin
-- 	open cur_film(p_year);
-- 	loop
-- 		fetch cur_film into row_data;
-- 		exit when not found;
-- 		title := title || ', ' || row_data.title || ', ' || row_data.release_year;
-- 	end loop;
-- 	close cur_film;
-- 	return titles;
-- end
-- $$
-- language plpgsql