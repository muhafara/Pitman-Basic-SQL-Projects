----------------------- How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?---------------------------------
Create Proc dbo_Number_of_Copies

As

Declare @myBook_Title_Name Varchar
Declare @myBook_BranchName Varchar
set @myBook_Title_Name = 'The Lost Tribe'
set @myBook_BranchName = 'Sharpstown'
SELECT Number_Of_Copies
FROM Book_Copies
Inner Join Books on Books.BooksID = Book_Copies.Number_Of_Copies
inner Join Library_Branch on Library_Branch.BranchID = Book_Copies.BranchID
where Books.Title = @myBook_Title_Name And Library_Branch.BranchName = @myBook_BranchName;

---------------------------------------------------------------------------------------------------------------------------------------------------------------

