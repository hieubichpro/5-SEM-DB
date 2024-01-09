drop table Employees, Events
create table if not exists Employees
(
	id_empl serial primary key,
	fio varchar(50),
	birth date,
	department varchar(30)
);
drop table Employees
create table if not exists Events
(
	id_event serial primary key,
	id_empl int references Employees(id_empl),
	date_visit date default current_date,
	day_visit varchar(30),
	time_visit time default current_time,
	type_visit int
);


insert into Employees(fio, birth, department) values
('FIO1', '1995-09-25', 'IT'), 
('FIO2', '1999-09-30', 'IT'), 
('FIO3', '1990-09-25', 'Fin'), 
('FIO4', '1997-09-15', 'Fin'),
('FIO5', '1995-09-25', 'IT'), 
('FIO6', '1999-09-30', 'IT'), 
('FIO7', '1990-09-25', 'Fin'), 
('FIO8', '1997-09-15', 'Fin'), 
('FIO9', '1990-09-25', 'Fin'), 
('FIO10', '1991-09-25', 'Fin'), 
('FIO11', '1992-09-22', 'Fin'), 
('FIO12', '1993-09-26', 'Fin'), 
('FIO13', '1994-09-25', 'Fin'), 
('FIO14', '1995-09-15', 'Fin'), 
('FIO15', '1996-09-24', 'Fin'), 
('FIO16', '1996-09-22', 'Fin'), 
('FIO17', '1994-05-25', 'Fin'), 
('FIO18', '1997-04-25', 'Fin');

insert into Events(id_empl, date_visit, day_visit, time_visit, type_visit) values
(1, '2022-12-20', 'Понедельник', '09:01', 1), 
(1, '2022-12-20', 'Понедельник', '09:12', 2), 
(1, '2022-12-20', 'Понедельник', '09:40', 1), 
(1, '2022-12-20', 'Понедельник', '12:01', 2), 
(1, '2022-12-20', 'Понедельник', '13:40', 1), 
(1, '2022-12-20', 'Понедельник', '20:40', 2), 
(1, '2022-12-21', 'Понедельник', '09:01', 1), 
(1, '2022-12-21', 'Понедельник', '09:12', 2), 
(1, '2022-12-21', 'Понедельник', '09:40', 1), 
(1, '2022-12-21', 'Понедельник', '12:01', 2), 
(1, '2022-12-21', 'Понедельник', '13:40', 1), 
(1, '2022-12-21', 'Понедельник', '20:40', 2), 
(1, '2022-12-22', 'Понедельник', '09:01', 1), 
(1, '2022-12-22', 'Понедельник', '09:12', 2), 
(1, '2022-12-22', 'Понедельник', '09:40', 1), 
(1, '2022-12-22', 'Понедельник', '12:01', 2), 
(1, '2022-12-22', 'Понедельник', '13:40', 1), 
(1, '2022-12-22', 'Понедельник', '20:40', 2), 
(3, '2022-12-21', 'Понедельник', '09:01', 1), 
(3, '2022-12-21', 'Понедельник', '09:12', 2), 
(3, '2022-12-21', 'Понедельник', '09:40', 1), 
(3, '2022-12-21', 'Понедельник', '12:01', 2), 
(3, '2022-12-21', 'Понедельник', '13:40', 1), 
(3, '2022-12-21', 'Понедельник', '20:40', 2), 
(2, '2022-12-21', 'Понедельник', '08:51', 1), 
(2, '2022-12-21', 'Понедельник', '20:31', 2), 
(4, '2022-12-21', 'Понедельник', '09:51', 1), 
(4, '2022-12-21', 'Понедельник', '20:31', 2), 
(6, '2022-12-21', 'Понедельник', '09:51', 1), 
(6, '2022-12-21', 'Понедельник', '20:31', 2), 
(1, '2022-12-23', 'Среда', '09:11', 1), 
(1, '2022-12-23', 'Среда', '09:12', 2), 
(1, '2022-12-23', 'Среда', '09:40', 1), 
(1, '2022-12-23', 'Среда', '20:01', 2), 
(3, '2022-12-23', 'Среда', '09:01', 1), 
(3, '2022-12-23', 'Среда', '09:12', 2), 
(3, '2022-12-23', 'Среда', '09:50', 1), 
(3, '2022-12-23', 'Среда', '20:01', 2), 
(2, '2022-12-23', 'Среда', '08:41', 1), 
(2, '2022-12-23', 'Среда', '20:31', 2), 
(4, '2022-12-23', 'Среда', '09:51', 1), 
(4, '2022-12-23', 'Среда', '20:31', 2);

-- select * from Events
-- select * from Employees

create or replace function countHowManyPeopleLate(date_param date)
returns int as
$$
declare
	res int := 0;
begin
	create temp table tmp_table AS ( 
	select id_empl, min(time_visit) as time_to_work
	from Events
	where type_visit = 1 and date_visit = date_param
	group by id_empl);
	
	select count(*)
	from tmp_table
	where time_to_work > '9:00'
	into res;
	drop table tmp_table;
	return res;
end;
$$
language plpgsql;

select countHowManyPeopleLate('15-11-2018')


-- !!!1. Найти все отделы, в которых работает более 10 сотрудников
select department, count(id_empl)
from Employees
group by department
having count(id_empl) > 10

-- !!!2. Найти сотрудников, которые не выходят с рабочего места 
-- в течение всего рабочего дня
select id_empl, count(type_visit)
from Events
where type_visit = 2 and date_visit = '22-12-2022'
group by id_empl
having count(type_visit) = 1

-- !!!3. Найти все отделы, в которых есть сотрудники, опоздавшие \
-- в определенную дату. Дату передавать с клавиатуры

select department from Events
where id_empl in
(select id_empl
from Events
where type_visit = 1 and date_visit = '22-12-2022'
group by id_empl
having min(time_visit) > '9:00')

