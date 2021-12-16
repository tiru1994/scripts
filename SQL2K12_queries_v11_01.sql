
use master

print 'SQL Server Installation and Patches'
print ' '
print 'SQL2K12_10 Rename sa account'
print ' '
print ' '
select loginname from sys.syslogins
print ' '
print ' '
print 'SQL2K12_11 Sample Database'
print ' '
print ' '
select name from sys.sysdatabases 
print ' '
print 'SQL2K12_12 Initialization parameter-Remote Access Status'
print ' '
print ' '
exec sp_configure 'Remote access'
print ' '
print 'SQL2K12_13 Initialization parameter-Scan for Startup Procedures Status'
print ' '
print ' '
print 'SQL Server Settings'
print ' '
exec sp_configure 'scan for startup procs'
print ' '
print '______________________________________________________SQL SERVER SETTING_________________________________________________________________'
print ' '
print 'SQL2K12_18 Cross Database Ownership Chaining'
print ' '
exec sp_configure 'Cross db ownership'

print ' '
print 'SQL2K12_20 Replication '
print ' '
exec sp_configure 'Replication XPs'
print ' '
print ' '
print 'SQL2K12_22 Database Mail'
print ' '
print ' '
exec sp_configure'Database Mail XPs'
print ' '
print 'SQL2K12_24 Extended stored procedures'
print ' '
print ' '
print 'xp_available media '
print ' '
exec sp_helprotect 'xp_available media'
print ' '
print 'xp_cmdshell '
print ' '
exec sp_helprotect 'xp_cmdshell'
print ' '
print 'xp_dirtree '
print ' '
exec sp_helprotect 'xp_dirtree'
print ' '
print 'xp_dsninfo '
print ' '
exec sp_helprotect 'xp_dsninfo'
print ' '
print 'xp_enumdsn '
print ' '
exec sp_helprotect 'xp_enumdsn'

print 'xp_enumerrorlogs '

exec sp_helprotect 'xp_enumerrorlogs'

print 'xp_enumgroups '

exec sp_helprotect 'xp_enumgroups'

print 'xp_eventlog '

exec sp_helprotect 'xp_eventlog'

print 'xp_fixeddrives '

exec sp_helprotect 'xp_fixeddrives'

print 'xp_getfiledetails '

exec sp_helprotect 'xp_getfiledetails'

print 'xp_getnetname '

exec sp_helprotect 'xp_getnetname'

print 'xp_logevent '

exec sp_helprotect 'xp_logevent'

print 'xp_loginconfig '

exec sp_helprotect 'xp_loginconfig'

print 'xp_msver '

exec sp_helprotect 'xp_msver'

print 'xp_readerrorlog '

exec sp_helprotect 'xp_readerrorlog'

print 'xp_servicecontrol '

exec sp_helprotect 'xp_servicecontrol'

print 'xp_sprintf '

exec sp_helprotect 'xp_sprintf'

print 'xp_sscanf '

exec sp_helprotect 'xp_sscanf'

print 'xp_subdirs '

exec sp_helprotect 'xp_subdirs'

print ' '
print 'SQL2K12_25 SQL mail extended stored procedure'

print ' '

print 'xp_deletemail '

exec sp_helprotect 'xp_deletemail'

print 'xp_findnextmsg '

exec sp_helprotect 'xp_findnextmsg'

print 'xp_get_mapi_default_profile '

exec sp_helprotect 'xp_get_mapi_default_profile'

print 'xp_get_mapi_profiles '

exec sp_helprotect 'xp_get_mapi_profiles'

print 'xp_readmail '

exec sp_helprotect 'xp_readmail'

print 'xp_sendmail '

exec sp_helprotect 'xp_sendmail'

print 'xp_startmail '

exec sp_helprotect 'xp_startmail'

print 'xp_stopmail '

exec sp_helprotect 'xp_stopmail'

print ' '

print 'SQL2K12_26 Web task extended stored procedures'

print ' '

print 'xp_cleanupwebtask '

exec sp_helprotect 'xp_cleanupwebtask'

print 'xp_convertwebtask '

exec sp_helprotect 'xp_convertwebtask'

print 'xp_dropwebtask '

exec sp_helprotect 'xp_dropwebtask'

print 'xp_enumcodepages '

exec sp_helprotect 'xp_enumcodepages'

print 'xp_makewebtask '

exec sp_helprotect 'xp_makewebtask'

print 'xp_readwebtask '

exec sp_helprotect 'xp_readwebtask'

print 'xp_runwebtask '

exec sp_helprotect 'xp_runwebtask'

print ' '

print 'SQL2K12_27 OLE Automation stored procedures'

print ' '

print 'sp_OACreate '

exec sp_helprotect 'sp_OACreate'

print 'sp_OADestroy '

exec sp_helprotect 'sp_OADestroy'

print 'sp_OAGetErrorInfo '

exec sp_helprotect 'sp_OAGetErrorInfo'

print 'sp_OAGetProperty '

exec sp_helprotect 'sp_OAGetProperty'

print 'sp_OAMethod '

exec sp_helprotect 'sp_OAMethod'

print 'sp_OASetProperty '

exec sp_helprotect 'sp_OASetProperty'

print 'sp_OAStop '

exec sp_helprotect 'sp_OAStop'

print ' '

print 'SQL2K12_28 Registry Access extended stored procedures'

print ' '

print 'xp_regaddmultistring '

exec sp_helprotect 'xp_regaddmultistring'

print 'xp_regdeletekey '

exec sp_helprotect 'xp_regdeletekey'

print 'xp_regdeletevalue '

exec sp_helprotect 'xp_regdeletevalue'

print 'xp_regenumvalues '

exec sp_helprotect 'xp_regenumvalues'

print 'xp_regremovemultistring'

exec sp_helprotect 'xp_regremovemultistring'

print 'xp_regwrite '

exec sp_helprotect 'xp_regwrite'

print ' '

print 'SQL2K12_29 - Critical stored procedures are not encrypted'
print ' '
print ' '
exec sp_msforeachdb @command1='PRINT''DB Name - ?''',@command2='
Select SO.Name [Stored Procedure Name], SC.encrypted 
from sysobjects SO
join Syscomments SC on SO.id = SC.id
where SO.type = ''P'''
print ' '


print '______________________________________________________ACCESS CONTROL_________________________________________________________________'
print ' '
print 'SQL2K12_32 SQL Logins'
print ' '
print ' '
select * from sys.sql_logins 
print ' '
print 'SQL2K12_33 OS Guests access'
print ' '
print ' '
select loginname, hasaccess from sys.syslogins 
print ' '
print 'SQL2K12_34  Fixed Server roles'
print ' '
print ' '
exec sp_helpsrvrolemember 
print ' '
print 'SQL2K12_35 Database Guest Account access to database'
print ' '
print ' '
exec sp_msforeachdb 
'use ? select ''?'', name, hasdbaccess from sys.sysusers where name = ''guest'''
print ' '
print 'SQL2K12_36 Users having “WITH GRANT” privilege'
print ' '
print ' '
select name,protecttype,issqlrole,issqluser from sys.sysprotects 
as sp join sys.sysusers as su
on sp.uid = su.uid 
where protecttype = '204'
print ' '
print ' '
print 'SQL2K12_37 Remote Server Status'
print ' '
print ' '
select * from sys.sysservers
print ' '
print 'SQL2K12_38 - Windows and SQL administration roles are not separated'
print ' '
print ' '
exec sp_helpsrvrolemember 
print ' '

USE master
GO
SET NOCOUNT ON
DECLARE @loginName sysname, @dbName sysname

SET @loginName = '%' 
SET @dbName = '%' 
print ' '
print ' '
print 'SQL2K12_39 - Database Roles'
print ' '
print ' '
EXEC sp_msforeachdb @command1='PRINT''DB Name - ?''',@command2="use ? EXEC sp_helprolemember"
print ' '
print 'SQL2K12_40 - Server Roles'
print ' '
print 'Server Roles:'
print ' '
exec sp_helpsrvrolemember 
print ' '
print 'SQL2K12_41 Statement Permissions are assigned to non-administrative users'
print ' '
print ' '
exec sp_msforeachdb @command1='PRINT''DB Name - ?''',@command2='DECLARE @DBRolePermissions TABLE(
Owner  varchar(300),
Object  varchar(300),
Grantee  varchar(300),                                                     
Grantor  varchar(300),
ProtectType  varchar(300),
statement_permission  varchar(300),       
Colum varchar(300))
use ?
INSERT INTO @DBRolePermissions
EXEC sp_helprotect NULL, NULL, NULL, ''s''

SELECT DISTINCT Grantee , statement_permission 
FROM @DBRolePermissions'
print ' '
print ' ________________________________________________________Backup and Disaster Recovery Procedures_____________________________________________________________'
print ' '
print 'SQL2K12_43 Unrestricted access to System Tables'
print ' '
print ' '
exec sp_msforeachdb @command1='PRINT''DB Name - ?''',@command2='use ? select u.name AS [Principal], t.name AS [Table], p.permission_name AS [Permission],
p.state_desc AS [State]
FROM sys.database_principals u
JOIN sys.database_permissions p ON u.principal_id = p.grantee_principal_id
JOIN sys.tables t ON p.major_id = t.object_id
WHERE p.state_desc <> ''DENY''
AND t.is_ms_shipped = 1
ORDER BY u.name, t.name'
print ' '
print ' ________________________________________________________SURFACE AREA CONFIGURATION TOOL_____________________________________________________________'
print ' '
print 'SQL2K12_44 Ad Hoc Remote Queries'
print ' '
print ' '
select * from sys.configurations where name = 'Ad Hoc Distributed Queries'
print ' '
print 'SQL2K12_45 CLR Integration'
print ' '
print ' '
select * from sys.configurations where name = 'clr enabled'
print ' '
print 'SQL2K12_46 DAC'
print ' '
print ' '
select * from sys.configurations where name = 'remote admin connections'
print ' '
print 'SQL2K12_47 OLE Automation'
print ' '
print ' '
select * from sys.configurations where name= 'ole automation procedures'
print ' '
print 'SQL2K12_48 Web Assistant'
print ' '
print ' '
select * from sys.system_components_surface_area_configuration where component_name='web assistant procedures'
print ' '
print 'SQL2K12_49 xp_cmdshell'
print ' '
print ' '
select * from sys.configurations where name= 'xp_cmdshell'
print ' '
print 'SQL2K12_50 SQL Mail '
print ' '
print ' '
exec sp_configure'SQL Mail XPs'
print ' ' 

print '_____________________________________________________________________________________________________'

print ' '
print '2.2.5 Ensure Database and Application User Input is Sanitized '
print 'Manual check'
print ' '

print '2.2.6 Ensure CLR Assembly Permission Set is set to SAFE_ACCESS for All CLR Assemblies'
print ' '
SELECT name,
permission_set_desc
FROM sys.assemblies
WHERE is_user_defined = 1;
GO
print ' '

print 'Ensure MUST_CHANGE Option is set to ON for All SQL Authenticated Logins'
print ' '
print 'Manual check'
print ' ' 

print 'Ensure Symmetric Key encryption algorithm is set to AES_128 or higher in non-system databases and size>2048'
print 'non-compliance if rows are returned'
SELECT db_name() AS Database_Name, name AS Key_Name
FROM sys.symmetric_keys
WHERE algorithm_desc NOT IN ('AES_128','AES_192','AES_256')
AND db_id() > 4;
GO


print '2.5.5 Ensure 'Orphaned Users' are Dropped From SQL Server Databases'
print ' '
EXEC sp_change_users_login @Action='Report';
print ' '

print '2.5.6 Ensure the public role in the msdb database is not granted access to SQL Agent proxies'
print ' '
SELECT sp.name AS proxyname
FROM dbo.sysproxylogin spl
JOIN sys.database_principals dp
ON dp.sid = spl.sid
JOIN sysproxies sp
ON sp.proxy_id = spl.proxy_id
WHERE principal_id = USER_ID('public');
GO

print '2.5.7 Ensure SQL Authentication is not used in contained databases'
print ' '
SELECT name AS DBUser
FROM sys.database_principals
WHERE name NOT IN ('dbo','Information_Schema','sys','guest')
AND type IN ('U','S','G')
AND authentication_type = 2;
GO

print '2.5.8 Ensure the SQL Server’s SQLAgent Service Account is Not an Administrator'
print 'Manual check'
print ' '

print '2.5.9 Ensure only the default permissions specified by Microsoft are granted to the public server role'
print 'For compliance no rows should be returned'
print ' '
SELECT *
FROM master.sys.server_permissions
WHERE (grantee_principal_id = SUSER_SID(N'public') and state_desc LIKE
'GRANT%')
AND NOT (state_desc = 'GRANT' and [permission_name] = 'VIEW ANY DATABASE' and
class_desc = 'SERVER')
AND NOT (state_desc = 'GRANT' and [permission_name] = 'CONNECT' and
class_desc = 'ENDPOINT' and major_id = 2)
AND NOT (state_desc = 'GRANT' and [permission_name] = 'CONNECT' and
class_desc = 'ENDPOINT' and major_id = 3)
AND NOT (state_desc = 'GRANT' and [permission_name] = 'CONNECT' and
class_desc = 'ENDPOINT' and major_id = 4)
AND NOT (state_desc = 'GRANT' and [permission_name] = 'CONNECT' and
class_desc = 'ENDPOINT' and major_id = 5);
go

print '2.6.2 Ensure Single-Function Member Servers are Used'
print ' '
print' Manual check'


print  '2.6.9 Ensure Scan For Startup Procs Server Configuration Option is set to 0'
exec sp_configure 'scan for startup procs'
print ' '

print '2.6.10  Ensure Unnecessary SQL Server Protocols are set to Disabled'
print 'Manual check'
print ' '

print '2.6.11 Ensure Hide Instance option is set to Yes for Production SQL Server instances'
print 'Manual check'
print ' '

print '2.6.12 Ensure AUTO_CLOSE is set to OFF on contained databases'
print ' '
SELECT name, containment, containment_desc, is_auto_close_on
FROM sys.databases
WHERE containment <> 0 and is_auto_close_on = 1;
GO
print ' '

print '2.6.13 Ensure no login exists with the name sa'
print 'Compliant if no rows are returned '
SELECT principal_id, name
FROM sys.server_principals
WHERE name = 'sa';
GO
print ' '


print '______________________________________________________Auditing and Logging_________________________________________________________________'
print 'c2 audit mode'
print ' '
print ' '
SELECT name, value from master.sys.configurations where name='c2 audit mode'
print ' '

print ' '
print '2.1.3 Ensure Login Auditing is set to failed logins'
exec xp_loginconfig 'audit level';









