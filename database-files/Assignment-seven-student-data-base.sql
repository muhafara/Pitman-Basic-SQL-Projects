/*Assignment 7*/
create database School_Management_Assignment;
use School_Management_Assignment;

create table tbl_teacher(
	teacher_id int primary key not null identity (13103,1),
	teacher_fname varchar (50) not null,
	teacher_lname varchar (50) not null,
);

insert into tbl_teacher (teacher_fname, teacher_lname)
			values
		('John','Smith'),
		('Matthew','Jones'),
		('Ben','Richard'),
		('Allen','Nick'),
		('Alexander','brown')
;

select * from tbl_teacher;

create table tbl_student(
		student_id int primary key not null identity (1000,1),
		student_fname varchar (50) not null,
		student_lname varchar (50) not null,
		student_subjects varchar (50) not null,
		teacher_reference int not null foreign key references tbl_teacher(teacher_id) on update cascade on delete cascade
);

insert into tbl_student
	(student_fname, student_lname, student_subjects, teacher_reference)
	values
	('James','Smiths','Mathematics', 13104),
	('Maria','Garcia','English', 13106),
	('Robert','Smith','Geography', 13103),
	('Maria','Hernandez','Chemistry',13107),
	('David','Jones','Physics',13105)
;

select * from tbl_student;


SELECT tbl_student.student_fname, tbl_student.student_lname, tbl_student.student_subjects, tbl_teacher.teacher_fname, tbl_teacher.teacher_lname 
FROM tbl_student
INNER JOIN tbl_teacher ON tbl_student.teacher_reference=tbl_teacher.teacher_id
where student_fname = 'Maria';
