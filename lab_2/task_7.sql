-- select * from coach
select country, sum(salary) as sum_salary
from fb.coach
group by country

-- Вывести зарплаты по странам
