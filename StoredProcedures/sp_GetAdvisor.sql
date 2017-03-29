USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetAdvisor]    Script Date: 02/08/2013 09:39:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetAdvisor]
	-- Add the parameters for the stored procedure here
	@LastName varchar(20),
	@FirstName varchar (20),
	@Advisor_ID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT LastName, FirstName, Email, PhoneNumber, OffCampus 
	FROM Advisor
	WHERE Advisor_ID=@Advisor_ID 
	OR LastName=@LastName 
	OR FirstName=@FirstName
	ORDER BY LastName, FirstName
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

