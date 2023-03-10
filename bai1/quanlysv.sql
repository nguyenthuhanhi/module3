create database student_management;
use student_management;
create table class(
    id_class INT NOT NULL,
	name_class varchar(50)
);

create table teacher(
	id_teacher  INT NOT NULL,
	name_teacher varchar(50),
    age INt not null,
    country varchar(30)
);