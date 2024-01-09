create or replace function getClubByFoundationYear(beg_year int, end_year int)
returns table (
	id_club int,
	name varchar,
	city varchar,
	country varchar,
	num_of_fans int,
	email varchar,
	foundation_year int
)
as
$$
ppl = plpy.execute("select * from fb.club")
res = []
for club in ppl:
	if beg_year <= club['foundation_year'] <= end_year:
		res.append(club)
return res
$$
language plpython3u;

select * from getClubByFoundationYear(1900, 1910);