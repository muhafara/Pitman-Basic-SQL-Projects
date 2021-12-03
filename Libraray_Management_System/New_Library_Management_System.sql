create database New_Libraray_Management_System;

use New_Libraray_Management_System;

--------------------------------------------------------------------------------------------------------------

-----------------------Creating table Library_Branch--Inserting data upto 6 values--------------------------------
create table Library_Branch (
BranchID int primary key not null identity (1001,1),
BranchName varchar (30) not null,
Address varchar (30)
);

--inserting data

insert into Library_Branch (BranchName, Address)
			values
('Basildon Library','12 Pitsea street'),
('Fryens Libraray','14 Fryens street'),
('Laindon Library','18 Laindon street'),
('New York Library','17 New York street'),
('Sharpstown','67 Sharpstowns street'),
('London Library','29 London street')
;

select * from Library_Branch;

--------------------------------------------------------------------------------------------------------------

-----------------------Creating table borrower----Inserting data-------------------------------------------------------------------------------
create table Borrower (
CardNo int primary key not null identity (12345,1),
Name varchar (30) not null,
Address varchar (30) not null
);

--inserting data

insert into Borrower (Name, Address)
			Values
('John','12 main street'),
('Lee','14 New York road'),
('Chloe','18 London road'),
('Merry','12 Manchester road'),
('Natasha','98 Wickford road'),
('Nick','102 Wales'),
('Richard','109 New York Street'),
('Smith','34 Old View town')
;

select * from Borrower;

---------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------

-----------------------Creating table Publisher-----Inserting data------------------------------------------------------------------------------
create table Publisher (
PublisherName varchar (30) primary key not null,
Address varchar (30) not null,
Phone varchar (30) not null
);


--inserting data

insert into Publisher(PublisherName, Address, Phone)
			values
('Rashford','Mountview road', '123-345-098'),
('James','Moonlight street', '323-7654-098'),
('Jayson','Lakeview Road', '128-879-198'),
('Matthew','Sunshire Street', '112-221-998'),
('Kiren','Woodland road', '112-223-332'),
('Paul','Green street','876-654-667'),
('Jonathan','Iford street','776-888-009'),
('Tom','Dehli road','334-443-554'),
('Amy','Stars land road','233-335-445'),
('Elizebth','Seaview road','098-678-456')
;

select * from Publisher;

--------------------------------------------------------------------------------------------------------------

-----------------------Creating table Books---Inserting data--------------------------------------------------------------------------------
create table Books (
BooksID int primary key not null identity (1,1),
Title varchar (30) not null,
PublisherName varchar (30) not null constraint fk_Publisher_Name_Books foreign key references Publisher(PublisherName) on update cascade on delete cascade
);

--inserting data
insert into Books (Title, PublisherName)
				values
('Lolita','Amy'),
('Slaughterhouse-Five','Elizebth'),
('Gone with the Wind','Kiren'),
('Catch-22','James'),
('Animal Farm','Jayson'),
('Lord of the Flies','Jonathan'),
('The Lion,','Kiren'),
('The Great Gatsby','Matthew '),
('The Lost Tribe','James'),
('The History of Tom Jones','Elizebth'),
('The Catcher in the Rye','Amy'),
('The Lord of the Rings','Elizebth'),
('The Brothers Karamazov','Kiren'),
('War and Peace','James'),
('Wuthering Heights','Jayson'),
('Le Père Goriot','Jonathan'),
('David Copperfield','Kiren'),
('Le Père Goriot by Honoré','Matthew'),
('The Red and the Black','James'),
('Pride and Prejudice','Elizebth')
;

select * from Books;


--------------------------------------------------------------------------------------------------------------

-----------------------Creating table Authors---Inserting data--------------------------------------------------------------------------------
create table Book_Authors (
BookID int not null constraint fk_Book_ID_Book_Aurthors foreign key references Books(BooksID) on update cascade on delete cascade,
AurthorName varchar (30) not null
);

--inserting data 

insert into Book_Authors (BookID, AurthorName)
				Values
(1,'Herry Johnson'),
(2,'Harrison Moss'),
(3,'Maria Beth'),
(4,'Sara Adam'),
(5,'Micheal Hussy'),
(6,'Hanna Standing'),
(7,'James Watson'),
(8,'Mitcheal Stark'),
(9,'James Roy'),
(10,'Elizebeth D'),
(11,'Micheal Hussy'),
(12,'Herry Johnson'),
(13,'Sara Adam'),
(14,'Amy Watson'),
(15,'Zara David'),
(16,'Harrison Moss'),
(17,'Hanna Standing'),
(18,'Micheal Hussy'),
(19,'Maria Beth'),
(20,'Herry Johnson')
;

select * from Book_Authors;
--------------------------------------------------------------------------------------------------------------

-----------------------Creating table Book_Copies---Inserting data--------------------------------------------------------------------------------
create table Book_Copies (
BookID int not null constraint fk_Book_ID_Book_Copies foreign key references Books(BooksID) on update cascade on delete cascade,
BranchID int not null constraint fk_Branch_ID_Book_Copies foreign key references Library_Branch(BranchID) on update cascade on delete cascade,
Number_Of_Copies int not null
);

--inserting data 

insert into Book_Copies (BookID, BranchID, Number_Of_Copies)
					Values
(1,1001,2),
(2,1002,4),
(3,1003,7),
(4,1004,5),
(5,1005,3),
(6,1006,8),
(7,1001,8),
(8,1005,2),
(9,1006,2),
(10,1004,5),
(11,1005,7),
(12,1001,4),
(13,1002,7),
(14,1004,9),
(15,1006,10),
(16,1005,13),
(17,1004,5),
(18,1003,9),
(19,1002,2),
(20,1001,8)
;

select * from Book_Copies;

--------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------

-----------------------Creating table Book_Loans----inserting data-------------------------------------------------------------------------------
create table Book_Loans (
BookID int not null constraint fk_Book_ID_Book_Loans foreign key references Books(BooksID) on update cascade on delete cascade,
BranchID int not null constraint fk_Branch_ID_Book_loans foreign key references Library_Branch(BranchID) on update cascade on delete cascade,
--Error first cardno doesnot exist--Fixed by replacing cardno to CardNo (Now it has refrence to borrower table)
CardNo int not null constraint fk_Branch_ID_Card_Loans foreign key references Borrower(CardNo) on update cascade on delete cascade,
DateOut date not null,
DateDue date not null
);

--inserting data

insert into Book_Loans (BookID, BranchID, CardNo, DateOut,DateDue)
						values
(1,1001, 12345, '2021-11-23', '2021-12-23'),
(4,1002, 12346, '2021-11-15', '2021-12-23'),
(6,1003, 12347, '2021-11-09', '2021-12-23'),
(8,1004, 12345, '2021-11-08', '2021-12-23'),
(10,1005, 12351, '2021-11-01', '2021-12-23'),
(11,1006, 12350, '2021-11-02', '2021-12-23'),
(13,1001, 12351, '2021-11-01', '2021-12-23'),
(15,1004, 12352, '2021-11-01', '2021-12-23'),
(17,1002, 12347, '2021-11-01', '2021-12-23'),
(18,1006, 12350, '2021-11-01', '2021-12-23')
;

select * from Book_Loans;

select * from Books;

select * from Library_Branch;

select * from Borrower;

-----------------------------Outer joint---------------------------------------------------------------------------------
SELECT * FROM 
((Book_Loans FULL OUTER JOIN Borrower ON Book_Loans.CardNo = Borrower.CardNo)
FULL OUTER JOIN Books ON Book_Loans.BookID = Books.BooksID)
;

--------------------------------------------------------------------------------------------------------------

----------------------------Query to return all the book title and the author name----------------------------------------------------------------------------------

SELECT Books.Title, Book_Authors.AurthorName
FROM Books
INNER JOIN Book_Authors ON Books.BooksID = Book_Authors.BookID
order by Book_Authors.AurthorName;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------Stored procedure-----How may copies of the book titled "The lost tribe" are owned by the library branch whose name is sharpstown----------------
--Stoed procedure to check check number of copies book titled 'The last tribe'in branch 'shapstown'
-- As No book titled as mention in the branch was found so number of copies is 0
EXEC dbo_Number_of_Copies_owned_by_lib_branch;

-----------Stored procedure----------How many copies of the book titled "The Lost Tribe" are owned by each library branch?------------------------------------------------------

Exec dbo_title_are_owned_by_each_library;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------Stored procedure-------- Retrieve the names of all borrowers who do not have any books checked out------------------------------------------------------

EXEC dbo_all_borrowers_not_check_out;


