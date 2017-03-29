USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateMyOrgEventCosts]    Script Date: 07/28/2016 09:56:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Shannon>
-- Create date: <Create Date,,07/28/2016>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateMyOrgEventCosts]
	-- Add the parameters for the stored procedure here
	@Event_ID int,
	@VanRental varchar(10),
	@BusRental varchar(10),
	@Dollars varchar(18),
	@DollarsByPartner varchar(18)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [StudentOrgs].[dbo].[OrgEvent]
	SET [DollarsSpentByOrg] = Convert(decimal(18,2),@Dollars)
	  ,[DollarsSpentByPartner]=Convert(decimal(18,2),@DollarsByPartner)
	  ,[VanRental] = Convert(Int,@VanRental)
	  ,[BusRental] = Convert(Int,@BusRental)
	WHERE Event_ID = @Event_ID
 
	if @@ERROR<>0
	BEGIN 
		raiserror('100',16,1)
		return -100;
	END
		
	else return 0;
END 

GO

