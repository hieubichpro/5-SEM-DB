select *
from fb.transfer
where id_coach
in
(
	select id_coach
	from fb.coach as co
	where co.age >(
					select avg(c.age)
					from fb.coach as c
					where c.country like 'L%'
				)
)
-- Получить информации из таблицы transfer о футболитах, тренеры которых имеют возраст больше среднего возраста тренеров из страны like L%