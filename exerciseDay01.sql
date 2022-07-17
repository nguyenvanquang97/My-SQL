use library;

create table director(
id int primary key,
full_name varchar(100)
);

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

create table trailer(
id int primary key,
id_movie int,
foreign key (id_movie) references movie(id_pk)
);

movie_languagemovie_languagealter table trailer
add column link text not null after id;

insert into category (id, name) values (1, 'Drama');
insert into category (id, name) values (2, 'Comedy|');
insert into category (id, name) values (3, 'War');
insert into category (id, name) values (4, 'Action');
insert into category (id, name) values (5, 'Adventure');
insert into category (id, name) values (6, 'Documentary');
insert into category (id, name) values (7, 'Romance');

insert into format (id, name) values (1, '2D');
insert into format (id, name) values (2, '3D');
insert into format (id, name) values (3, '4DX');
insert into format (id, name) values (4, 'IMAX');
insert into format (id, name) values (5, 'SCREENX');

insert into language (id, name) values (1, 'Hungarian');
insert into language (id, name) values (2, 'Armenian');
insert into language (id, name) values (3, 'Romanian');
insert into language (id, name) values (4, 'Czech');
insert into language (id, name) values (5, 'Tajik');

insert into director (id, full_name) values (1, 'Ernestine McLernon');
insert into director (id, full_name) values (2, 'Tracey Brockhouse');
insert into director (id, full_name) values (3, 'Addie Allin');
insert into director (id, full_name) values (4, 'Siouxie Sturney');
insert into director (id, full_name) values (5, 'Anders Stapford');
insert into director (id, full_name) values (6, 'Raynor Fechnie');
insert into director (id, full_name) values (7, 'Roanne Peealess');
insert into director (id, full_name) values (8, 'Donica Ridgewell');
insert into director (id, full_name) values (9, 'Issie Mabbs');
insert into director (id, full_name) values (10, 'Lenora Dibbe');

insert into actor (id, full_name) values (1, 'Inger Reboul');
insert into actor (id, full_name) values (2, 'Shanta Cottham');
insert into actor (id, full_name) values (3, 'Bernarr McAster');
insert into actor (id, full_name) values (4, 'Minni Sigward');
insert into actor (id, full_name) values (5, 'Brigg Grece');
insert into actor (id, full_name) values (6, 'Nani Harvison');
insert into actor (id, full_name) values (7, 'Jania Purchon');
insert into actor (id, full_name) values (8, 'Nicolle Abatelli');
insert into actor (id, full_name) values (9, 'Andy Coytes');
insert into actor (id, full_name) values (10, 'Gladi Haskayne');
insert into actor (id, full_name) values (11, 'Gerhardine Colebeck');
insert into actor (id, full_name) values (12, 'Shanna Korneichuk');
insert into actor (id, full_name) values (13, 'Orin Kenderdine');
insert into actor (id, full_name) values (14, 'Prince Jurasek');
insert into actor (id, full_name) values (15, 'Hedda Dunning');
insert into actor (id, full_name) values (16, 'Ravid Goomes');
insert into actor (id, full_name) values (17, 'Kimbra Mulqueen');
insert into actor (id, full_name) values (18, 'Jody Werendell');
insert into actor (id, full_name) values (19, 'Olivette Culshew');
insert into actor (id, full_name) values (20, 'Tracy Quinn');
insert into actor (id, full_name) values (21, 'Myriam Housaman');
insert into actor (id, full_name) values (22, 'Camella Bickerdyke');
insert into actor (id, full_name) values (23, 'Selma Stiegers');
insert into actor (id, full_name) values (24, 'Douglass Maple');
insert into actor (id, full_name) values (25, 'Ilyssa Stilldale');
insert into actor (id, full_name) values (26, 'Johnny Ruben');
insert into actor (id, full_name) values (27, 'Bartholomew Boyton');
insert into actor (id, full_name) values (28, 'Heloise Vittle');
insert into actor (id, full_name) values (29, 'Johnathon Gatheral');
insert into actor (id, full_name) values (30, 'Bayard Lerwill');



insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (1, '20 Years After', 'Morbi non quam nec dui luctus rutrum.', 185, 'R', 'http://dummyimage.com/217x100.png/5fa2dd/ffffff', 'Russel, Breitenberg and Nienow', 'public', '2022-05-25', 9);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (2, 'Step Up 3D', 'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 193, 'PG-13', 'http://dummyimage.com/116x100.png/5fa2dd/ffffff', 'Grimes LLC', 'hiden', '2021-09-16', 1);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (3, 'Alligator Eyes', 'In eleifend quam a odio. In hac habitasse platea dictumst.', 237, 'R', 'http://dummyimage.com/239x100.png/cc0000/ffffff', 'Will, Pouros and Von', 'hiden', '2021-10-22', 2);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (4, 'Gentlemen Prefer Blondes', 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 231, 'R', 'http://dummyimage.com/151x100.png/dddddd/000000', 'Bode-Christiansen', 'public', '2022-01-18', 10);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (5, 'Just Like Me (Igualita a Mi)', 'Ut tellus. Nulla ut erat id mauris vulputate elementum.', 182, 'PG', 'http://dummyimage.com/160x100.png/dddddd/000000', 'Blick Group', 'hiden', '2022-05-15', 4);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (6, 'Bucket List, The', 'Nam dui.', 240, 'NR', 'http://dummyimage.com/167x100.png/5fa2dd/ffffff', 'Hickle, Welch and Rogahn', 'hiden', '2022-02-16', 6);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (7, 'Girl, The (Flickan)', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.', 211, 'PG', 'http://dummyimage.com/237x100.png/ff4444/ffffff', 'Harber Inc', 'hiden', '2022-01-11', 5);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (8, 'Foxcatcher', 'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 198, 'PG', 'http://dummyimage.com/236x100.png/dddddd/000000', 'Gerlach, Leuschke and Schoen', 'public', '2022-04-20', 2);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (9, 'Midnight Express', 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 185, 'R', 'http://dummyimage.com/142x100.png/dddddd/000000', 'Pacocha LLC', 'hiden', '2021-11-14', 4);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (10, 'Salvation, The', 'Phasellus sit amet erat.', 200, 'NC-17', 'http://dummyimage.com/117x100.png/ff4444/ffffff', 'Boehm Group', 'public', '2022-05-29', 6);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (11, 'Turn of the Screw, The', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.', 194, 'R', 'http://dummyimage.com/245x100.png/5fa2dd/ffffff', 'Schuster, Marquardt and Hoppe', 'public', '2021-12-08', 10);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (12, 'The Little Matchgirl', 'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 233, 'R', 'http://dummyimage.com/182x100.png/dddddd/000000', 'Stark, Dach and Konopelski', 'public', '2021-12-16', 2);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (13, 'Two Can Play That Game', 'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.', 193, 'G', 'http://dummyimage.com/131x100.png/5fa2dd/ffffff', 'Ferry, Nitzsche and Bayer', 'hiden', '2022-06-26', 2);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (14, 'Ouch (Aïe)', 'Suspendisse accumsan tortor quis turpis.', 209, 'NR', 'http://dummyimage.com/234x100.png/dddddd/000000', 'Schimmel and Sons', 'hiden', '2022-07-09', 5);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (15, 'Paper Lion', 'Cras in purus eu magna vulputate luctus.', 219, 'R', 'http://dummyimage.com/223x100.png/cc0000/ffffff', 'Pollich-Rodriguez', 'hiden', '2021-08-02', 3);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (16, 'Far Side of the Moon, The (Face cachée de la lune, La)', 'Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.', 189, 'R', 'http://dummyimage.com/113x100.png/5fa2dd/ffffff', 'Gleichner Inc', 'hiden', '2022-01-15', 1);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (17, 'Sunday', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', 198, 'G', 'http://dummyimage.com/199x100.png/cc0000/ffffff', 'Halvorson, Lowe and Johns', 'public', '2021-10-07', 6);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (18, 'Six in Paris (Paris vu par...)', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 182, 'NC-17', 'http://dummyimage.com/159x100.png/ff4444/ffffff', 'Langworth and Sons', 'hiden', '2022-06-04', 5);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (19, 'Dead Husbands', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 222, 'PG', 'http://dummyimage.com/164x100.png/5fa2dd/ffffff', 'Hoeger-Rath', 'hiden', '2021-12-26', 1);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (20, 'Flight of Dragons, The', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 195, 'G', 'http://dummyimage.com/203x100.png/dddddd/000000', 'Emmerich, Lowe and Cassin', 'hiden', '2021-07-22', 7);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (21, 'Operation Mad Ball', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 239, 'NC-17', 'http://dummyimage.com/218x100.png/cc0000/ffffff', 'Stamm-Leffler', 'public', '2021-08-14', 4);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (22, 'Leatherheads', 'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.', 217, 'G', 'http://dummyimage.com/229x100.png/ff4444/ffffff', 'Lindgren, Shanahan and Crona', 'public', '2022-03-13', 10);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (23, 'Pick-up Summer (Pinball Summer)', 'Vestibulum rutrum rutrum neque.', 224, 'R', 'http://dummyimage.com/134x100.png/dddddd/000000', 'Weimann, Schulist and Weimann', 'public', '2022-05-26', 6);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (24, 'Angry Silence, The', 'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.', 220, 'NR', 'http://dummyimage.com/195x100.png/dddddd/000000', 'Rath-Cruickshank', 'public', '2021-07-18', 10);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (25, 'Iceman Tapes: Conversations with a Killer, The', 'Nulla nisl.', 202, 'G', 'http://dummyimage.com/160x100.png/cc0000/ffffff', 'Dickinson, Friesen and Kutch', 'hiden', '2021-10-21', 8);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (26, 'Lumiere and Company (Lumière et compagnie)', 'In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 215, 'NC-17', 'http://dummyimage.com/160x100.png/cc0000/ffffff', 'Simonis, Johnson and Lockman', 'public', '2021-11-21', 4);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (27, 'Girl Who Played with Fire, The (Flickan som lekte med elden)', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis.', 217, 'PG-13', 'http://dummyimage.com/113x100.png/ff4444/ffffff', 'Mayert-Terry', 'public', '2022-03-29', 9);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (28, 'Dark Angel (I Come in Peace)', 'Proin risus.', 232, 'R', 'http://dummyimage.com/241x100.png/dddddd/000000', 'Reilly and Sons', 'public', '2022-02-11', 8);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (29, 'Company You Keep, The', 'Ut at dolor quis odio consequat varius. Integer ac leo.', 180, 'PG-13', 'http://dummyimage.com/110x100.png/dddddd/000000', 'Kemmer-Fritsch', 'hiden', '2021-08-08', 9);
insert into movie (id_pk, title, description, length, rating, poster, studio, status, release_date, id_director) values (30, 'Tyler Perry''s I Can Do Bad All by Myself', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.', 221, 'PG', 'http://dummyimage.com/189x100.png/dddddd/000000', 'Beatty, Haley and Gibson', 'hiden', '2022-06-17', 3);

insert into movie_actor (id_movie, id_actor) values (1, 3);
insert into movie_actor (id_movie, id_actor) values (2, 9);
insert into movie_actor (id_movie, id_actor) values (3, 8);
insert into movie_actor (id_movie, id_actor) values (4, 1);
insert into movie_actor (id_movie, id_actor) values (5, 9);
insert into movie_actor (id_movie, id_actor) values (6, 9);
insert into movie_actor (id_movie, id_actor) values (7, 1);
insert into movie_actor (id_movie, id_actor) values (8, 8);
insert into movie_actor (id_movie, id_actor) values (9, 3);
insert into movie_actor (id_movie, id_actor) values (10, 2);
insert into movie_actor (id_movie, id_actor) values (11, 4);
insert into movie_actor (id_movie, id_actor) values (12, 8);
insert into movie_actor (id_movie, id_actor) values (13, 9);
insert into movie_actor (id_movie, id_actor) values (14, 2);
insert into movie_actor (id_movie, id_actor) values (15, 5);
insert into movie_actor (id_movie, id_actor) values (16, 4);
insert into movie_actor (id_movie, id_actor) values (17, 7);
insert into movie_actor (id_movie, id_actor) values (18, 9);
insert into movie_actor (id_movie, id_actor) values (19, 10);
insert into movie_actor (id_movie, id_actor) values (20, 2);
insert into movie_actor (id_movie, id_actor) values (21, 5);
insert into movie_actor (id_movie, id_actor) values (22, 1);
insert into movie_actor (id_movie, id_actor) values (23, 9);
insert into movie_actor (id_movie, id_actor) values (24, 6);
insert into movie_actor (id_movie, id_actor) values (25, 8);
insert into movie_actor (id_movie, id_actor) values (26, 7);
insert into movie_actor (id_movie, id_actor) values (27, 3);
insert into movie_actor (id_movie, id_actor) values (28, 5);
insert into movie_actor (id_movie, id_actor) values (29, 10);
insert into movie_actor (id_movie, id_actor) values (30, 6);

insert into movie_actor (id_movie, id_actor) values (1, 17);
insert into movie_actor (id_movie, id_actor) values (2, 20);
insert into movie_actor (id_movie, id_actor) values (3, 20);
insert into movie_actor (id_movie, id_actor) values (4, 10);
insert into movie_actor (id_movie, id_actor) values (5, 17);
insert into movie_actor (id_movie, id_actor) values (6, 19);
insert into movie_actor (id_movie, id_actor) values (7, 19);
insert into movie_actor (id_movie, id_actor) values (8, 17);
insert into movie_actor (id_movie, id_actor) values (9, 18);
insert into movie_actor (id_movie, id_actor) values (10, 19);
insert into movie_actor (id_movie, id_actor) values (11, 17);
insert into movie_actor (id_movie, id_actor) values (12, 16);
insert into movie_actor (id_movie, id_actor) values (13, 13);
insert into movie_actor (id_movie, id_actor) values (14, 13);
insert into movie_actor (id_movie, id_actor) values (15, 10);
insert into movie_actor (id_movie, id_actor) values (16, 11);
insert into movie_actor (id_movie, id_actor) values (17, 10);
insert into movie_actor (id_movie, id_actor) values (18, 18);
insert into movie_actor (id_movie, id_actor) values (19, 11);
insert into movie_actor (id_movie, id_actor) values (20, 14);
insert into movie_actor (id_movie, id_actor) values (21, 11);
insert into movie_actor (id_movie, id_actor) values (22, 16);
insert into movie_actor (id_movie, id_actor) values (23, 19);
insert into movie_actor (id_movie, id_actor) values (24, 13);
insert into movie_actor (id_movie, id_actor) values (25, 17);
insert into movie_actor (id_movie, id_actor) values (26, 12);
insert into movie_actor (id_movie, id_actor) values (27, 11);
insert into movie_actor (id_movie, id_actor) values (28, 15);
insert into movie_actor (id_movie, id_actor) values (29, 18);
insert into movie_actor (id_movie, id_actor) values (30, 19);

insert into movie_actor (id_movie, id_actor) values (1, 27);
insert into movie_actor (id_movie, id_actor) values (2, 24);
insert into movie_actor (id_movie, id_actor) values (3, 22);
insert into movie_actor (id_movie, id_actor) values (4, 27);
insert into movie_actor (id_movie, id_actor) values (5, 21);
insert into movie_actor (id_movie, id_actor) values (6, 23);
insert into movie_actor (id_movie, id_actor) values (7, 30);
insert into movie_actor (id_movie, id_actor) values (8, 24);
insert into movie_actor (id_movie, id_actor) values (9, 27);
insert into movie_actor (id_movie, id_actor) values (10, 23);
insert into movie_actor (id_movie, id_actor) values (11, 23);
insert into movie_actor (id_movie, id_actor) values (12, 27);
insert into movie_actor (id_movie, id_actor) values (13, 28);
insert into movie_actor (id_movie, id_actor) values (14, 25);
insert into movie_actor (id_movie, id_actor) values (15, 22);
insert into movie_actor (id_movie, id_actor) values (16, 28);
insert into movie_actor (id_movie, id_actor) values (17, 22);
insert into movie_actor (id_movie, id_actor) values (18, 24);
insert into movie_actor (id_movie, id_actor) values (19, 21);
insert into movie_actor (id_movie, id_actor) values (20, 24);
insert into movie_actor (id_movie, id_actor) values (21, 21);
insert into movie_actor (id_movie, id_actor) values (22, 24);
insert into movie_actor (id_movie, id_actor) values (23, 27);
insert into movie_actor (id_movie, id_actor) values (24, 22);
insert into movie_actor (id_movie, id_actor) values (25, 22);
insert into movie_actor (id_movie, id_actor) values (26, 30);
insert into movie_actor (id_movie, id_actor) values (27, 30);
insert into movie_actor (id_movie, id_actor) values (28, 23);
insert into movie_actor (id_movie, id_actor) values (29, 26);
insert into movie_actor (id_movie, id_actor) values (30, 21);

insert into movie_category (id_movie, id_category) values (1, 1);
insert into movie_category (id_movie, id_category) values (2, 1);
insert into movie_category (id_movie, id_category) values (3, 3);
insert into movie_category (id_movie, id_category) values (4, 2);
insert into movie_category (id_movie, id_category) values (5, 3);
insert into movie_category (id_movie, id_category) values (6, 4);
insert into movie_category (id_movie, id_category) values (7, 4);
insert into movie_category (id_movie, id_category) values (8, 4);
insert into movie_category (id_movie, id_category) values (9, 2);
insert into movie_category (id_movie, id_category) values (10, 2);
insert into movie_category (id_movie, id_category) values (11, 3);
insert into movie_category (id_movie, id_category) values (12, 3);
insert into movie_category (id_movie, id_category) values (13, 2);
insert into movie_category (id_movie, id_category) values (14, 1);
insert into movie_category (id_movie, id_category) values (15, 2);
insert into movie_category (id_movie, id_category) values (16, 3);
insert into movie_category (id_movie, id_category) values (17, 2);
insert into movie_category (id_movie, id_category) values (18, 1);
insert into movie_category (id_movie, id_category) values (19, 1);
insert into movie_category (id_movie, id_category) values (20, 3);
insert into movie_category (id_movie, id_category) values (21, 3);
insert into movie_category (id_movie, id_category) values (22, 4);
insert into movie_category (id_movie, id_category) values (23, 3);
insert into movie_category (id_movie, id_category) values (24, 4);
insert into movie_category (id_movie, id_category) values (25, 4);
insert into movie_category (id_movie, id_category) values (26, 3);
insert into movie_category (id_movie, id_category) values (27, 3);
insert into movie_category (id_movie, id_category) values (28, 2);
insert into movie_category (id_movie, id_category) values (29, 2);
insert into movie_category (id_movie, id_category) values (30, 4);

insert into movie_category (id_movie, id_category) values (1, 6);
insert into movie_category (id_movie, id_category) values (2, 6);
insert into movie_category (id_movie, id_category) values (3, 6);
insert into movie_category (id_movie, id_category) values (4, 5);
insert into movie_category (id_movie, id_category) values (5, 5);
insert into movie_category (id_movie, id_category) values (6, 6);
insert into movie_category (id_movie, id_category) values (7, 7);
insert into movie_category (id_movie, id_category) values (8, 6);
insert into movie_category (id_movie, id_category) values (9, 5);
insert into movie_category (id_movie, id_category) values (10, 5);
insert into movie_category (id_movie, id_category) values (11, 5);
insert into movie_category (id_movie, id_category) values (12, 5);
insert into movie_category (id_movie, id_category) values (13, 7);
insert into movie_category (id_movie, id_category) values (14, 7);
insert into movie_category (id_movie, id_category) values (15, 7);
insert into movie_category (id_movie, id_category) values (16, 7);
insert into movie_category (id_movie, id_category) values (17, 7);
insert into movie_category (id_movie, id_category) values (18, 6);
insert into movie_category (id_movie, id_category) values (19, 7);
insert into movie_category (id_movie, id_category) values (20, 7);
insert into movie_category (id_movie, id_category) values (21, 5);
insert into movie_category (id_movie, id_category) values (22, 5);
insert into movie_category (id_movie, id_category) values (23, 5);
insert into movie_category (id_movie, id_category) values (24, 7);
insert into movie_category (id_movie, id_category) values (25, 7);
insert into movie_category (id_movie, id_category) values (26, 7);
insert into movie_category (id_movie, id_category) values (27, 6);
insert into movie_category (id_movie, id_category) values (28, 5);
insert into movie_category (id_movie, id_category) values (29, 6);
insert into movie_category (id_movie, id_category) values (30, 7);

insert into movie_format (id_movie, id_format) values (1, 4);
insert into movie_format (id_movie, id_format) values (2, 2);
insert into movie_format (id_movie, id_format) values (3, 3);
insert into movie_format (id_movie, id_format) values (4, 4);
insert into movie_format (id_movie, id_format) values (5, 4);
insert into movie_format (id_movie, id_format) values (6, 5);
insert into movie_format (id_movie, id_format) values (7, 3);
insert into movie_format (id_movie, id_format) values (8, 3);
insert into movie_format (id_movie, id_format) values (9, 1);
insert into movie_format (id_movie, id_format) values (10, 5);
insert into movie_format (id_movie, id_format) values (11, 5);
insert into movie_format (id_movie, id_format) values (12, 3);
insert into movie_format (id_movie, id_format) values (13, 3);
insert into movie_format (id_movie, id_format) values (14, 2);
insert into movie_format (id_movie, id_format) values (15, 2);
insert into movie_format (id_movie, id_format) values (16, 2);
insert into movie_format (id_movie, id_format) values (17, 1);
insert into movie_format (id_movie, id_format) values (18, 5);
insert into movie_format (id_movie, id_format) values (19, 3);
insert into movie_format (id_movie, id_format) values (20, 2);
insert into movie_format (id_movie, id_format) values (21, 1);
insert into movie_format (id_movie, id_format) values (22, 1);
insert into movie_format (id_movie, id_format) values (23, 4);
insert into movie_format (id_movie, id_format) values (24, 4);
insert into movie_format (id_movie, id_format) values (25, 4);
insert into movie_format (id_movie, id_format) values (26, 5);
insert into movie_format (id_movie, id_format) values (27, 2);
insert into movie_format (id_movie, id_format) values (28, 4);
insert into movie_format (id_movie, id_format) values (29, 1);
insert into movie_format (id_movie, id_format) values (30, 1);

insert into movie_language (id_movie, id_language) values (1, 2);
insert into movie_language (id_movie, id_language) values (2, 2);
insert into movie_language (id_movie, id_language) values (3, 2);
insert into movie_language (id_movie, id_language) values (4, 3);
insert into movie_language (id_movie, id_language) values (5, 3);
insert into movie_language (id_movie, id_language) values (6, 1);
insert into movie_language (id_movie, id_language) values (7, 3);
insert into movie_language (id_movie, id_language) values (8, 3);
insert into movie_language (id_movie, id_language) values (9, 5);
insert into movie_language (id_movie, id_language) values (10, 3);
insert into movie_language (id_movie, id_language) values (11, 5);
insert into movie_language (id_movie, id_language) values (12, 5);
insert into movie_language (id_movie, id_language) values (13, 4);
insert into movie_language (id_movie, id_language) values (14, 1);
insert into movie_language (id_movie, id_language) values (15, 2);
insert into movie_language (id_movie, id_language) values (16, 4);
insert into movie_language (id_movie, id_language) values (17, 5);
insert into movie_language (id_movie, id_language) values (18, 4);
insert into movie_language (id_movie, id_language) values (19, 2);
insert into movie_language (id_movie, id_language) values (20, 5);
insert into movie_language (id_movie, id_language) values (21, 2);
insert into movie_language (id_movie, id_language) values (22, 4);
insert into movie_language (id_movie, id_language) values (23, 2);
insert into movie_language (id_movie, id_language) values (24, 5);
insert into movie_language (id_movie, id_language) values (25, 2);
insert into movie_language (id_movie, id_language) values (26, 5);
insert into movie_language (id_movie, id_language) values (27, 1);
insert into movie_language (id_movie, id_language) values (28, 1);
insert into movie_language (id_movie, id_language) values (29, 3);
insert into movie_language (id_movie, id_language) values (30, 3);

insert into trailer (id, link, id_movie) values (1, 'https://fema.gov/mauris/lacinia/sapien/quis.jpg', 1);
insert into trailer (id, link, id_movie) values (2, 'http://tuttocitta.it/nec/nisi/vulputate/nonummy/maecenas.js', 2);
insert into trailer (id, link, id_movie) values (3, 'http://imageshack.us/neque/duis/bibendum/morbi.json', 3);
insert into trailer (id, link, id_movie) values (4, 'http://guardian.co.uk/ipsum/primis.json', 4);
insert into trailer (id, link, id_movie) values (5, 'https://washington.edu/vitae.html', 5);
insert into trailer (id, link, id_movie) values (6, 'https://nba.com/mauris/vulputate/elementum/nullam.json', 6);
insert into trailer (id, link, id_movie) values (7, 'https://comsenz.com/lacinia/erat/vestibulum/sed/magna/at/nunc.aspx', 7);
insert into trailer (id, link, id_movie) values (8, 'http://domainmarket.com/nisl/duis/bibendum/felis/sed/interdum.jpg', 8);
insert into trailer (id, link, id_movie) values (9, 'https://blogtalkradio.com/justo.json', 9);
insert into trailer (id, link, id_movie) values (10, 'https://youtube.com/sed/vel/enim/sit/amet/nunc.png', 10);
insert into trailer (id, link, id_movie) values (11, 'http://trellian.com/pede/venenatis/non/sodales/sed/tincidunt/eu.aspx', 11);
insert into trailer (id, link, id_movie) values (12, 'http://g.co/orci/luctus/et/ultrices/posuere/cubilia.xml', 12);
insert into trailer (id, link, id_movie) values (13, 'http://naver.com/nullam/molestie.jsp', 13);
insert into trailer (id, link, id_movie) values (14, 'http://webnode.com/tincidunt/ante/vel.jsp', 14);
insert into trailer (id, link, id_movie) values (15, 'https://japanpost.jp/quis/augue.xml', 15);
insert into trailer (id, link, id_movie) values (16, 'http://meetup.com/ligula/in/lacus.png', 16);
insert into trailer (id, link, id_movie) values (17, 'https://ed.gov/vestibulum.png', 17);
insert into trailer (id, link, id_movie) values (18, 'http://dedecms.com/platea.jpg', 18);
insert into trailer (id, link, id_movie) values (19, 'http://boston.com/varius/integer/ac/leo/pellentesque/ultrices.aspx', 19);
insert into trailer (id, link, id_movie) values (20, 'https://blogspot.com/eu/tincidunt.html', 20);
insert into trailer (id, link, id_movie) values (21, 'http://deviantart.com/non/mauris.xml', 21);
insert into trailer (id, link, id_movie) values (22, 'http://istockphoto.com/id/massa/id.xml', 22);
insert into trailer (id, link, id_movie) values (23, 'https://princeton.edu/suspendisse.aspx', 23);
insert into trailer (id, link, id_movie) values (24, 'https://blogspot.com/et/commodo/vulputate/justo/in/blandit/ultrices.html', 24);
insert into trailer (id, link, id_movie) values (25, 'https://live.com/cras/pellentesque/volutpat/dui/maecenas.jsp', 25);
insert into trailer (id, link, id_movie) values (26, 'https://mysql.com/nulla.png', 26);
insert into trailer (id, link, id_movie) values (27, 'http://globo.com/ante/nulla.jpg', 27);
insert into trailer (id, link, id_movie) values (28, 'http://redcross.org/felis/eu/sapien/cursus/vestibulum/proin.aspx', 28);
insert into trailer (id, link, id_movie) values (29, 'https://vinaora.com/ipsum/primis/in/faucibus/orci/luctus.xml', 29);
insert into trailer (id, link, id_movie) values (30, 'https://odnoklassniki.ru/tempus/sit/amet.jsp', 30);
