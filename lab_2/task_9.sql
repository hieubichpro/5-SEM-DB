select f.first_name, f.last_name, f.age, t.cost,
	CASE t.position
		when 'LM' then 'Left Midfielder'
		when 'GK' then 'Goal Keeper'
		when 'CDM' then 'Centre Defensive Midfielder'
		else 'I dont now'
	end as full_position
from fb.footballer f join fb.transfer t on f.id_footballer = t.id_footballer

-- Вывети фимилии, имени, возраста, цены и полные названия позиции футболистов