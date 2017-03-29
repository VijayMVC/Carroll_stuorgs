print 'Custom Trigger tIUD_MemberType'
go

If Exists(Select name
From sysobjects
Where name='tIUD_MemberType'
And (type= 'TR')
And uid = User_id('dbo'))
Drop Trigger dbo.tIUD_MemberType
go

Create Trigger dbo.tIUD_MemberType
   On dbo.MemberType
   for Insert, Update, Delete
   Not for Replication
As
Begin
/**********************************************************
*Trigger Name: tIUD_MemberType

select * from tIUD_MemberType
Member_ID MemberName Description AddDate EndDate BoardMember
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
	convert(varchar(6),inserted.Member_ID) + ': ' + inserted.MemberName + ': ' + inserted.Description + ': '+
	convert(varchar(20),inserted.AddDate) + ': ' + convert(varchar(20),inserted.EndDate) + ': ' + convert(varchar(4),inserted.BoardMember) ,'MemberType' 
FROM inserted 
WHERE NOT EXISTS(select * from deleted where inserted.Member_ID = deleted.Member_ID)

SELECT @errno = @@ERROR
IF @errno <> 0
BEGIN
     SELECT @errmsg = 'Cannot audit adding Member Type.'
     GOTO error
END

INSERT INTO dbo.AuditTrail 
	(UserID, Date, type, OldValue, NewValue,TableName)
SELECT SUSER_SNAME(),getdate(), 'DL',
		convert(varchar(6),deleted.Member_ID) + ': ' + deleted.MemberName + ': ' + deleted.Description  + ': '+
	convert(varchar(20),deleted.AddDate) + ': ' +convert(varchar(20),deleted.EndDate) + ': ' + convert(varchar(2),deleted.BoardMember) , 
	'<NONE>','MemberType'
FROM deleted 
WHERE NOT EXISTS(select * from inserted where inserted.Member_ID = deleted.Member_ID)

SELECT @errno = @@ERROR
IF @errno <> 0
BEGIN
     SELECT @errmsg = 'Cannot audit deleting Member Type.'
     GOTO error
END

IF UPDATE(MemberName)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), getdate(), 'UP:MemberName',  
		convert(varchar(6),deleted.Member_ID) + ': ' + deleted.MemberName,
		convert(varchar(6),inserted.Member_ID) + ': ' + inserted.MemberName,'MemberType'
	FROM deleted
	INNER JOIN inserted ON inserted.Member_ID = deleted.Member_ID
	WHERE deleted.MemberName <> inserted.MemberName

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating MemberName.'
		 GOTO error
	END
END

IF UPDATE(BoardMember)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), getdate(), 'UP:BoardMember',  
		convert(varchar(6),deleted.Member_ID) + ': ' + Convert(varchar(2),deleted.BoardMember),
		convert(varchar(6),inserted.Member_ID) + ': ' + Convert(varchar(2),inserted.BoardMember),'MemberType'
	FROM deleted
	INNER JOIN inserted ON inserted.Member_ID = deleted.Member_ID
	WHERE deleted.BoardMember <> inserted.BoardMember

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating BoardMember.'
		 GOTO error
	END
END

IF UPDATE(Description)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), getdate(), 'UP:AddDate',  
		convert(varchar(6),deleted.Member_ID) + ': ' + deleted.Description,
		convert(varchar(6),inserted.Member_ID) + ': ' + inserted.Description,'MemberType'
	FROM deleted
	INNER JOIN inserted ON inserted.Member_ID = deleted.Member_ID
	WHERE deleted.Description <> inserted.Description

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating Description.'
		 GOTO error
	END
END

IF UPDATE(EndDate)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), getdate(), 'UP:EndDate',  
		convert(varchar(6),deleted.Member_ID) + ': ' + convert(varchar(20),deleted.EndDate),
		convert(varchar(6),inserted.Member_ID) + ': ' +convert(varchar(20),inserted.EndDate),'MemberType'
	FROM deleted
	INNER JOIN inserted ON inserted.Member_ID = deleted.Member_ID
	WHERE deleted.EndDate <> inserted.EndDate

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating AddDate.'
		 GOTO error
	END
END

IF UPDATE(AddDate)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), getdate(), 'UP:Date',  
		convert(varchar(6),deleted.Member_ID) + ': ' + convert(varchar(20),deleted.AddDate),
		convert(varchar(6),inserted.Member_ID) + ': ' +convert(varchar(20),inserted.AddDate),'MemberType'
	FROM deleted
	INNER JOIN inserted ON inserted.Member_ID = deleted.Member_ID
	WHERE deleted.AddDate <> inserted.AddDate

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating EndDate.'
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


