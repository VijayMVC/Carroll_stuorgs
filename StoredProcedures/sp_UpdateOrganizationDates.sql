USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_UpdateOrganizationDates]    Script Date: 02/08/2013 09:56:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[sp_UpdateOrganizationDates]
	-- Add the parameters for the stored procedure here
	@Organization_ID int,
	@DateProposed varchar(20),
	@ProposalAccepted varchar(20),
	@ProposalDenied varchar(20),
	@ProposalNotes varchar(MAX),
	@ConstitutionSubmitted varchar(20),
	@ConstitutionApproved varchar(20),
	@ConstitutionDenied varchar(20),
	@ConstitutionUpdated varchar(20),
	@ConstitutionNotes varchar(Max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Organization
	SET DateProposed=Convert(DATETIME ,@DateProposed)
		, ProposalAccepted=Convert(DATETIME ,@ProposalAccepted)
		, ProposalDenied=Convert(DATETIME ,@ProposalDenied)
		, ProposalNotes=@ProposalNotes
		, ConstitutionSubmitted=Convert(DATETIME ,@ConstitutionSubmitted)
		, ConstitutionAccepted=Convert(DATETIME ,@ConstitutionApproved)
		, ConstitutionDenied=Convert(DATETIME ,@ConstitutionDenied)
		, ConstitutionUpdated=Convert(DATETIME ,@ConstitutionUpdated)
		,  ConstitutionNotes=@ConstitutionNotes
	FROM Organization WHERE Organization_ID=@Organization_ID

if @@ERROR<>0
		BEGIN 
		raiserror('102',16,1)
		return -102;
		END
		
	else return 0;
END 

GO

