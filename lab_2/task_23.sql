drop table if exists friends_table;

create table if not exists friends_table
(
	id int not null primary key,
	name varchar(20),
	friend_id int
);

insert into friends_table(id, name, friend_id) values
(1, 'Messi', 3),
(2, 'Ronaldo', null),
(3, 'Rooney', 4),
(4, 'De Bruyne', 2);

-- select * from friends_table;

with recursive recursive_friends(id, name, friend_id) as
(
	-- Определение закрепленного элемента
	select ft.id, ft.name, ft.friend_id
	from friends_table ft
	where ft.id = 1
	union all
	-- Определение рекурсивного элемента
	select ft.id, ft.name, ft.friend_id
	from friends_table ft
	join recursive_friends rec on ft.id = rec.friend_id
)

select * from recursive_friends

-- Получить цепочку друзей
