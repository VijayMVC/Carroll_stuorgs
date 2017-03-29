USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_Report_ActiveUsers]    Script Date: 02/08/2013 09:53:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_Report_ActiveUsers]
	-- Add the parameters for the stored procedure here
	@Include_Inactive char(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	select  User_ID as UserName
			, Firstname
			, Lastname
			, coalesce(Email,'') as EmailAddress
			, coalesce(Phone,'') as PhoneNumber
			, Role_Name
			, case when Is_Active = 1 then 'Y' else 'N' end Active
			, case when exists(select * from UserOrgs 
								where UserOrgs.User_ID = Users.User_ID 
								and UserOrgs.inactive_date is null) 
				then (select convert(varchar(2), count(*)) from UserOrgs 
						where UserOrgs.User_ID = Users.User_ID 
						and UserOrgs.inactive_date is null)
				else '' end LimitedOrgCount
	from Users
	inner join Roles on Users.Role_ID = Roles.Role_ID
	where ((@Include_Inactive = 'N' AND Is_Active = 1)
			OR @Include_Inactive = 'Y')
	order by Role_Name, User_ID
	
	if @@ERROR<>0
	BEGIN 
		RaisError('100', 16, 1)
		RETURN -100;
	END
		
	else return 0;
	
END

GO

