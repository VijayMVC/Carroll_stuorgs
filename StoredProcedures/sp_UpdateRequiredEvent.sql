USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateRequiredEvent]    Script Date: 02/08/2013 09:57:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateRequiredEvent]
	-- Add the parameters for the stored procedure here
	@RequiredEvent varchar(50),
	@EventDescription varchar(MAX),
	@AddDate nvarchar(20),
	@RequiredEvent_ID int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE RequiredEvents 
	SET RequiredEvent=@RequiredEvent, EventDescription=@EventDescription, AddDate=CONVERT(datetime,@AddDate)
	FROM RequiredEvents WHERE RequiredEvent_ID=@RequiredEvent_ID
	
	if @@ERROR<>0
		BEGIN 
		raiserror('102',16,1)
		return -102;
		END
		
	else return 0;
END 

GO

