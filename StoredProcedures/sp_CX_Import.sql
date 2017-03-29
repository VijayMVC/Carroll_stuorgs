USE [StudentOrgs]
GO

/****** Object:  StoredProcedure [dbo].[sp_CX_Import]    Script Date: 02/08/2013 09:37:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[sp_CX_Import]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-- Insert statements for procedure here
-- delete from STUDENT_IMPORT;

create table #temp_student_import(
lastname varchar(50),
firstname varchar(50),
carroll_id int,
classof varchar(2),
email varchar(50),
preferredphone varchar(20),
active bit,
gender bit,
gpaorg bit,
gpaboard bit,
ferpa bit,
major varchar(50),
major2 varchar(50),
oncampus varchar(1),
race varchar(50),
international varchar(1)
);

/*Import new student data via the cx export*/
bulk
insert #temp_student_import
from 'C:\My Files\Desktop\StudentOrgsStudent.csv'
with
(
fieldterminator = ',',
rowterminator = '\n'
);

/*Update the data in the import table so it fits format expected by application*/
update #temp_student_import
set lastname = REPLACE(lastname,'"',''),
firstname = REPLACE(firstname,'"',''),
classof = REPLACE(classof,'"',''),
email = REPLACE(email,'"',''),
preferredphone = REPLACE(preferredphone,'"',''),
major = REPLACE(major,'"',''),
major2 = REPLACE(major2,'"',''),
race = REPLACE(race,'"','');

/*Update existing entries in students table */
update Student
set LastName = temp.lastname,
FirstName = temp.firstname,
ClassOf = temp.classof,
Email = temp.email,
PreferredPhone = temp.preferredphone,
Active = temp.active,
Gender = temp.gender,
GPAOrg = temp.gpaorg,
Major = temp.major,
Major2 = temp.major2,
GPABoard = temp.gpaboard,
Ferpa = temp.ferpa,
OnCampus = temp.oncampus,
Race = temp.race,
International = temp.international
from #temp_student_import temp
where Student.Carroll_ID = temp.carroll_id;

/*Delete already existing records from the student_import table*/
delete from #temp_student_import where #temp_student_import.carroll_id in (select carroll_id from Student);

/*Insert new records into the students table*/
Insert into Student
(LastName,
FirstName,
ClassOf,
Address,
Email,
PreferredPhone,
Active,
Gender,
Carroll_ID,
GPAOrg,
Major,
Major2,
CertifiedDriver,
ApprovedDriver,
GPABoard,
Ferpa,
GreekGPA,
OnCampus,
Race,
International)
select
	lastname,
	firstname,
	classof,
	null,
	email,
	preferredphone,
	active,
	gender,
	carroll_id,
	gpaorg,
	major,
	major2,
	null,
	null,
	gpaboard,
	ferpa,
	null,
	oncampus,
	race,
	international
from #temp_student_import;

drop table #temp_student_import;
END


GO

