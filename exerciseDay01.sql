create table movie(
id_pk int primary key,
title text not null,
description text not null,
length int,
rating enum('G','PG','PG-13','R','NC-17','NR'),
poster text,
studio varchar(100),
status enum('public','hiden'),
release_date date,
id_director int,
foreign key (id_director) references director(id)
);

create table director(
id int primary key,
full_name varchar(100)
);

create table category(
id int primary key,
name varchar(100) not null
);

create table movie_category(
id_movie int,
id_category int,
primary key(id_movie,id_category),
foreign key(id_movie) references movie(id_pk),
foreign key(id_category) references category(id)
);

create table format(
id int primary key,
name enum('2D','3D','4DX','IMAX','SCREENX')
);

create table movie_format(
id_movie int,
id_format int,
primary key(id_movie,id_format),
foreign key(id_movie) references movie(id_pk),
foreign key(id_format) references format(id)
);

create table language(
id int primary key,
name varchar(100) not null
);

create table movie_language(
id_movie int,
id_language int,
primary key(id_movie,id_language),
foreign key(id_movie) references movie(id_pk),
foreign key(id_language) references language(id)
);

create table actor(
id int primary key,
full_name varchar(100) not null
);

create table movie_actor(
id_movie int,
id_actor int,
primary key(id_movie,id_actor),
foreign key(id_movie) references movie(id_pk),
foreign key(id_actor) references actor(id)
);

authorcreate table trailer(
id int primary key,
id_movie int,
foreign key (id_movie) references movie(id_pk)
);











