print 'Custom Trigger tIUD_Roles'
go

If Exists(Select name
From sysobjects
Where name='tIUD_Roles'
And (type= 'TR')
And uid = User_id('dbo'))
Drop Trigger dbo.tIUD_Roles
go

Create Trigger dbo.tIUD_Roles
   On dbo.Roles
   for Insert, Update, Delete
   Not for Replication
As
Begin
/**********************************************************
*Trigger Name: tIUD_Roles

select * from tIUD_Roles
Role_Name Role_ID
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
SELECT SUSER_SNAME(), getdate(), 'IN', '<NONE>',inserted.Role_Name +': '+ convert(varchar(6),inserted.Role_ID)
	 ,'Roles' 
FROM inserted 
WHERE NOT EXISTS(select * from deleted where inserted.Role_ID = deleted.Role_ID)

SELECT @errno = @@ERROR
IF @errno <> 0
BEGIN
     SELECT @errmsg = 'Cannot audit adding Role.'
     GOTO error
END

INSERT INTO dbo.AuditTrail 
	(UserID, Date, type, OldValue, NewValue,TableName)
SELECT SUSER_SNAME(),getdate(), 'DL',deleted.Role_Name +': '+ convert(varchar(6),deleted.Role_ID),'<NONE>','Roles'
FROM deleted 
WHERE NOT EXISTS(select * from inserted where inserted.Role_ID = deleted.Role_ID)

SELECT @errno = @@ERROR
IF @errno <> 0
BEGIN
     SELECT @errmsg = 'Cannot audit deleting Role.'
     GOTO error
END

IF UPDATE(Role_Name)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), getdate(), 'UP:Role_Name',  
		convert(varchar(6),deleted.Role_ID) + ': ' + deleted.Role_Name,
		convert(varchar(6),inserted.Role_ID) + ': ' + inserted.Role_Name,'Roles'
	FROM deleted
	INNER JOIN inserted ON inserted.Role_ID = deleted.Role_ID
	WHERE deleted.Role_Name <> inserted.Role_Name

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating RoleName.'
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


