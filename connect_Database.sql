create database customer;

use customer;

create table user(
id int primary key auto_increment,
user_name varchar(100) not null,
email varchar(200)  not null,
password text not null
);

insert into user (id,user_name,email,password)
value(null,'quang', 'quang@gmail.com','123456789');