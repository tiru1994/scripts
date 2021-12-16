rem -------------------------------------------------------------
rem Oracle 10g database-side audit script
rem copyright (c) Ernst & Young LLP 2007
rem -------------------------------------------------------------
rem Operational instructions to the client:
rem
rem Please:
rem
rem It is the client’s responsibility to perform the following 
rem steps prior to execution of the script in the production 
rem environment:
rem 
rem a) Scrutinize the contents of the script to ensure that it does 
rem    not contain any statements, commands or any other code that 
rem    might negatively influence their environment(s) in either a 
rem    security or operational way.
rem 
rem b) Test the script on the test environment to ensure that it does 
rem    not contain any statements, commands or any other code that 
rem    might negatively influence their environment(s) in either a 
rem    security or operational way.
rem 
rem c) The final responsibility for executing this script lies with 
rem    the client.  
rem 
rem d) It is advised to execute the script during off-peak hours.
rem 
rem e) The client must remove all copies of the script as it is the 
rem    property of Ernst & Young LLP. The client may retain the 
rem    script results.
rem -------------------------------------------------------------

rem modification date - 24/05/2007 - a. muller - removed operational sql queries
rem modification date - 03 Mar 2003 

set echo off
accept file_desc prompt "Enter output file path ie ../audit/ : "
set feedback off

set space 0
set pagesize 0
set linesize 400
set termout off

SPOOL &&file_desc/DBDBNMS.TXT

select 'DatabaseName;RunTime;Space' from sys.dual;

select NAME||';'||to_char(sysdate,'mm/dd/yyyy HH:MM AM')||';'
from sys.v_$database;

SPOOL OFF

SPOOL &&file_desc/DBPARMS.TXT

select 'Numb;Parameter Name;Type;Value;Default;Description;Space' from sys.dual;


SELECT  NUM||';'||substr(NAME,1,length(name))||';'||
        TYPE||';'||substr(VALUE,1,length(value))||';'||
        ISDEFAULT||';'||
	substr(description,1,length(description))||';'
FROM    SYS.V_$PARAMETER
order by name;

SPOOL OFF

SPOOL &&file_desc/DBDATAF.TXT

select 'FileNo;SysStatus;Enabled;Name;Tablespace;Size;Status;Space' from sys.dual;

SELECT  a.FILE#||';'||a.STATUS||';'||ENABLED||';'||
        substr(NAME,1,length(name))||';'||
	substr(tablespace_name,1,length(tablespace_name))||';'||
	A.bytes||';'||b.status||';'
FROM    SYS.V_$DATAFILE a, sys.dba_data_files b
where name = file_name
order by name, tablespace_name; 

SPOOL OFF

SPOOL &&file_desc/DBDFILE.TXT

select 'Tablespace;FileName;FileNo;MaxExt;Next;Space' from sys.dual;

select b.TABLESPACE_NAME||';'||b.FILE_NAME||';'||a.FILE#||';'||a.MAXEXTEND||';'||a.INC||';'
from SYS.FILEXT$ a,  SYS.DBA_DATA_FILES b
where b.FILE_ID = a.FILE#(+);

spool off


SPOOL &&file_desc/DBCNTRF.TXT

select 'Status;Name;Space' from sys.dual;

SELECT  substr(status,1,length(status))||';'||
        substr(name,1,length(name))||';'
FROM    SYS.V_$controlfile;

spool off


SPOOL &&file_desc/DBLOGFL.TXT

select 'GrpNo;Log Status;File Name;Members;Arch;File Status;space' from sys.dual;

SELECT  a.GROUP#||';'||substr(b.status,1,length(b.status))||';'||
        substr(a.MEMBER,1,length(a.member))||';'||
	b.members||';'||b.archived||';'||
	substr(a.status,1,length(a.status))||';'
FROM    SYS.V_$LOGFILE a, SYS.V_$log b
where a.group# = b.group#;

spool off


SPOOL &&file_desc/DBPROFI.TXT

select 'Profile;Resource;Limit;Space' from sys.dual;

SELECT  substr(profile,1,length(profile))||';'||
        substr(resource_name,1,length(resource_name))||';'||
	substr(limit,1,length(limit))||';'
FROM    sys.dba_profiles;

spool off

SPOOL &&file_desc/DBUDATA.TXT

select 'User;PSWD;Default Tbl Space;Temp TblSpace;Created;Profile;Account Status;Lock Date;Space' from dual;

SELECT  substr(username, 1, length(USERNAME))||';'||
	substr(password, 1, length(PASSWORD))||';'||
	substr(default_tablespace,1,length(DEFAULT_TABLESPACE))||';'||
	substr(temporary_tablespace,1,length(TEMPORARY_TABLESPACE))||';'||
	CREATED||';'||substr(profile,1,length(PROFILE))||';'||
	account_status||';'||
	lock_date||';'
	FROM sys.dba_users
	order by username;

SPOOL OFF


SPOOL &&file_desc/DBUSROL.TXT

select 'User;Role;PSWD Req;Admin Option;Default Role;Space' from dual;

SELECT  substr(b.grantee, 1, length(b.grantee))||';'||
	substr(b.granted_role,1,length(b.granted_role))||';'||
	c.password_required||';'||b.admin_option||';'||
	b.default_role||';'
	FROM  sys.dba_role_privs b, sys.dba_roles c
	where b.granted_role = c.role
	order by b.grantee, b.granted_role;
SPOOL OFF

SPOOL &&file_desc/DBROLES.TXT

select 'Role;PswdReq;Space' from sys.dual;

select role ||';'||password_required||';'
  from sys.dba_roles;

spool off

SPOOL &&file_desc/DBTABLP.TXT

select 'Table Grantee;Privilege;Number;Space' from sys.dual;
select grantee||';'||PRIVILEGE||';'||count(*)||';'
from sys.dba_tab_privs
group by grantee, privilege;

spool off

SPOOL &&file_desc/DBRTPRIV.TXT

select 'Grantee;Table;Grantable;Priv;Space' from sys.dual;

select grantee||';'||table_name ||';'||grantable||';'||privilege||';'
  from sys.dba_tab_privs
order by grantee, table_name;

spool off

SPOOL &&file_desc/DBRPRIV.TXT

select 'Grantee;Privilege;Admin Option;Space' from sys.dual;

SELECT  substr(grantee, 1, length(grantee))||';'||
	substr(privilege,1,length(privilege))||';'||
	admin_option||';'
	FROM  sys.dba_sys_privs 
	order by grantee, privilege;

SPOOL OFF

SPOOL &&file_desc/DBPUBTP.TXT

select 'Table Grantee;Privilege;Table Name;Space' from sys.dual;

select grantee||';'||PRIVILEGE||';'||TABLE_NAME||';'
from sys.dba_tab_privs
where grantee like 'PUBLIC%'
order by PRIVILEGE, TABLE_NAME;

spool off


SPOOL &&file_desc/DBDBLNK.TXT

select 'Owner;DB Link;User;Host;Created;Space' from sys.dual;

select substr(OWNER,1,length(OWNER))||';'||
substr(DB_LINK,1,length(DB_LINK))||';'||
substr(USERNAME,1,length(USERNAME))||';'||
substr(HOST,1,length(HOST))||';'||CREATED||';'
from SYS.DBA_DB_LINKS;
	
spool off

SPOOL &&file_desc/DBTABLO.TXT

select 'Table Owner;Tables;Space' from sys.dual;
select owner||';'||count(table_name)||';'
from sys.dba_tables
group by owner;

spool off


SPOOL &&file_desc/DBPRVAD.TXT

select 'User Name;Privilege;Success;Failure;Space' from sys.dual;
SELECT  substr(USER_NAME,1,length(user_name))||';'||
        substr(PRIVILEGE,1,length(privilege))||';'||
        SUCCESS||';'||FAILURE||';'
FROM    SYS.DBA_PRIV_AUDIT_OPTS;

SPOOL OFF

SPOOL &&file_desc/DBSYSAU.TXT

select 'User Name;Option;Success;Failure;Space' from sys.dual;
SELECT  substr(USER_NAME,1,length(user_name))||';'||
        substr(AUDIT_OPTION,1,length(audit_option))||';'||
        substr(SUCCESS,1,length(success))||';'||
        substr(FAILURE,1,length(failure))||';'
FROM    SYS.DBA_STMT_AUDIT_OPTS;

SPOOL OFF


SPOOL &&file_desc/DBSYDBA.TXT

select 'User Name;DBA;Operator;Space' from sys.dual;
SELECT  USERNAME||';'||
        SYSDBA||';'||
	SYSOPER||';'
FROM    V$PWFILE_USERS
order by USERNAME;

SPOOL OFF

SPOOL &&file_desc/DBAUDBA.TXT
select 'User Name;User Host;Terminal;Time;Owner;Object Name;Action ID;'||
       'Action Name;Connect Privilege;DBA Privilege;Resource Privilege;'||
       'Grantee;Session ID;Entry ID;Statement ID;Return Code;' from sys.dual;
select username||';'||
       userhost||';'||
       terminal||';'||
       timestamp||';'||
       owner||';'||
       obj_name||';'||
       action||';'||
       action_name||';'||
       'na'||';'||
       sys_privilege||';'||
       obj_privilege||';'||
       grantee||';'||
       sessionid||';'||
       entryid||';'||
       statementid||';'||
       returncode
  from sys.dba_audit_trail;
spool off

SPOOL &&file_desc/DBAUDPRV.TXT
select 'Grantee;Privilege;Admin_option;' from sys.dual;
select grantee||';'||privilege||';'||admin_option
from sys.dba_sys_privs
where privilege like '%AUDIT%';
spool off


SPOOL &&file_desc/DBAUSES.TXT

select 'OS User Name;User Name;User Host;Terminal;Time;Logoff Time;'||
'Action Name;Session ID;Return Code;Space' from sys.dual;

select OS_USERNAME||';'||USERNAME||';'||USERHOST||';'||
TERMINAL||';'||to_char(TIMESTAMP,'mm/dd/yy HH:MM AM')||';'||
to_char(LOGOFF_TIME,'mm/dd/yy HH:MM AM')||';'||
ACTION_NAME||';'||SESSIONID||';'||
DECODE(RETURNCODE,0,'Connected',1005,'FailedNull',1017,'Failed',RETURNCODE)||';'
from sys.dba_audit_session;

SPOOL OFF

SPOOL &&file_desc/DBAUSTA.TXT

select 'OS User Name;User Name;User Host;Terminal;Time;Owner;Object Name;'||
'Action Name;New Name;Object Privilege;System Privilege;'||
'Admin Option;Grantee;Audit Option;Session Actions;Session ID;'||
'Entry ID;Statement ID;Return Code;Privilege Used;Space' from sys.dual;

select OS_USERNAME||';'||USERNAME||';'||USERHOST||';'||
TERMINAL||';'||to_char(TIMESTAMP,'mm/dd/yy HH:MM AM')||';'||OWNER||';'||OBJ_NAME||';'||
ACTION_NAME||';'||NEW_NAME||';'||OBJ_PRIVILEGE||';'||
SYS_PRIVILEGE||';'||ADMIN_OPTION||';'||GRANTEE||';'||AUDIT_OPTION||';'||
SES_ACTIONS||';'||SESSIONID||';'||ENTRYID||';'||STATEMENTID||';'||
RETURNCODE||';'||PRIV_USED||';'
from sys.dba_audit_statement;

SPOOL OFF


SPOOL &&file_desc/DBAUTRL.TXT

select 'OS User Name;User Name;User Host;Terminal;Time;Owner;Object Name;'||
'Action ID;Action Name;New Owner;New Name;Object Privilege;System Privilege;'||
'Admin Option;Grantee;Audit Option;Session Actions;Session ID;'||
'Entry ID;Statement ID;Return Code;Privilege Used;Space' from sys.dual;


select OS_USERNAME||';'||USERNAME||';'||USERHOST||';'||
TERMINAL||';'||to_char(TIMESTAMP,'mm/dd/yy HH:MM AM')||';'||OWNER||';'||OBJ_NAME||';'||
ACTION||';'||ACTION_NAME||';'||NEW_OWNER||';'||NEW_NAME||';'||OBJ_PRIVILEGE||';'||
SYS_PRIVILEGE||';'||ADMIN_OPTION||';'||GRANTEE||';'||AUDIT_OPTION||';'||
SES_ACTIONS||';'||SESSIONID||';'||ENTRYID||';'||STATEMENTID||';'||
RETURNCODE||';'||PRIV_USED||';'
from sys.dba_audit_trail;

SPOOL OFF

SPOOL &&file_desc/DBNAMES.TXT

select 'Database Name;Date Created;Log Mode;Space' from sys.dual;

select NAME||';'||CREATED||';'||LOG_MODE||';'
from sys.v_$database;

SPOOL OFF


SPOOL &&file_desc/DBSYSOP.TXT

select 'System Parameter;Value;Space' from sys.dual;

select PARAMETER||';'||VALUE||';'
from sys.v_$option;

spool off

SPOOL &&file_desc/DBSYVER.TXT

select 'Product Versions;Space' from sys.dual;

select BANNER||';'
from sys.v_$version;

spool off


spool &&file_desc/DBADUSR.TXT

select 'User ID;User Name;Created;Password;Space' from sys.dual;

select user#||';'||name||';'||ctime||';'||password||';'
from sys.user$
where not exists (select 'x' from sys.dba_users
		where username = name);

SPOOL OFF


spool &&file_desc/DBTABLE.TXT
select 'Table;Owner;InitExt;NextExt;MinExt;MaxExt;PctInc;NumRow;ChainCnt;Degree;' ||
       'Instances;TblSpace;MaxTrans;' from sys.dual;
select table_name||';'||
       OWNER||';'||
       initial_extent||';'||next_extent||';'||
       min_extents||';'||max_extents||';'||
       pct_increase||';'||num_rows||';'||CHAIN_CNT||';'||
       degree ||';'||instances||';'||
       tablespace_name||';'|| max_trans||';'
  from sys.dba_tables;
spool off


spool &&file_desc/DBTRIG.TXT
select 'Owner;Trigger;Type;Event;Status;When;Descr' from dual;
select owner||';'||
       trigger_name||';'||
       trigger_type||';'||
       triggering_event||';'||
       status||';'||
       substr(when_clause,1,80)||';'||
       substr(description,1,100)||';'
 from dba_triggers;
spool off

spool &&file_desc/DBLOGS.TXT
select 'Thread;Seq;FirstTime;FirstChange;NextChange;RedId;Stamp' from dual;
select thread#||';'||
       sequence#||';'||
       first_time||';'||
       first_change#||';'||
       next_change#||';'||
       recid||';'||
       stamp||';'
 from v$log_history;
spool off

spool &&file_desc/DBUACCT.TXT
select 'UserName;Default_Profile;Account_Status' from sys.dual;
SELECT username||';'||profile||';'||account_status from sys.dba_users;
spool off

spool &&file_desc/REMOTE_PASS_LOGIN.TXT
show parameter remote_login;
spool off

set termout on

PROMPT
PROMPT ORACLE DATABASE SCRIPT HAS FINISHED PROCESSING
PROMPT

set feedback on
set echo on
