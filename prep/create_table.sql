-- create database RK2;
create schema RK2;

create table RK2.animals(
	id_animal serial primary key,
	type_animal	varchar,
	breed		varchar,
	nickname	varchar
);

create table RK2.owners(
	id_owner serial primary key,
	FIO		varchar,
	address	varchar,
	phone	varchar
);

create table RK2.ao(
	id_ao serial primary key,
	id_animal	integer references RK2.animals(id_animal),
	id_owner	integer references RK2.owners(id_owner)
);

create table RK2.dieses(
	id_diese serial primary key,
	name_diese	varchar,
	symptom		varchar,
	analys		varchar
);

create table RK2.ad(
	id_ad serial,
	id_animal	integer,
	id_diese	integer
);
