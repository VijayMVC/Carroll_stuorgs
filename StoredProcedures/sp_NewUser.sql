USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_NewUser]    Script Date: 02/08/2013 09:55:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_NewUser]
	-- Add the parameters for the stored procedure here
	@LastName varchar(20),
	@FirstName varchar(20),
	@Password varchar(20),
	@UserId varchar(20),
	@IsActive bit,
	@RoleID int,
	@Phone varchar(15) = NULL,
	@Email varchar(254) = NULL
	
AS
BEGIN
    -- Insert statements for procedure here

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--5.23.2016. Added some basic data validation/clean up and added new fields
	IF @RoleId is null OR NOT EXISTS(select * from dbo.Roles where role_id = @RoleID)
	BEGIN
		select @RoleID = 2
	END
	
	select  @LastName = ltrim(rtrim(@LastName)),
			@FirstName = ltrim(rtrim(@FirstName)),
			@Password = ltrim(rtrim(@Password)),
			@UserId = ltrim(rtrim(@UserId)),
			@Phone = ltrim(rtrim(@Phone)),
			@Email = ltrim(rtrim(@Email))
	
	IF @Phone = ''
		select @Phone = null
	
	IF @Email = ''
		select @Email = null

	INSERT INTO Users (LastName, FirstName, Password, User_ID, Role_ID, Is_Active, Phone, Email)
	VALUES (@LastName, @FirstName,@Password, @UserId, @RoleID, @IsActive, @Phone, @Email)
	
	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
		
	else return 0;
	
END

GO

