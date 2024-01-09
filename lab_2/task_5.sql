select id_club, name
from fb.club
where exists(select id_transfer
			from fb.transfer t
			where club.id_club = t.id_club
			 and num_of_goals >= 100 and rating >= 5.0)
-- Найти все клубы, футболисты которых забили более 100 мяч и rating >= 5.0