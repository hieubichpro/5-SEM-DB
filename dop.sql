create table Employees
(
	id serial primary key,
	fio varchar(100),
	date_of_status date,
	status varchar(100)
);
insert into Employees(fio, date_of_status, status) values
('AAA', '2022-12-12', 'work offline'),
('AAA', '2022-12-13', 'work offline'),
('AAA', '2022-12-14', 'sickness'),
('AAA', '2022-12-15', 'sickness'),
('AAA', '2022-12-16', 'work online'),
('PPP', '2022-12-12', 'work offline'),
('PPP', '2022-12-13', 'work offline'),
('PPP', '2022-12-14', 'work online'),
('PPP', '2022-12-15', 'work online'),
('PPP', '2022-12-16', 'work offline')

create table res(
	id serial,
	fio varchar(100),
	date_from date,
	date_to date,
	status varchar
);

select distinct fio from Employees

select fio, date_of_status, status
from Employees where name
group by status

-- create or replace function help()
-- returns void
-- as
-- $$
-- declare
-- 	arr varchar[] := ['work offline', 'work online', 'sickness', 'holiday'];
	
-- $$
-- language plpgsql;
