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