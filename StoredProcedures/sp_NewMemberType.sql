USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewMemberType]    Script Date: 02/08/2013 09:53:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewMemberType]
	-- Add the parameters for the stored procedure here
	@MemberName varchar(20),
	@Description varchar(Max),
	@AddDate nvarchar(20),
	@EndDate nvarchar(20),
	@BoardMember bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    /*Sree - Passing and converting strings into dates for convenience*/
    
	INSERT INTO MemberType (MemberName, Description,AddDate, EndDate, BoardMember)
	VALUES (@MemberName, @Description, CONVERT(datetime,@AddDate), CONVERT(datetime,@EndDate), @BoardMember)
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END

GO

