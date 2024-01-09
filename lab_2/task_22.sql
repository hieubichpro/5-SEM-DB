-- select * from footballer
with CTE(country, numOfPlayers) as (
	select country, count(*) as cnt
	from fb.footballer
	group by country
)
select * from cte

-- Посчитать количества футболистов по странам и результат заносится в таблицу cte

