-- select * from footballer

select count(*) as cnt, country
from fb.footballer
group by country

-- Посчитать количество футболистов по странам