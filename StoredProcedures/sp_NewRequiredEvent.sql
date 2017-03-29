USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewRequiredEvent]    Script Date: 02/08/2013 09:54:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewRequiredEvent]
	-- Add the parameters for the stored procedure here
	@RequiredEvent varchar(50),
	@EventDescription varchar(MAX),
	@AddDate nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO RequiredEvents (RequiredEvent, EventDescription,AddDate)
	VALUES (@RequiredEvent, @EventDescription,CONVERT(datetime,@AddDate))
	
	if @@ERROR<>0
		BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
		END
		
	else return 0;
	
END

GO

