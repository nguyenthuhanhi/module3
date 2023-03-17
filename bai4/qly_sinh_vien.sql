create database bai4_qlsv;
use bai4_qlsv;

create table class(
	id int not null primary key auto_increment,
    `name` varchar(60) not null,
    start_date datetime not null,
    `status` bit 
);

create table student(
	id int not null primary key auto_increment,
    `name` varchar(30) not null,
    address varchar(50) ,
    phone varchar (20),
    `status` bit ,
    class_id int not null,
    foreign key (class_id)references class(id)
    
);

create table `subject`(
	id int not null primary key auto_increment,
    `name` varchar(30) not null,
    credit tinyint not null default 1 check (credit >=1 ) ,
    `status` bit default 1
);

create table mark (
	id int not null primary key auto_increment,
    subject_id int not null  ,    -- unique
    foreign key (subject_id) references `subject`(id),
    student_id int not null  ,	 -- unique
    foreign key (student_id) references student(id),
    mark float default 0 check(0<=mark<=100),
    exam_times tinyint default 1
);

insert into class
value(1, 'A1', '2008-12-20', 1);
insert into class
value(2, 'A2', '2008-12-22', 1);
insert into class
value(3, 'B3', current_date, 0);

insert into student (`name`,address,phone,`status`,class_id)
value ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (`name`,address,`status`,class_id)
value ('Hoa', 'Hai phong', 1, 1);
insert into student (`name`,address,phone,`status`,class_id)
value ('Manh', 'HCM', '0123123123', 0, 2);

insert into `subject`
value (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

insert into mark (subject_id, student_id, mark, exam_times)
value (1, 1, 8, 1);
insert into mark (subject_id, student_id, mark, exam_times)
value (1, 2, 10, 2);  -- loi unique duy nhat
insert into mark (subject_id, student_id, mark, exam_times)
value (2, 1, 12, 1);

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student 
where `name` like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class 
where start_date like '%12%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from `subject`
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update  student set class_id = 2 where id =1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.`name`,sub.`name`,mark from student s
join `mark` m on s.id=m.student_id
join `subject` sub on sub.id= m.subject_id
order by m.mark desc,s.`name` ;

create database bai3_truy_van_dl_qlsv;
use bai3_truy_van_dl_qlsv;

create table class(
	id int not null primary key auto_increment,
    `name` varchar(60) not null,
    start_date datetime not null,
    `status` bit 
);

create table student(
	id int not null primary key auto_increment,
    `name` varchar(30) not null,
    address varchar(50) ,
    phone varchar (20),
    `status` bit ,
    class_id int not null,
    foreign key (class_id)references class(id)
    
);

create table `subject`(
	id int not null primary key auto_increment,
    `name` varchar(30) not null,
    credit tinyint not null default 1 check (credit >=1 ) ,
    `status` bit default 1
);

create table mark (
	id int not null primary key auto_increment,
    subject_id int not null  ,    -- unique
    foreign key (subject_id) references `subject`(id),
    student_id int not null  ,	 -- unique
    foreign key (student_id) references student(id),
    mark float default 0 check(0<=mark<=100),
    exam_times tinyint default 1
);

insert into class
value(1, 'A1', '2008-12-20', 1);
insert into class
value(2, 'A2', '2008-12-22', 1);
insert into class
value(3, 'B3', current_date, 0);

insert into student (`name`,address,phone,`status`,class_id)
value ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (`name`,address,`status`,class_id)
value ('Hoa', 'Hai phong', 1, 1);
insert into student (`name`,address,phone,`status`,class_id)
value ('Manh', 'HCM', '0123123123', 0, 2);

insert into `subject`
value (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

insert into mark (subject_id, student_id, mark, exam_times)
value (1, 1, 8, 1);
insert into mark (subject_id, student_id, mark, exam_times)
value (1, 2, 10, 2);  -- loi unique duy nhat
insert into mark (subject_id, student_id, mark, exam_times)
value (2, 1, 12, 1);

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student 
where `name` like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class 
where start_date like '%12%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from `subject`
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update  student set class_id = 2 where id =1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.`name`,sub.`name`,mark from student s
join `mark` m on s.id=m.student_id
join `subject` sub on sub.id= m.subject_id
order by m.mark desc,s.`name` ;


create database bai3_truy_van_dl_qlsv;
use bai3_truy_van_dl_qlsv;

create table class(
	id int not null primary key auto_increment,
    `name` varchar(60) not null,
    start_date datetime not null,
    `status` bit 
);

create table student(
	id int not null primary key auto_increment,
    `name` varchar(30) not null,
    address varchar(50) ,
    phone varchar (20),
    `status` bit ,
    class_id int not null,
    foreign key (class_id)references class(id)
    
);

create table `subject`(
	id int not null primary key auto_increment,
    `name` varchar(30) not null,
    credit tinyint not null default 1 check (credit >=1 ) ,
    `status` bit default 1
);

create table mark (
	id int not null primary key auto_increment,
    subject_id int not null  ,    -- unique
    foreign key (subject_id) references `subject`(id),
    student_id int not null  ,	 -- unique
    foreign key (student_id) references student(id),
    mark float default 0 check(0<=mark<=100),
    exam_times tinyint default 1
);

insert into class
value(1, 'A1', '2008-12-20', 1);
insert into class
value(2, 'A2', '2008-12-22', 1);
insert into class
value(3, 'B3', current_date, 0);

insert into student (`name`,address,phone,`status`,class_id)
value ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (`name`,address,`status`,class_id)
value ('Hoa', 'Hai phong', 1, 1);
insert into student (`name`,address,phone,`status`,class_id)
value ('Manh', 'HCM', '0123123123', 0, 2);

insert into `subject`
value (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

insert into mark (subject_id, student_id, mark, exam_times)
value (1, 1, 8, 1);
insert into mark (subject_id, student_id, mark, exam_times)
value (1, 2, 10, 2);  -- loi unique duy nhat
insert into mark (subject_id, student_id, mark, exam_times)
value (2, 1, 12, 1);


-- bài tập 1 bài 3: Thao tác CSDL QLSV
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student 
where `name` like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from class 
where start_date like '%12%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from `subject`
where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update  student set class_id = 2 where id =1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.`name`,sub.`name`,mark from student s
join `mark` m on s.id=m.student_id
join `subject` sub on sub.id= m.subject_id
order by m.mark desc,s.`name` ;


-- bài th2 bài 3: Truy vấn dữ liệu với CSDL Quản lý sinh viên
-- Hiển thị danh sách tất cả các học viên
select * from student;

-- Hiển thị danh sách các học viên đang theo học.
select * from student
where `status`= true;

-- Hiển thị danh sách các môn học có thời gian học nhỏ hơn 10 giờ.
select * from `subject`
where credit <10;

-- Hiển thị danh sách học viên lớp A1
select * from student s
join class c on c.id=s.class_id
where class_id=1;

-- Hiển thị điểm môn CF của các học viên.
select * from `mark` m
join `subject` sub on sub.id=m.subject_id
where sub.`name` ='CF';

-- bài th bài 4: Sử dụng các hàm thông dụng trong SQL
-- Hiển thị số lượng sinh viên ở từng nơi
select address, count(address) as sl from student  
group by address;

-- Tính điểm trung bình các môn học của mỗi học viên
select s.id, avg(mark) as trung_binh from student s
join `mark` m on s.id=m.student_id
group by s.id;



-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select s.id, s.`name`, avg(mark) as tb from student s
join `mark` m on s.id=m.student_id
group by s.id, s.`name`
having tb > 15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select s.id, s.`name`, avg(mark) as trung_binh from student s
join `mark` m on s.id=m.student_id
group by s.id, s.`name`
having trung_binh >= all(select avg(mark) from student s
join `mark` m on s.id=m.student_id
group by s.id);

-- BAI 4: Luyện tập các hàm thông dụng trong SQL
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from `subject`
where credit= (select max(credit) from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from `subject` s
join `mark` m on s.id=m.subject_id
where mark= (select max(mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.id, avg(mark) from student s
join mark m on s.id= m.student_id
group by s.id
order by avg(mark) desc;
