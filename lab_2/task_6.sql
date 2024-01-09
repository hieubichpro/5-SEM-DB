-- select * from coach
select first_name, last_name
from fb.coach where salary > ALL(select salary
							 from fb.coach where work_experience > 5 and work_experience < 10)
-- Найти все тренеров, зарплата которых больше зарплату тренеров, опыт которых между 5 и 10 лет