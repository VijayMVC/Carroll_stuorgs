USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewEventComments]    Script Date: 02/08/2013 09:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewEventComments]
	-- Add the parameters for the stored procedure here
	@Event_ID int, 
	@Date varchar(20), 
	@Text text,
	@UserID varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @today datetime;
	
	IF @Text is null
		return 0;
		
	IF @Date is null OR rtrim(ltrim(@Date)) = ''
		select @today = getdate()
	ELSE
		select @today = CONVERT(datetime,@Date)

    -- Insert statements for procedure here
	INSERT INTO EventComments (Event_ID, Date, text,UserID)
	VALUES (@Event_ID, @today, @Text, @UserID)

	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
	else 
		RETURN 0;
	
END

GO

