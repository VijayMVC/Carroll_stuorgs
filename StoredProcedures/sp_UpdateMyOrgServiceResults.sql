USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMyOrgServiceResults]    Script Date: 08/05/2016 09:57:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,8.5.2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMyOrgServiceResults]
	-- Add the parameters for the stored procedure here
	@Service_ID int,
	@Planned_Volunteers int,
	@Planned_Hours int,
	@Planned_Items varchar(250),
	@Actual_Volunteers int,
	@Actual_Hours int,
	@Actual_Items varchar(250)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE dbo.ServiceProject
	SET NoOfVolunteers = @Actual_Volunteers
	  ,HoursVolunteered = @Actual_Hours
	  ,Funds = @Actual_Items
	  ,Planned_NoOfVolunteers = @Planned_Volunteers
	  ,Planned_HoursVolunteered = @Planned_Hours
	  ,Planned_Funds = @Planned_Items
	WHERE ServiceProject_ID = @Service_ID
 
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

