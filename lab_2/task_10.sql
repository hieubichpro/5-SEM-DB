select f.first_name, f.last_name, f.country,
	case
		when t.cost < 2000 then 'costly'
		when t.cost < 4000 then 'pricey'
		when t.cost < 6000 then 'expensive'
		else 'very expensive'
	end as price
from fb.footballer f join transfer t on f.id_footballer = t.id_footballer

-- Классификация футболистов по ценам.