-- select * from footballer

insert into fb.footballer(first_name, last_name, age, country, salary, phone_number)
select first_name, 'ronaldo' as last_name, age, country, salary, phone_number
from fb.footballer
where country like 'E%'

select * from fb.footballer
where last_name = 'ronaldo'

-- Добавить в таблицу информации о футболистах, имя которых ronaldo    