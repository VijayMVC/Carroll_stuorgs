USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMemberType]    Script Date: 02/08/2013 09:56:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMemberType]
	-- Add the parameters for the stored procedure here
	@Member_ID int,
	@MemberName varchar(20),
	@Description varchar(max),
	@AddDate nvarchar(20),
	@EndDate nvarchar(20),
	@BoardMember bit
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here    
    /*VSHIELY - Passing and converting strings into dates for convenience*/
    
	UPDATE MemberType 
	SET MemberName=@MemberName, Description=@Description, AddDate=CONVERT(datetime,@AddDate), EndDate=CONVERT(datetime,@EndDate), BoardMember=@BoardMember
	FROM MemberType WHERE Member_ID=@Member_ID
	
	if @@ERROR<>0
		BEGIN 
		raiserror('102',16,1)
		return -102;
		END
		
	else return 0;
END 
GO

