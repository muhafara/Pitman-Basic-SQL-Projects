create procedure dbo_title_are_owned_by_each_library

As

SELECT Books.Title, Book_Copies.Number_Of_Copies, Library_Branch.BranchName
FROM Books
Inner Join Book_Copies on Books.BooksID = Book_Copies.BookID
Inner Join Library_Branch on Library_Branch.BranchID = Book_Copies.BranchID
where Books.Title = 'The Lost Tribe'