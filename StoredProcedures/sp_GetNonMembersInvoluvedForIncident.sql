USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetNonMembersInvoluvedForIncident]    Script Date: 02/08/2013 09:47:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetNonMembersInvoluvedForIncident]
	-- Add the parameters for the stored procedure here
	@IncidentID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT NonMemberName,ID
	FROM NonMembersInvolved	
	WHERE Incident_ID = @IncidentID 
		
if @@ERROR<>0
		BEGIN 
		raiserror('100',16,1)
		return -100;
		END
		
	else return 0;
END 


GO

