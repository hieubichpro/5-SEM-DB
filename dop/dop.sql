CREATE TABLE IF NOT EXISTS employees (
	id int,
    fio VARCHAR,
    day_date DATE,
    status VARCHAR
);

INSERT INTO employees(id, fio, day_date, status)
VALUES
(1, 'Иванов Иван Иванович', '2022-12-12', 'Работа offline'),
(1, 'Иванов Иван Иванович', '2022-12-13', 'Работа offline'),
(1, 'Иванов Иван Иванович', '2022-12-14', 'Больничный'),
(1, 'Иванов Иван Иванович', '2022-12-15', 'Больничный'),
(1, 'Иванов Иван Иванович', '2022-12-16', 'Удаленная работа'),
(2, 'Петров Петр Петрович', '2022-12-12', 'Работа offline'),
(2, 'Петров Петр Петрович', '2022-12-13', 'Работа offline'),
(2, 'Петров Петр Петрович', '2022-12-14', 'Удаленная работа'),
(2, 'Петров Петр Петрович', '2022-12-15', 'Удаленная работа'),
(2, 'Петров Петр Петрович', '2022-12-16', 'Работа offline');

drop table tmp_table
create temporary table tmp_table
(
	r int,
	fio varchar,
	day_date date,
	status varchar
)

insert into tmp_table
select row_number() over( partition by fio, status order by day_date), fio, day_date, status
from employees

SELECT fio, status, min(day_date) as date_from,
max(day_date) as date_to
FROM tmp_table
group by fio, status, day_date - make_interval(days => r);