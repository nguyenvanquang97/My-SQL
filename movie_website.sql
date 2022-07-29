create database movie_website;

create database book;
use movie_website;

select avg(imdb)
from movie;

select *
from movie
where imdb > (
select avg(imdb)
from movie
);

select m.*
from movie m,( select avg(length) as avg_length from movie) s
where m.length > s.avg_length;

select m.id,m.title,m.length,
(select avg(length) as avg_length from movie) as avg_length
from movie m;

select m.* 
from movie m
inner join title_type t
on m.id_title_type= t.id
where t.name = 'movie';

select *
from movie
where id_title_type=(
select id
from title_type
where name ='Movie');

-- lấy ra những bộ phim có điểm imdb cao nhất

select m.* 
from movie m
where m.imdb =(select max(imdb)
from movie);

-- lấy ra những bộ phim có thời lượng dài nhất


-- lấy ra đạo diễn tham gia nhiều bộ phim nhất
select *
from director 
where id =(select id_director
from (select distinct (d.id) as id_director,count(m.id) as movie_numbers
from movie m inner join director d
on m.id_director=d.id
group by d.id) as sub_movie
where movie_numbers=(select max(movie_numbers)
from 
(select distinct (d.full_name),count(m.id) as movie_numbers
from movie m inner join director d
on m.id_director=d.id
group by d.id) as sub_movie));

select *
from movie_number mnb
where mnb.movie_numbers=(select max(movie_numbers)
from movie_number);

select count(*)
from movie;

delimiter $$
create procedure sp_count_movie()
begin 
select count(*)
from movie;
end$$
delimiter ;

call sp_count_movie();

delimiter $$
create procedure sp_count_movie_by_rating(
in rating_input text
)
begin
   select count(*) 
   from movie
   where rating =rating_input;
end$$
delimiter ;

call sp_count_movie_by_rating('PG-13');

delimiter $$
create procedure sp_show_movie_by_title_type(
in title_type_input text)
begin
select *
from movie m inner join title_type tt
on m.id_title_type = tt.id
where tt.name = title_type_input;
end$$
delimiter ;

call sp_show_movie_by_title_type('Movie');

delimiter $$
create procedure sp_found_movie(
in title_input text,
out result text
)
begin
declare count_movie int;-- khai báo biến count_movie
select count(*) into count_movie
from movie
where title like title_input;

if count_movie = 0 then
    set result = 'không tìm thấy phim';
else 
    set result =concat('Tìm thấy ', count_movie);
end if;
end $$
delimiter ;

drop procedure   sp_found_movie;
call sp_found_movie('Jet Pilot',@rs);
select @rs;




