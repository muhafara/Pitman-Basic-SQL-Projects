create Procedure dbo_all_borrowers_not_check_out

As

SELECT

	a1.Name
	FROM Borrower a1
	LEFT JOIN Book_Loans a2 ON a2.CardNo = a1.CardNo
	WHERE a2.CardNo IS NULL