select count(*) as cnt, country
from fb.footballer as f
group by country
having country like 'A%'

-- Посчитать количество футболистов по странам, назавание которых начинается с буквы A