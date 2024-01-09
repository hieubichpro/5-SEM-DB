drop table history;
create table history
(
	id_history serial primary key,
	id_coach int,
	old_email varchar
);

create or replace function store_history()
returns trigger
as
$$
begin
	if old.email <> new.email then
		insert into history(id_coach, old_email) values(old.id_coach, old.email);
	end if;
	return new;
end;
$$
language  plpgsql;

drop trigger history on fb.coach

create trigger history
after update on fb.coach
for each row
execute function store_history();

select * from fb.coach where id_coach = 5
update fb.coach set email = 'aaa@bmstu.ru' where id_coach = 5
select * from history