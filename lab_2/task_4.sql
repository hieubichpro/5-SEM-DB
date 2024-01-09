-- select * from coach
select id_coach, first_name, last_name
from fb.coach where id_coach in (select id_coach
							 from fb.transfer
							 where position = 'LB')
-- найти тренеров, футболисты которых играют в 'LB'