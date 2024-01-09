--1
copy (select row_to_json(footballer) from fb.footballer) to '/home/hieubich/DB/lab_5/footballer.json'
copy (select row_to_json(coach) from fb.coach) to '/home/hieubich/DB/lab_5/coach.json'
copy (select row_to_json(club) from fb.club) to '/home/hieubich/DB/lab_5/club.json'
copy (select row_to_json(transfer) from fb.transfer) to '/home/hieubich/DB/lab_5/transfer.json'

--2
CREATE TABLE if not exists footballer_json
(
    id_footballer serial PRIMARY KEY not null,
    first_name     VARCHAR(100) NOT NULL,
    last_name      VARCHAR(100) NOT NULL,
    age            INT NOT NULL,
    country        VARCHAR(100) NOT NULL,
    salary         INT NOT NULL,
	phone_number	VARCHAR(100) NOT NULL,
    check (age >= 16 and age <= 45),
    check ((first_name != '') and (last_name != '')),
    check (country != ''),
    check ((salary >= 100000) and (salary <= 10000000)),
	check (phone_number != '')
);

create table json_table
(
	row_data jsonb
)

copy json_table(row_data) from '/home/hieubich/DB/lab_5/footballer.json'

insert into footballer_json(id_footballer, first_name, last_name, age, country, salary, phone_number)
select (row_data->>'id_footballer')::int, row_data->>'first_name', row_data->>'last_name',
	   (row_data->>'age')::int, row_data->>'country', (row_data->>'salary')::int, row_data->>'phone_number'
	   from json_table
select * from footballer_json	   
	   
--3
create table coach_json
(
	row_data jsonb
)

drop table coach_json

insert into coach_json(row_data) values
('{"id": 1, "name": "Jones", "age": 40, "more_info": {"salary":1000, "email": "a@bmstu.ru"}}')

insert into coach_json(row_data) values
('{"id": 2, "name": "Charlie", "age": 38, "more_info": {"salary":8000, "email": "b@bmstu.ru"}}');

insert into coach_json(row_data) values
('{"id": 4, "name": "David", "age": 41, "more_info": {"salary":11000, "email": "c@bmstu.ru"}}');

insert into coach_json(row_data) values
('{"id": 4, "name": "Mourinho", "age": 41, "more_info": {"salary":9500, "email": "d@bmstu.ru"}}');

insert into coach_json(row_data) values
('{"id": 5, "name": "Ten Hag", "age": 47, "more_info": {"salary":7000, "email": "e@bmstu.ru"}}');

select * from coach_json

--4
--4.1
select row_data->'name' as name_coach from coach_json
--4.2
select row_data->'name' as name_coach, row_data->'more_info'->'email' as email_coach from coach_json
--4.3
create or replace function checkTable(row_data jsonb, key_ varchar)
returns boolean
as
$$
begin
return (row_data->key_) is not null;
end;
$$
language plpgsql;

select checkTable(row_data, 'age')
from coach_json

--4.4
update coach_json
set row_data = row_data || '{"age": 80}'::jsonb
where (row_data->>'name')::varchar = 'Jones';

select * from coach_json

--4.5
select jsonb_array_elements(row_data::jsonb)
from coach_json
