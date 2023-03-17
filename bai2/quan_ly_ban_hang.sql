create database bai2_quan_ly_ban_hang;
use bai2_quan_ly_ban_hang;

create table customer (
 id int primary key,
 `name` varchar(25) not null,
 age tinyint 
);

create table `order`(
	id int primary key,
	customer_id int,
    foreign key (customer_id)references customer(id),
    `date` datetime,
    total_price int
);

create table product(
	id int primary key,
    `name` varchar (25),
    price int
);

create table order_detail(
	order_id int,
    foreign key (order_id)references `order`(id),
    product_id int,
    foreign key (product_id)references product(id),
    quantity int
);

