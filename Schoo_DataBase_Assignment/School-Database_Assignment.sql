create database School;

use School;

--------------------Creating table (Classes)--------------------------------------------------

create table Classes (
	Class_ID int primary key not null,
	Class_Name varchar (30) not null
);
--------------------------------------------------------------------------------------------

--------------------Creating table (Students)--------------------------------------------------

create table Students (
	Student_ID int primary key not null,
	Student_Name varchar (30) not null
);
--------------------------------------------------------------------------------------------

--------------------Creating table (Instructors)--------------------------------------------------

create table Instructors (
	Instructor_ID int primary key not null,
	Instructor_Name varchar (30) not null
);
--------------------------------------------------------------------------------------------

----------Altering table (Students by adding Class_ID and Instructor_ID)------------------
Alter table Students
		add 
Class_ID int,
Instructor_ID int;

-------------------------------------------------------------------------------------------

----------Altering table (Students by adding Class_ID and Instructor_ID as a foreign key)------------------
Alter table Students
		add
Class_ID int not null constraint fk_Class_ID foreign key references Classes (Class_ID) on update cascade on delete cascade,
Instructor_ID int not null constraint fk_Instructor_ID foreign key references Instructors (Instructor_ID) on update cascade on delete cascade
;

--------------------------------------------------------------------------------------------------------------

----------------------------------------Populating class table with two classes------------------
insert into Classes(Class_ID,Class_Name)
				values
(1,'Software Develoer BootCamp'),
(2,'C# BootCamp')
;

select * from Classes;

--------------------------------------------------------------------------------------------------------------

----------------------------------------Populating instructor table with two instructor namr------------------
insert into Instructors(Instructor_ID,Instructor_Name)
				values
(1,'Lee'),
(2,'Nick')
;

select * from Instructors;

--------------------------------------------------------------------------------------------------------------



----------------------------------------Populating Student table---------------------------------------
insert into Students(Student_ID,Student_Name,Class_ID,Instructor_ID)
				values
(100,'Emily',1,2),
(101,'Chloe',2,1),
(102,'Megan',1,2),
(103,'John',2,1),
(104,'Daniel',1,2),
(105,'Andrew',2,1)
;

select * from Students;

--------------------------------------------------------------------------------------------------------------

----------------------------------------Displaying all Instructor Name---------------------------------------

select * from Instructors; 

select Instructor_Name
from Instructors;

--------------------------------------------------------------------------------------------------------------

----------------------------------------Displaying all student name in alphabetic order---------------------------------------

select * from Students
order by Student_Name; 

select Student_Name from Students
				order by
Student_Name;

--------------------------------------------------------------------------------------------------------------

----------------------------------------Displaying all classes with students and instructor assigned to it---------------------------------------

SELECT Classes.Class_Name, Students.Student_Name, Instructors.Instructor_Name
FROM Students
INNER JOIN Classes ON Classes.Class_ID = Students.Class_ID
INNER JOIN Instructors ON Instructors.Instructor_ID = Students.Instructor_ID
order by Class_Name;

--------------------------------------------------------------------------------------------------------------