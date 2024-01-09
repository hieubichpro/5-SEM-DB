create type package as
(
	name_footballer varchar,
	name_coach varchar,
	name_club varchar
)

create or replace function getPackage(beg_goals int, end_goals int)
returns setof package
as
$$
select f.last_name, c.last_name, cl.name
						from fb.footballer as f 
						join fb.transfer t
						on f.id_footballer = t.id_footballer
						join fb.coach c 
						on c.id_coach = t.id_coach
						join fb.club cl
						on cl.id_club = t.id_club
						where t.num_of_goals >= beg_goals and t.num_of_goals <= end_goals;
$$
language sql;

select * from getPackage(300, 310);