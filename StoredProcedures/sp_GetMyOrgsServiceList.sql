GO
/****** Object:  StoredProcedure [dbo].[sp_GetMyOrgsServiceList]    Script Date: 8/8/2016 5:24:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,5/23/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetMyOrgsServiceList]
	-- Add the parameters for the stored procedure here
	@OrgID varchar(20),
	@Incl_Old varchar(1) = 'N'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	IF @Incl_Old IS NULL
		SELECT @Incl_Old = 'N'

    -- Insert statements for procedure here
	SELECT ServiceProject.ServiceProject_ID,
			ServiceProject.Organization_ID,
			COALESCE(CONVERT(VARCHAR(10), ServiceProject.StartDate, 101),'') StartDate, 
			ServiceProject.OnGoing,
			ServiceProject.Location,
			ServiceProject.Title,
			-- ServiceProject.HoursVolunteered,
			--ServiceProject.Planned_HoursVolunteered
			COALESCE(ServiceProject.Planned_HoursVolunteered,''),
			ServiceProject.CommunityPartner
	FROM ServiceProject
	WHERE ServiceProject.Organization_ID = @OrgID
	AND 
	(COALESCE(ServiceProject.StartDate,getdate()) >= convert(varchar(2),month(getdate())) + '-' + convert(varchar(2),day(getdate())) + '-' + convert(varchar(4),year(getdate()))
		OR 
		@Incl_Old = 'Y'
		)
	ORDER BY ServiceProject.Organization_ID, StartDate, TimeFrom
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
