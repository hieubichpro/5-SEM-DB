create or replace function countCoachByCountry(country_param varchar)
returns int
as
$$
ppl = plpy.execute("select * from fb.coach")
cnt = 0
for coach in ppl:
	if coach['country'] == country_param:
		cnt += 1
return cnt
$$
language plpython3u;

select * from countCoachByCountry('Spain')