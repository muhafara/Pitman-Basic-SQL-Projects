----------------How many copies of the book titled "The Lost Tribe" are owned by each library branch?--------------------------------------------------------------------------------------
create procedure dbo_return_Number_of_copies_by_each_Library_branch

as

SELECT Books.Title, Book_Copies.Number_Of_Copies, Library_Branch.BranchName
FROM Books
Inner Join Book_Copies on Books.BooksID = Book_Copies.Number_Of_Copies
Inner Join Library_Branch on Library_Branch.BranchID = Book_Copies.BranchID
where Books.Title = 'The Lost Tribe';