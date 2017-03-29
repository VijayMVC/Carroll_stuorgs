USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_GetStudentByName]    Script Date: 02/08/2013 09:50:39 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,2016-07-18>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_GetStudentByName]
	-- Add the parameters for the stored procedure here
	@LastName varchar(20),
	@FirstName varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	declare @lname varchar(21), @fname varchar(21);
	
	select @lname = rtrim(ltrim(lower(@LastName)));
	select @fname = rtrim(ltrim(lower(@FirstName)));

	IF @lname = '' AND @fname = ''
	BEGIN
		SELECT LastName,FirstName,Email,Carroll_ID,Student_ID
		FROM Student
		WHERE Student_ID = -1
	END

	IF @lname != '' AND @fname != ''
	BEGIN
			-- Insert statements for procedure here
		SELECT LastName,FirstName,Email,Carroll_ID,Student_ID
		FROM Student	
		WHERE (charindex(@lname,Student.LastName) > 0)
			AND (charindex(@fname,Student.FirstName) > 0)
		ORDER BY LastName, FirstName
	END

	IF @lname = '' AND @fname != ''
	BEGIN
		-- Insert statements for procedure here
		SELECT LastName,FirstName,Email,Carroll_ID,Student_ID
		FROM Student	
		WHERE (charindex(@fname,Student.FirstName) > 0)
		ORDER BY LastName, FirstName
	END

	IF @lname != '' AND @fname = ''
	BEGIN
			-- Insert statements for procedure here
		SELECT LastName,FirstName,Email,Carroll_ID,Student_ID
		FROM Student	
		WHERE (charindex(@lname,Student.LastName) > 0)
		ORDER BY LastName, FirstName
	END
	
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 
GO
