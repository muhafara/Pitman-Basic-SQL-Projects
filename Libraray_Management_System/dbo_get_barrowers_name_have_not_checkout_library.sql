/*
select Name from Borrower
where CardNo not in (select CardNo
from  Book_Loans);
*/

create procedure dbo_get_barrowers_name_have_not_checkout_library


/*
Hi instructor,
I dont know I'm still confused with the third query " Retrieve the names of all borrowers who do not have any books checked out."
However, I came up with these two solutions but nothing is retriving any information for me.
*/
As

--------Solution one--------------
SELECT
	a1.Name
	FROM Borrower a1
	LEFT JOIN Book_Loans a2 ON a2.CardNo = a1.CardNo
	WHERE a2.CardNo IS NULL

	--------Solution two--------------

	/*
	  select a.Name
   from Borrower a
   inner join Book_Loans b on b.CardNo = a.CardNo
   where DateDue < CONVERT(date,GETDATE());
   */

  --if none of the solution works please guide me with that. Thanks in advanced.