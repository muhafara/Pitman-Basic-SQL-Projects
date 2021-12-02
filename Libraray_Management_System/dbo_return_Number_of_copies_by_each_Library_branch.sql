----------------How many copies of the book titled "The Lost Tribe" are owned by each library branch?--------------------------------------------------------------------------------------
create procedure dbo_return_Number_of_copies_by_each_Library_branch

as

SELECT Books.Title, Book_Copies.Number_Of_Copies, Library_Branch.BranchName
FROM Books
/*
The last thing that needs to be fixed is the first Inner Join in your second query.
t looks like you are equating two columns that don't share a PK/FK relationship, which is going to prevent the correct information from being returned
Hi instructor,
I think I'm using Book_Copies.Number_Of_Copies in first inner join and as you said it doesn't share pk/fk and thats why it preventing from correct information to be retrived.
--FIX-- As Book_Copies have foreign key from Book table and I have changed this Book_Copies.Number_Of_Copies to Book_Copies.BookID.
Hopefully, it will fix the error.
*/
Inner Join Book_Copies on Books.BooksID = Book_Copies.BookID
Inner Join Library_Branch on Library_Branch.BranchID = Book_Copies.BranchID
where Books.Title = 'The Lost Tribe';

