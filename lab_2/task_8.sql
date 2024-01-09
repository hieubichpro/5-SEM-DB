select first_name, country, age,
(select position from fb.transfer t
 where f.id_footballer = t.id_footballer)
from fb.footballer f
where salary > (select avg(salary) from fb.footballer) and age <= 20

-- Вывести фамилии, страны, возраста и позиции футболистов, зарплата которых больше средних и возраст которых моложе 20 