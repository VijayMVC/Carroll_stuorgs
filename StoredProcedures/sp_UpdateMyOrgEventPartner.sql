USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMyOrgEventPartner]    Script Date: 07/27/2016 09:57:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,7.27.2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMyOrgEventPartner]
	-- Add the parameters for the stored procedure here
	@Event_ID int,
	@OrganizationWorkedWith varchar(50),
	@ContactName varchar(50),
	@ContactEmail varchar(50),
	@ContactPhone varchar(50),
	@HoursVolunteered varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [StudentOrgs].[dbo].[OrgEvent]
	SET [OrganizationWorkedWith] = @OrganizationWorkedWith
	  ,[ContactPhone] = @ContactPhone
	  ,[ContactEmail] = @ContactEmail
	  ,[ContactName] = @ContactName
	  ,[HoursVolunteered] = Convert(decimal(5,2),@HoursVolunteered)	  
	WHERE Event_ID = @Event_ID
 
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

