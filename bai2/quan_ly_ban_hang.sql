create database quan_ly_ban_hang_bai_2;
use quan_ly_ban_hang_bai_2;

create table customer (
 id int primary key,
 `name` varchar(50) not null,
 age int 
);

create table orderr(
	id int primary key,
    `date` date,
    total_price double,
    customer_id int,
    foreign key (customer_id)references customer(id)
);

create table product(
	id int primary key,
    `name` varchar (50),
    price double
);

create table order_detail(
	order_id int,
    foreign key (order_id)references orderr(id),
    product_id int,
    foreign key (product_id)references product(id),
    quantity int
);