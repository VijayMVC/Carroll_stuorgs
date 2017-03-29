print 'Custom Trigger tIUD_Advisor'
go

If Exists(Select name
From sysobjects
Where name='tIUD_Advisor'
And (type= 'TR')
And uid = User_id('dbo'))
Drop Trigger dbo.tIUD_Advisor
go

Create Trigger dbo.tIUD_Advisor
   On dbo.Advisor
   for Insert, Update, Delete
   Not for Replication
As
Begin
/**********************************************************
*Trigger Name: tIUD_tblAdvisor

select * from tIUD_tblAdvisor
Advisor_ID LastName FirstName Email PhoneNumber OffCampus ProfessionalTitle AdvisorTitle
------------ -------------------------------------------------- --------------------- ----------- --------------- ----------- -------------------------------------------------- -------------- ------------- ------------ ----------- ------------------- -------------- -------------- -------------------- --------- -------------
***********************************************************/
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @errno int,
           @errmsg varchar(255)

SELECT @numrows = @@ROWCOUNT
/* ------------------------- */

INSERT INTO dbo.AuditTrail 
	(UserID, Date, type, OldValue, NewValue,TableName)
SELECT SUSER_SNAME(), getdate(), 'IN', '<NONE>', 
	convert(varchar(6),inserted.Advisor_ID) + ': ' + inserted.LastName + ': '+
		inserted.FirstName + ': '+ inserted.Email + ': '+ inserted.PhoneNumber + ': '+ convert(varchar(4),inserted.OffCampus) + ': '+ inserted.ProfessionalTitle + ': '+ inserted.AdvisorTitle ,'Advisor'
FROM inserted 
WHERE NOT EXISTS(select * from deleted where inserted.Advisor_ID = deleted.Advisor_ID)

SELECT @errno = @@ERROR
IF @errno <> 0
BEGIN
     SELECT @errmsg = 'Cannot audit adding Advisors.'
     GOTO error
END

INSERT INTO dbo.AuditTrail 
	(UserID, Date, type, OldValue, NewValue,TableName)
SELECT SUSER_SNAME(),CURRENT_TIMESTAMP, 'DL', 
convert(varchar(6),deleted.Advisor_ID)+ ': ' + deleted.LastName + ': '+ 
		deleted.FirstName + ': '+ deleted.Email + ': '+ deleted.PhoneNumber + ': '+ convert(varchar(4),deleted.OffCampus) + ': '+ 
		deleted.ProfessionalTitle + ': '+ deleted.AdvisorTitle , 
	'<NONE>','Advisor'
FROM deleted 
WHERE NOT EXISTS(select * from inserted where inserted.Advisor_ID = deleted.Advisor_ID)

SELECT @errno = @@ERROR
IF @errno <> 0
BEGIN
     SELECT @errmsg = 'Cannot audit deleting Advisor.'
     GOTO error
END

IF UPDATE(LastName)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), CURRENT_TIMESTAMP, 'UP:LastName',  
		convert(varchar(6),deleted.Advisor_ID) + ': ' + deleted.LastName,
		convert(varchar(6),inserted.Advisor_ID) + ': ' + inserted.LastName,'Advisor'
	FROM deleted
	INNER JOIN inserted ON inserted.Advisor_ID = deleted.Advisor_ID
	WHERE deleted.LastName <> inserted.LastName

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating LastName.'
		 GOTO error
	END
END

IF UPDATE(FirstName)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), CURRENT_TIMESTAMP, 'UP:FirstName', 
		convert(varchar(6),deleted.Advisor_ID) + ': ' + deleted.FirstName,
		convert(varchar(6),inserted.Advisor_ID) + ': ' + inserted.FirstName,'Advisor'
	FROM deleted
	INNER JOIN inserted ON inserted.Advisor_ID = deleted.Advisor_ID
	WHERE deleted.FirstName <> inserted.FirstName

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating FirstName.'
		 GOTO error
	END
END

IF UPDATE(Email)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(),CURRENT_TIMESTAMP , 'UP:Email', 
		convert(varchar(6),deleted.Advisor_ID) + ': ' + deleted.Email,
		convert(varchar(6),inserted.Advisor_ID) + ': ' + inserted.Email,'Advisor'
	FROM deleted
	INNER JOIN inserted ON inserted.Advisor_ID = deleted.Advisor_ID
	WHERE deleted.Email <> inserted.Email

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating Email.'
		 GOTO error
	END
END

IF UPDATE(PhoneNumber)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), CURRENT_TIMESTAMP , 'UP:PhoneNumber', 
		convert(varchar(6),deleted.Advisor_ID) + ': ' + deleted.PhoneNumber,
		convert(varchar(6),inserted.Advisor_ID) + ': ' + inserted.PhoneNumber,'Advisor'
	FROM deleted
	INNER JOIN inserted ON inserted.Advisor_ID = deleted.Advisor_ID
	WHERE deleted.PhoneNumber <> inserted.PhoneNumber

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating PhoneNumber.'
		 GOTO error
	END
END

IF UPDATE(OffCampus)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), CURRENT_TIMESTAMP , 'UP:OffCampus', 
		convert(varchar(6),deleted.Advisor_ID) + ': ' + convert(varchar(4),deleted.OffCampus),
		convert(varchar(6),inserted.Advisor_ID) + ': ' + convert(varchar(4),inserted.OffCampus),'Advisor'
	FROM deleted
	INNER JOIN inserted ON inserted.Advisor_ID = deleted.Advisor_ID
	WHERE deleted.OffCampus <> inserted.OffCampus

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating OffCampus.'
		 GOTO error
	END
END

IF UPDATE(ProfessionalTitle)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), CURRENT_TIMESTAMP , 'UP:ProfessionalTitle', 
		convert(varchar(6),deleted.Advisor_ID) + ': ' + deleted.ProfessionalTitle,
		convert(varchar(6),inserted.Advisor_ID) + ': ' + inserted.ProfessionalTitle,'Advisor'
	FROM deleted
	INNER JOIN inserted ON inserted.Advisor_ID = deleted.Advisor_ID
	WHERE deleted.ProfessionalTitle <> inserted.ProfessionalTitle

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating ProfessionalTitle.'
		 GOTO error
	END
END

IF UPDATE(AdvisorTitle)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), CURRENT_TIMESTAMP , 'UP:AdvisorTitle', 
		convert(varchar(6),deleted.Advisor_ID) + ': ' + deleted.AdvisorTitle,
		convert(varchar(6),inserted.Advisor_ID) + ': ' + inserted.AdvisorTitle,'Advisor'
	FROM deleted
	INNER JOIN inserted ON inserted.Advisor_ID = deleted.Advisor_ID
	WHERE deleted.AdvisorTitle <> inserted.AdvisorTitle

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating AdvisorTitle.'
		 GOTO error
	END
END


/* -------------------------- */
  RETURN
error:
  RAISERROR @errno @errmsg
  ROLLBACK TRANSACTION
END

GO


