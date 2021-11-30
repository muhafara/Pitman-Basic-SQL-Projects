-------------------------------Creating Database Libraray_management_System-----------------------------------
create database Library_Management_System_Project;

use Library_Management_System_Project;
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

-----------------------Creating table Authors---Inserting data--------------------------------------------------------------------------------
create table Book_Authors (
BookID int not null constraint fk_Book_ID_Book_Aurthors foreign key references Books(BooksID) on update cascade on delete cascade,
AurthorName varchar (30) not null
);

--inserting data 

insert into Book_Authors (BookID, AurthorName)
				Values
(1,'ASD'),
(2,'DSA'),
(3,'QWE'),
(4,'EWQ'),
(5,'RTY'),
(6,'YTR'),
(7,'EWQ'),
(8,'QWE'),
(9,'POI'),
(10,'POI'),
(11,'RTY'),
(12,'DSA'),
(13,'CXZ'),
(14,'ASD'),
(15,'QWE'),
(16,'EWQ'),
(17,'RTY'),
(18,'YTR'),
(19,'DSA'),
(20,'ASD')
;

select * from Book_Authors;
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

-----------------------Creating table Book_Loans----inserting data-------------------------------------------------------------------------------
create table Book_Loans (
BookID int not null constraint fk_Book_ID_Book_Loans foreign key references Books(BooksID) on update cascade on delete cascade,
BranchID int not null constraint fk_Branch_ID_Book_loans foreign key references Library_Branch(BranchID) on update cascade on delete cascade,
CardNo int not null constraint fk_Branch_ID_Card_Loans foreign key references Borrower(cardNo) on update cascade on delete cascade,
DateOut date not null,
DateDue date not null
);

--inserting data

insert into Book_Loans (BookID, BranchID, CardNo, DateOut,DateDue)
						values
(1,1001, 12345, '2021-11-23', '2021-12-23'),
(2,1002, 12346, '2021-11-15', '2021-12-23'),
(3,1003, 12347, '2021-11-09', '2021-12-23'),
(4,1004, 12348, '2021-11-08', '2021-12-23'),
(5,1005, 12349, '2021-11-01', '2021-12-23'),
(6,1006, 12350, '2021-11-02', '2021-12-23'),
(7,1005, 12351, '2021-11-01', '2021-12-23'),
(8,1005, 12352, '2021-11-01', '2021-12-23'),
(9,1005, 12353, '2021-11-01', '2021-12-23'),
(10,1005, 12354, '2021-11-01', '2021-12-23'),
(11,1001, 12355, '2021-11-23', '2021-12-23'),
(12,1002, 12356, '2021-11-15', '2021-12-23'),
(13,1003, 12357, '2021-11-09', '2021-12-23'),
(14,1004, 12358, '2021-11-08', '2021-12-23'),
(15,1005, 12359, '2021-11-01', '2021-12-23'),
(16,1006, 12360, '2021-11-02', '2021-12-23'),
(17,1005, 12351, '2021-11-01', '2021-12-23'),
(18,1005, 12352, '2021-11-01', '2021-12-23'),
(19,1005, 12353, '2021-11-01', '2021-12-23'),
(20,1005, 12360, '2021-11-01', '2021-12-23')
;

select * from Book_Loans;

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

-----------------------------Stored procedure-----How may copies of the book titled "The lost tribe" are pwned by the library branch whose name is sharpstown----------------
--Stoed procedure to check check number of copies book titled 'The last tribe'in branch 'shapstown'
-- As No book titled as mention in the branch was found so number of copies is 0
EXEC dbo_Number_of_Copies;

-----------Stored procedure----------How many copies of the book titled "The Lost Tribe" are owned by each library branch?------------------------------------------------------

Exec dbo_return_Number_of_copies_by_each_Library_branch;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select * from Borrower;

select * from Book_Loans;
