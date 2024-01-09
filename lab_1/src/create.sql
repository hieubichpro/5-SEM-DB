CREATE TABLE if not exists fb.footballer
(
    id_footballer serial PRIMARY KEY not null,
    first_name     VARCHAR(100) NOT NULL,
    last_name      VARCHAR(100) NOT NULL,
    age            INT NOT NULL,
    country        VARCHAR(100) NOT NULL,
    salary         INT NOT NULL,
	phone_number	VARCHAR(100) NOT NULL,
    check (age >= 16 and age <= 45),
    check ((first_name != '') and (last_name != '')),
    check (country != ''),
    check ((salary >= 100000) and (salary <= 10000000)),
	check (phone_number != '')
);

CREATE TABLE if not exists fb.coach
(
    id_coach serial PRIMARY KEY not null,
    first_name      VARCHAR(100) NOT NULL,
    last_name       VARCHAR(100) NOT NULL,
    age             INT NOT NULL,
	country			VARCHAR(100) NOT NULL,
    work_experience INT NOT NULL,
    phone_number    VARCHAR(30) UNIQUE NOT NULL,
    salary          INT NOT NULL,
	email			VARCHAR(100) NOT NULL,
    check (age >= 30 and age < 80),
    check ((first_name != '') and (last_name != '')),
    check (work_experience >= 0),
    check ((salary >= 500000) and (salary <= 5000000)),
	check ((country != '') and (email != ''))
);

CREATE TABLE if not exists fb.club
(
    id_club serial PRIMARY KEY not null,
    name    VARCHAR(100) NOT NULL,
    city    VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL,
    num_of_fans INT NOT NULL,
    email   VARCHAR(100) UNIQUE,
    foundation_year INT NOT NULL,
    check (country != ''),
    check (city != ''),
    check (email like '%_@_%._%'),
    check ((foundation_year >= 1830) and (foundation_year) <= 2023)
);

CREATE TABLE if not exists fb.transfer
(
    id_transfer serial PRIMARY KEY not null,
    cost INT CHECK (cost >= 1230 and cost <= 12300),
    position VARCHAR(100),
    num_of_goals   INT NOT NULL check ((num_of_goals >= 5) and (num_of_goals <= 500)),
	rating FLOAT NOT NULL check (rating <= 5.0 and rating >= 1.0),
	
    id_footballer INT,
    FOREIGN KEY (id_footballer) REFERENCES fb.footballer(id_footballer) on delete cascade,
    
    id_coach INT,
	FOREIGN KEY (id_coach) REFERENCES fb.coach(id_coach) on delete cascade,
    
    id_club INT,
	FOREIGN KEY (id_club) REFERENCES fb.club(id_club) on delete cascade
);