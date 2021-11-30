
create procedure dbo_get_barrowers_name_have_not_checkout_library

As

select Name 
from Borrower B
where
Not Exists (select * from Book_Loans L
where B.CardNo=L.CardNo);
