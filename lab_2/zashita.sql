select f.first_name, f.last_name, f.age, c.first_name, c.last_name, c.work_experience, cl.name, cl.city,cl.country
from fb.transfer as t
join fb.footballer as f
on t.id_footballer = f.id_footballer
join fb.coach as c
on t.id_coach = c.id_coach
join fb.club as cl
on t.id_club = cl.id_club
where cl.country = 'Spain'