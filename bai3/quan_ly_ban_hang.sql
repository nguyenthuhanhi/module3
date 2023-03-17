create database bai3_quan_ly_ban_hang;
use bai3_quan_ly_ban_hang;

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

insert into customer
value	(1, 'Minh Quan', 10),
		(2, 'Ngoc Oanh', 20),
        (3, 'Hong Ha', 50);
-- select * from customer;
insert into `order` (id,customer_id,`date`)
value (1,1,'2006-03-21'),
	  (2,2,'2006-03-23'),
      (3,1,"2006-03-16");
-- select * from `order`;
insert into product
value (1,'may giat',3),
	  (2,'tu lanh',5),
      (3,'dieu hoa',7),
      (4,'quat',1),
      (5,'bep dien',2);
-- select * from product;
insert into order_detail
value (1,1,3),
	  (1,3,7),
      (1,4,2),
      (2,1,1),
      (3,1,8),
      (2,5,4),
      (2,3,3);
-- select * from order_detail;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select id,`date`,total_price from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.id, c.`name`, c.age, p.`name`, od.quantity, p.price from customer c
join `order` o on c.id=o.customer_id
join order_detail od on od.order_id=o.id
join product p on p.id=od.product_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * from customer c
left join `order` o on c.id=o.customer_id
where o.id is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
select o.id,o.`date`, sum(od.quantity*p.price) as gia_ban from `order` o
join `order_detail` od on o.id= od.order_id
join `product` p on p.id= od.product_id
group by o.id;





