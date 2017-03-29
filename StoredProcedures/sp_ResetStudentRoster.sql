USE [StudentOrgs]
GO
/****** Object:  StoredProcedure [dbo].[sp_ResetStudentRoster]    Script Date: 08/15/2016 15:54:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Vinnie Shiely
-- Create date: 11/25/2014
-- Description:	End dates the current term's student roster and flips the term to the next term
-- =============================================
ALTER PROCEDURE [dbo].[sp_ResetStudentRoster]	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Set End Date to current term's student roster to current system date
    UPDATE StudentRoster
    SET EndDate = GETDATE()
    FROM StudentRoster, Term
    WHERE StudentRoster.Session = Term.Session
    AND StudentRoster.Year = Term.Year
    AND EndDate is null;
    
    -- Flip Term
    DECLARE @session varchar(10);
    
    SELECT @session = Session
    FROM Term;
    
    IF (@session = 'SP')
    BEGIN
		UPDATE Term
		SET Session = 'FA';
    END
    ELSE IF (@session = 'FA')
    BEGIN
		UPDATE Term
		SET Session = 'SP',
		Year = CAST(Year as int) + 1
    END
END
