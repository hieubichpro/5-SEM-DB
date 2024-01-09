-- select * from footballer
select first_name, last_name, cost
from fb.footballer f join (select id_footballer, cost
					   from fb.transfer
					   where cost >=1000 and cost <= 2000) as tmp
					  	on f.id_footballer = tmp.id_footballer
-- Найти все футболистов, цена которых между 1000 и 2000
				