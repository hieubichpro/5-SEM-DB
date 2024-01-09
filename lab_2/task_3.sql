-- select * from club
select name, country
from fb.club c join fb.transfer t on c.id_club = t.id_club
where name like 'Arsenal%'
-- найти все клубы, название которых начинается с "Arsenal"
