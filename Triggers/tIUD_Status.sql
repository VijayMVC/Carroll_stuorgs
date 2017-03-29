print 'Custom Trigger tIUD_Status'
go

If Exists(Select name
From sysobjects
Where name='tIUD_Status'
And (type= 'TR')
And uid = User_id('dbo'))
Drop Trigger dbo.tIUD_Status
go

Create Trigger dbo.tIUD_Status
   On dbo.Status
   for Insert, Update, Delete
   Not for Replication
As
Begin
/**********************************************************
*Trigger Name: tIUD_Status

select * from tIUD_Status
StatusName Status_ID
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
SELECT SUSER_SNAME(), getdate(), 'IN', '<NONE>',inserted.StatusName +': '+ convert(varchar(6),inserted.Status_ID)
	 ,'Status' 
FROM inserted 
WHERE NOT EXISTS(select * from deleted where inserted.Status_ID = deleted.Status_ID)

SELECT @errno = @@ERROR
IF @errno <> 0
BEGIN
     SELECT @errmsg = 'Cannot audit adding Status.'
     GOTO error
END

INSERT INTO dbo.AuditTrail 
	(UserID, Date, type, OldValue, NewValue,TableName)
SELECT SUSER_SNAME(),getdate(), 'DL',deleted.StatusName +': '+ convert(varchar(6),deleted.Status_ID),'<NONE>','Status'
FROM deleted 
WHERE NOT EXISTS(select * from inserted where inserted.Status_ID = deleted.Status_ID)

SELECT @errno = @@ERROR
IF @errno <> 0
BEGIN
     SELECT @errmsg = 'Cannot audit deleting Status.'
     GOTO error
END

IF UPDATE(StatusName)
BEGIN
	INSERT INTO dbo.AuditTrail 
		(UserID, Date, type, OldValue, NewValue,TableName)
	SELECT SUSER_SNAME(), getdate(), 'UP:StatusName',  
		convert(varchar(6),deleted.Status_ID) + ': ' + deleted.StatusName,
		convert(varchar(6),inserted.Status_ID) + ': ' + inserted.StatusName,'Status'
	FROM deleted
	INNER JOIN inserted ON inserted.Status_ID = deleted.Status_ID
	WHERE deleted.StatusName <> inserted.StatusName

	SELECT @errno = @@ERROR
	IF @errno <> 0
	BEGIN
		 SELECT @errmsg = 'Cannot audit updating StatusName.'
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


