use book;

-- Lấy ra thông tin tất cả các quyển sách thuộc thể loại comedy hoặc drama
select * 
from book b
inner join book_category bc 
on b.id = bc.id_book
inner join category c
on bc.id_category = c.id
where c.name ='comedy'
or c.name = 'drama'
; 

-- Lấy ra id_book, title, author, category của quyển sách được xuất bản từ năm 1800 đến 1900
select b.id,b.title,a.full_name,c.name
from book b
inner join book_author ba 
on b.id = ba.id_book 
inner join author a
on ba.id_author = a.id
inner join book_category bc 
on b.id = bc.id_book
inner join category c
on bc.id_category = c.id
where b.year_of_publication >= 1800
and  b.year_of_publication <= 1900
;

-- Sử dụng database movie_website thực hiện các truy vấn sau:
-- Lấy ra tên phim, title_type, năm công chiếu, rating, điểm imdb, thời lượng, thể loại (mảng),tên đạo diễn , tên diễn viên (mảng) ủa phim có id = 1
use movie_website;
select m.title,tt.name as title_type,m.release_date,m.rating,
m.imdb,m.length,g.name as genres,json_arrayagg(d.full_name) as director,json_arrayagg(a.full_name) as actor
from movie m
inner join title_type tt
on m.id_title_type = tt.id
inner join movie_actor ma
on m.id = ma.id_movie
inner join actor a
on a.id = ma.id_actor
inner join director d
on d.id = m.id_director
inner join movie_genres mg
on mg.id_movie = m.id
inner join genres g
on g.id = mg.id_genres
where m.id= 1
group by d.id and a.id;

