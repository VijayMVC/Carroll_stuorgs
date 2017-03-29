USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateUser]    Script Date: 02/08/2013 09:58:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateUser]
	-- Add the parameters for the stored procedure here
	@LastName varchar(20),
	@FirstName varchar(20),
	@Password varchar(20),
	@UserId varchar(20),
	@IsActive bit,
	@RoleID int,
	@Phone varchar(15),
	@Email varchar(254)
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--5.23.2016. Added some basic data validation/clean up and added new fields
	select  @LastName = ltrim(rtrim(@LastName)),
			@FirstName = ltrim(rtrim(@FirstName)),
			@Password = ltrim(rtrim(@Password)),
			@UserId = ltrim(rtrim(@UserId)),
			@Phone = ltrim(rtrim(@Phone)),
			@Email = ltrim(rtrim(@Email))

	IF (@LastName is null OR @LastName = '') OR (@FirstName is null OR @FirstName = '') --Can't have a blank name
	BEGIN
		raiserror('100',16,1)
		return -100;
	END
	
	IF (@Password is null OR @Password = '') --Can't have a blank password.
	BEGIN
		raiserror('101',16,1)
		return -101;
	END
			
	IF @Phone = ''
		select @Phone = null
	
	IF @Email = ''
		select @Email = null

    -- Insert statements for procedure here
	--5.23.2016, removed the ability to update the User_ID field. 
	UPDATE Users 
	SET LastName = coalesce(@LastName,LastName), 
		FirstName = coalesce(@FirstName,FirstName), 
		Password = coalesce(@Password,Password), 
		Is_Active = coalesce(@IsActive,Is_Active),
		Role_ID = coalesce(@RoleID,Role_ID),
		Phone = @Phone, --can't coalesce this, as blanking it out is the only way to remove it
		Email = @Email --can't coalesce this, as blanking it out is the only way to remove it
	FROM Users 
	WHERE User_ID = @UserId
	
	if @@ERROR<>0
	BEGIN 
		raiserror('102',16,1)
		return -102;
	END
		
	else return 0;
END 

GO

