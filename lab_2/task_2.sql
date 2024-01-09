-- select * from club;
select name, country, foundation_year
from fb.club
where foundation_year between 1900 and 1910
-- найти все клубы, год создания которых между 1900 и 1910.