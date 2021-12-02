Hi instructor,

In response to my Assignment "Final Project - Library Management System Project"
-----------------------------------------------------------------------------------------------------------------------------------------------
Error # 1:
First, I get an error when I run the insert statement for the Book_Loans table. It looks like you've put in some CardNo values that don't exist in the Borrowers table. 
You'll need to make sure that the only values that you insert are values that were created with the table initially. 
Error Fixed: 
--Error first cardno doesnot exist--Fixed by replacing cardno to CardNo (Now it has refrence to borrower table)
-----------------------------------------------------------------------------------------------------------------------------------------------

Error # 2:

The last thing that needs to be fixed is the first Inner Join in your second query. 
It looks like you are equating two columns that don't share a PK/FK relationship, which is going to prevent the correct information from being returned. 
Error Fixed:
I think I was Book_Copies.Number_Of_Copies in first inner join and as you said it doesn't share pk/fk and thats why it preventing from correct information to be retrived.
--FIX-- As Book_Copies have foreign key from Book table and I have changed this Book_Copies.Number_Of_Copies to Book_Copies.BookID.
Hopefully, it will fix the error.

------------------------------------------------------------------------------------------------------------------------------------------------
Error # 3:

On this same note, you will need to create a borrower who does not have any books checked out, meaning they should not appear on the Book Loans table. This will ensure that your third query returns some information. 

I have provided two solution for this query but I'm still not sure if its works. Please provide me with some help in case.

If you find any error could you please mention it with line number it will really help me.

Thanks in advance..
