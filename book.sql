use book;

CREATE TABLE borrow (
	id INT PRIMARY KEY AUTO_INCREMENT,
	id_reader INT NOT NULL,
    id_employee INT NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (id_reader) REFERENCES reader(id),
    FOREIGN KEY (id_employee) REFERENCES employee(id)
);



CREATE TABLE item_borrow(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_borrow INT NOT NULL,
    id_book INT NOT NULL,
    amount INT NOT NULL,
    FOREIGN KEY (id_borrow) REFERENCES borrow(id),
    FOREIGN KEY (id_book) REFERENCES book(id)
);

CREATE TABLE return_book(
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_borrow INT NOT NULL,
    date DATE NOT NULL,
    id_employee INT NOT NULL,
    FOREIGN KEY (id_borrow) REFERENCES borrow(id),
    FOREIGN KEY (id_employee) REFERENCES employee(id)
);

create view book_author_publisher as
select b.id,b.title,b.image,p.name as publisher_name,
json_arrayagg(a.full_name)
from book b inner join publisher p 
on b.id_publisher =p.id 
inner join book_author ba on ba.id_book = b.id
inner join author a on a.id =ba.id_author
group by id

