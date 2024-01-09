select first_name, last_name, age, salary,
row_number() over(order by salary)
from fb.footballer
where country like 'B%' and age >= 20 and age <= 30

-- Ранжировать футболистов по зарплатам