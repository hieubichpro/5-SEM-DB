with table_with_duplicates as
(
	select * from fb.club
	union all
	select * from fb.club
),
tmp_table as
(
	select *, row_number() over(partition by id_club) as n
	from table_with_duplicates
)

select * from tmp_table where n = 1