create or replace function insertIntoFootballer()
returns trigger
as
$$
	if TD['new']['last_name'] == "Messi":
		plpy.notice(f"добавлено легенд {TD['new']['last_name']}")
	else:
		plpy.notice("Обычный футболист")
$$
language plpython3u;

drop trigger insertInfo on fb.footballer

create trigger insertInfo after insert on fb.footballer
for row execute procedure insertIntoFootballer();

insert into fb.footballer(first_name, last_name, age, country, salary, phone_number)
values ('Lionel', 'Messi', 30, 'Argentina', 500000, '123456');