drop schema if exists MovieBooking;
create schema MovieBooking;
use MovieBooking;
set foreign_key_checks = 0 ;
drop table if exists users;
drop table if exists admin;
drop table if exists manager;
drop table if exists comments;
set foreign_key_checks = 1;
create table users(
	
    id int NOT NULL auto_increment,
    primary key(id),
    first_name varchar(255),
    last_name varchar(255) NOT NULL,
    user_name varchar(255),
    password varchar(255),
    email varchar(255),
    phone varchar(255),
    dob date

);

Insert into users values(default,'alice','alice','alice','alice','alice@gmail.com','123-123-1234','2020-12-12');
Insert into users values(default,'bob','bob','bob','bob','bob@gmail.com','123-123-1234','2020-12-12');


create table admin(
	
    id int NOT NULL auto_increment,
    primary key(id),
    user_name varchar(255),
    password varchar(255)

);

Insert into admin(user_name,password) values ('admin','admin');

create table manager(

	id int NOT NULL auto_increment,
    primary key(id),
    first_name varchar(255),
    last_name varchar(255) NOT NULL,
    user_name varchar(255),
    password varchar(255),
    email varchar(255),
    phone varchar(255),
    dob date

);

Insert into manager values(default,'manager','manager','manager','manager','manager@gmail.com','123-123-1234','2020-12-12');
Insert into manager values(default,'charlie','charlie','charlie','charlie','charlie@gmail.com','123-123-1234','2020-12-12');
Insert into manager values(default,'dan','dan','dan','dan','dan@gmail.com','123-123-1234','2020-12-12');

create table movie(
	
    id int not null auto_increment,
    unique key(id),
    movie_name varchar(255) not null,
    primary key(movie_name),
    movie_time enum('12 PM','5 PM','9 PM'),
	details varchar(255),
    genre varchar(255)

);

insert into movie values (default,'Thor','12 PM','Release 2016','Action');
insert into movie values (default,'Iron Man','5 PM','Release 2015','Action');
insert into movie values (default,'Interstellar','9 PM','Release 2018','Sci-fi');
insert into movie values (default,'Hulk','12 PM','Release 2017','Comedy');
insert into movie values (default,'Iron Man 3','5 PM','Release 2019','Action');

create table tickets(

	id int not null auto_increment,
    primary key(id),
    user_name varchar(255),
    no_of_tickets varchar(255) default 1,
    ticket_type enum('Standard','Gold','Platinum'),
    seat_no int,
    section varchar(255),
    movie_name varchar(255),
    movie_time varchar(255),
    -- constraint ticket_user_generalization foreign key(user_name) references users(user_name),
	constraint ticket_movie_name_generalization foreign key(movie_name) references movie(movie_name)
    on update cascade on delete cascade
-- 	constraint ticket_movie_time_generalization foreign key(movie_time) references movie(movie_time)
	
);

insert into tickets values (default,'alice',default,'Standard',1,'a','Thor','12 PM');

create table comments(
	
    id int not null auto_increment,
    primary key (id),
    user_name varchar(255),
    comments varchar(255)
    
);

insert into comments values(default,'alice','Nice Threatre');




