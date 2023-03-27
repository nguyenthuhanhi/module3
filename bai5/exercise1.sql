SELECT * FROM demo.products;
-- B3
-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX products_code_index
ON products (product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX product_name_product_price
ON products (product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products 
where product_code="sp_01";

-- So sánh câu truy vấn trước và sau khi tạo index

-- B4
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view  thong_tin 
as 
select product_code, product_name, product_price, product_status
from products;
select * from thong_tin;
-- Tiến hành sửa đổi view
update thong_tin
set product_name ="điều hòa"
where product_code ="sp_02";

-- Tiến hành xoá view
drop view thong_tin;

-- B5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
DELIMITER //
CREATE PROCEDURE store_procedure ()
BEGIN
SELECT *
FROM products;
END //
DELIMITER ;
-- Tạo store procedure thêm một sản phẩm mới
DELIMITER //
CREATE PROCEDURE add_product (p_code varchar(45), p_name varchar(45),p_price double, p_amount int, p_description varchar(45),p_status tinyint)
BEGIN
insert into products (product_code , product_name ,product_price , product_amount , product_description ,product_status)
value (p_code,p_name,p_price,p_amount,p_description,p_status);
END //
DELIMITER ;
call add_product("sp_05","điện thoại",18000,2,"còn hàng",1);
-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
CREATE PROCEDURE update_product (p_id int ,p_code varchar(45), p_name varchar(45),p_price double, p_amount int, p_description varchar(45),p_status tinyint)
BEGIN
update products set product_code=p_code, product_name=p_name ,product_price=p_price , product_amount=p_amount , product_description=p_description ,product_status=p_status
where id=p_id;
END //
DELIMITER ;

call update_product(1,'sp_01','tủ quần áo',5000,4,'còn hàng',1);
-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
CREATE PROCEDURE delete_product (p_id int )
BEGIN
delete from products where id=p_id;
END //
DELIMITER ;
call delete_product(7);
