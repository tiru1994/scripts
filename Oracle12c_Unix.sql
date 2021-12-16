-- Type - Configuration Audit Script
-- Application Name - Oracle 12c Unix

set termout off
spool Oracle12c_Unix.txt
set lines 150
set head off
set colsep '|'
set recsepchar '^'
set recsep wrapped
select 'ACCOUNT AUTHENTICATION CHECKS' from dual;
col desc format a50
select 'ORA_U12c_2.3.7 Remote login settings' from dual;
select 'ORA_U12c_2.3.7_STARTS' from dual;
set head on
col name format A25
col value format A15
select name,value from v$parameter where name in('remote_login_passwordfile');
col name clear
col value clear
set head off
select 'ORA_U12c_2.3.7_ENDS' from dual;

select 'ORA_U12c_2.1.3 Default database users' from dual;
select 'ORA_U12c_2.1.3_STARTS' from dual;
set head on
col name format A25
col value format A15
select username,account_status from dba_users;
col name clear
col value clear
set head off
select 'ORA_U12cg_2.1.3_ENDS' from dual;

select 'ORA_U12c_2.3.1 Remote OS authentication settings' from dual;
select 'ORA_U12c_2.3.2 Remote OS authentication settings' from dual;
select 'ORA_U12c_2.3.4 Remote OS authentication settings' from dual;
select 'ORA_U12c_2.3.4_STARTS' from dual;
set head on
col name format A25
col value format A15
select name,value from v$parameter where name like 'os_%' or name like 'remote_os%';
col name clear
col value clear
set head off
select 'ORA_U12c_2.3.4_ENDS' from dual;

select 'ORA_U12c_2.1.6 External users' from dual;
select 'ORA_U12c_2.1.6_STARTS' from dual;
set head on
col username format A25
col account_status format A15
select username,account_status from dba_users where password='EXTERNAL';
col username clear
col account_status clear 
set head off
select 'ORA_U12c_2.1.6_ENDS' from dual;
select 'ORA_U12c_2.1.5 Accounts with default passwords' from dual;
select 'ORA_U12c_2.1.5_STARTS' from dual;
set lines 79 
set feed off 

select d.username, u.account_status from dba_users_with_defpwd d, dba_users u where d.username=u.username;
set feed off

set lines 150
select 'ORA_U12c_2.1.5_ENDS' from dual;

select 'ORA_U12c_2.4.7 Failed Login Attempts' from dual;
select 'ORA_U12c_2.4.8 Password Life Time' from dual;
select 'ORA_U12c_2.4.9 Password Reuse Max' from dual;
select 'ORA_U12c_2.4.10 Password Lock Time' from dual;
select 'ORA_U12c_2.4.11 Password Grace Time' from dual;
select 'ORA_U12c_2.4.12 Password Verify Function' from dual;
select 'ORA_U12c_2.4.12_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a40
select profile,resource_name,limit from dba_profiles where resource_type='PASSWORD' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select 'Password Verify Function' from dual;
select text from dba_source s where type='FUNCTION' and exists (select a.limit from dba_profiles a
where resource_name ='PASSWORD_VERIFY_FUNCTION' and a.limit = s.name);
set head off
select 'ORA_U12c_2.4.12_ENDS' from dual;

select 'ACCOUNT PRIVILEGES' from dual;


select 'ORA_U12c_2.5.3 Free Diskspace for Tablespaces' from dual;
select 'ORA_U12c_2.5.3_STARTS' from dual;
set head on


select  a.tablespace_name, 
       round(a.bytes_alloc / 1024 / 1024, 2) megs_alloc, 
       round(nvl(b.bytes_free, 0) / 1024 / 1024, 2) megs_free, 
       round((a.bytes_alloc - nvl(b.bytes_free, 0)) / 1024 / 1024, 2) megs_used 
from  ( select  f.tablespace_name, 
               sum(f.bytes) bytes_alloc, 
               sum(decode(f.autoextensible, 'YES',f.maxbytes,'NO', f.bytes)) maxbytes 
        from dba_data_files f 
        group by tablespace_name) a, 
      ( select  f.tablespace_name, 
               sum(f.bytes)  bytes_free 
        from dba_free_space f 
        group by tablespace_name) b 
where a.tablespace_name = b.tablespace_name (+);


set head off
select 'ORA_U12c_2.5.3_ENDS' from dual;


select 'ORA_U12c_2.5.4 Accounts/ roles with DBA role' from dual;
select 'ORA_U12c_2.5.4_STARTS' from dual;
set head on
col grantee format a20
col default_role format a20
col admin_option format a20
select 'ROLE',grantee, default_role, admin_option from dba_role_privs p, dba_roles r where  granted_role='DBA' and p.grantee= r.role union select 'USER',grantee, default_role, admin_option from dba_role_privs p, dba_users u where  granted_role='DBA' and p.grantee= u.username and u.username not in ('SYS','SYSTEM')and account_status in ('OPEN','EXPIRED');
set head off
col grantee clear
col default_role clear
col admin_option clear
select 'ORA_U12c_2.5.4_ENDS' from dual;

select 'ORA_U12c_2.4.1 SEC_RETURN_SERVER_RELEASE_BANNER is set to false' from dual;
select 'ORA_U12c_2.4.1_STARTS' from dual;
set head on
col name format a25
col value format a10
show parameter sec_return_server_release_banner;
set head off
col name clear
col value  clear  
select 'ORA_U12c_2.4.1_ENDS' from dual;
select 'ORA_U12c_2.4.2 DB_SECUREFILE is set to ALWAYS' from dual;
select 'ORA_U12c_2.4.2_STARTS' from dual;
set head on
col name format a25
col value format a10
show parameter DB_SECUREFILE;
set head off
col name clear
col value  clear  
select 'ORA_U12c_2.4.2_ENDS' from dual;
select 'ORA_U12c_2.4.3 SEC_CASE_SENSITIVE_LOGON is set to TRUE' from dual;
select 'ORA_U12c_2.4.3_STARTS' from dual;
set head on
col name format a25
col value format a10
show parameter SEC_CASE_SENSITIVE_LOGON;
set head off
col name clear
col value  clear  
select 'ORA_U12c_2.4.3_ENDS' from dual;
select 'ORA_U12c_2.4.4 SEC_MAX_FAILED_LOGIN_ATTEMPTS is set to 3' from dual;
select 'ORA_U12c_2.4.4_STARTS' from dual;
set head on
col name format a25
col value format a10
show parameter SEC_MAX_FAILED_LOGIN_ATTEMPTS;
set head off
col name clear
col value  clear  
select 'ORA_U12c_2.4.4_ENDS' from dual;
select 'ORA_U12c_2.4.5 SEC_PROTOCOL_ERROR_FURTHER_ACTION is set to DELAY or DROP' from dual;
select 'ORA_U12c_2.4.5_STARTS' from dual;
set head on
col name format a25
col value format a10
show parameter SEC_PROTOCOL_ERROR_FURTHER_ACTION;
set head off
col name clear
col value  clear  
select 'ORA_U12c_2.4.5_ENDS' from dual;
select 'ORA_U12c_2.4.6 SEC_PROTOCOL_ERROR_TRACE_ACTION is set to LOG or ALERT' from dual;
select 'ORA_U12c_2.4.6_STARTS' from dual;
set head on
col name format a25
col value format a10
show parameter SEC_PROTOCOL_ERROR_TRACE_ACTION;
set head off
col name clear
col value  clear  
select 'ORA_U12c_2.4.6_ENDS' from dual;

select 'ORA_U12c_2.4.13 Users profile settings CPU_PER_SESSION' from dual;
select 'ORA_U12c_2.4.14 Users profile settings PRIVATE_SGA' from dual;
select 'ORA_U12c_2.4.15 Set LOGICAL_READS_PER_SESSION as appropriate' from dual;
select 'ORA_U12c_2.4.16 Where technically feasible, all accounts, except for application and process related accounts are restricted to a single, concurrent login' from dual;
select 'ORA_U12c_2.4.17 Users profile settings CONNECT_TIME' from dual;
select 'ORA_U12c_2.4.18Users profile settings IDLE_TIME' from dual;
select 'ORA_U12c_2.4.18_STARTS' from dual;
set head on
col name format a25
col value format a10
select name,value from v$parameter where name='resource_limit';
set head off
col name clear
col value  clear
select 'Resource Limit for Individual Profile' from dual;

set head on
col resource_name format a40
col profile format a20
col limit format a20
select resource_name, profile, limit from dba_profiles where resource_name in ('CPU_PER_SESSION','PRIVATE_SGA','LOGICAL_READS_PER_SESSION','SESSIONS_PER_USER','CONNECT_TIME','IDLE_TIME','CPU_PER_CALL','LOGICAL_READS_PER_CALL','COMPOSITE_LIMIT');
set head off
col profile clear
col limit clear
col resource_name clear
select 'ORA_U12c_2.4.18_ENDS' from dual;



select 'SERVER AUDITING' from dual;

select 'ORA_U12c_2.3.3 Oracle audit initialization parameters' from dual;
select 'ORA_U12c_2.3.3_STARTS' from dual;
set head on
col name format a25
col value format a40
select name,value from v$parameter where name like 'audit%';
set head off
col name clear
col value clear
select 'ORA_U12c_2.3.3_ENDS' from dual;

select 'ORA_U12c_2.3.6 Lack of auditing for SYSDBA and SYSOPER roles' from dual;
select 'ORA_U12c_2.3.6_STARTS' from dual;
set head on
col name format a25
col value format a40
select name,value from v$parameter where name like 'audit%';
set head off
col name clear
col value clear
select 'ORA_U12c_2.3.6_ENDS' from dual;

select 'ORA_U12c_2.7.1 Current audit settings' from dual;
select 'ORA_U12c_2.7.1_STARTS' from dual;
select 'Statement and privilege audits' from dual;
set head on
select * from dba_stmt_audit_opts union select * from dba_priv_audit_opts; 
set head off
select 'ORA_U12c_2.7.1_ENDS' from dual;



select 'ORA_U12c_2.6.1 Dormant accounts' from dual;
select 'ORA_U12c_2.6.1_STARTS' from dual;
set head on
select distinct (u.username), u.account_status
from dba_users u , dba_audit_trail a
where u.username=a.username
and a.logoff_time>sysdate-30
and u.account_status ='OPEN';
set head off
select 'ORA_U12c_2.6.1_ENDS' from dual;

select 'ORA_U12c_2.6.2 Ensure extproc Is Not Present in listener.ora' from dual;
select 'ORA_U12c_2.6.2_STARTS' from dual;
set head on
grep -i extproc $ORACLE_HOME/network/admin/listener.ora
set head off
select 'ORA_U12c_2.6.2_ENDS' from dual;

select 'SERVER TRACING AND LOGGING' from dual;

select 'NETWORK ACCESS MECHANISM' from dual;


select 'ORA_U12c_2.1.1 ORACLE VERSION INFORMATION' from dual;
select 'ORA_U12c_2.1.1_STARTS' from dual;
col version format a25
col status format a25
select 'Comp Name: Version: Status' from dual;
set head on
col product format a50
set head on
select product,version,status from product_component_version;
col version clear
col status clear
col product clear
set head off
select 'ORA_U12c_2.1.1_ENDS' from dual;

select 'ORA_U12c_2.5.1 Temporary and Default Tablespace Management' from dual;
select 'ORA_U12c_2.5.1_STARTS' from dual;

set head on
col username format a30
col default_tablespace format a30
col temporary_tablespace format a30
select username,default_tablespace,temporary_tablespace from sys.dba_users where account_status IN ('OPEN','EXPIRE');
col username clear
col default_tablespace clear
col temporary_tablespace clear
set head off
select 'ORA_U12c_2.5.1_ENDS' from dual;

select 'ORA_U12c_2.5.2 Prevent access to ALL_SOURCE' from dual;
select 'ORA_U12c_2.5.2_STARTS' from dual;

set head on
col grantee format a20
col table_name format a30
col privilege format a30
select grantee,table_name,privilege from sys.dba_tab_privs where table_name in ('ALL_SOURCE') and grantee = 'PUBLIC';
col grantee clear
col table_name clear
col privilege clear
set head off
select 'ORA_U12c_2.5.2_ENDS' from dual;


select 'ORA_U12c_2.3.5 Http and ftp access to the oracle database' from dual;
select 'ORA_U12c_2.3.5_STARTS' from dual;
col name format a20
col value format a40
set head on
select name,value from v$parameter where name = 'dispatchers';
col name clear
col value clear
set head off
select 'ORA_U12c_2.3.5_ENDS' from dual;


--------------Operating System Audit Script Generation 

spool host.sh
set term off

select '#!/bin/bash' from dual;

select 'exec >> Oracle11g_Unix.txt' from dual;

select 'echo "ORACLE OPERATING SYSTEM AUDIT SETTINGS"' from dual;
select 'echo "Hostname"' from dual;
select 'echo' from dual;
select 'hostname' from dual;
select 'echo' from dual;

host sh ListenerPath.sh
select 'var=`cat ListenerPath.txt`' from dual;

select 'echo "ORA_U12c_2.1.2 Access to tkprof utility"' from dual;
select 'echo "ORA_U12c_2.1.2_STARTS"' from dual;
select 'echo' from dual;
select 'ls -l $ORACLE_HOME/bin/tkprof' from dual;
select 'echo' from dual;
select 'echo "ORA_U12c_2.1.2_ENDS"' from dual;

select 'echo "ORA_U12cg_2.2.1 Permission on Oracle directories"' from dual;
select 'echo "ORA_U12c_2.2.1_STARTS"' from dual;
select 'echo' from dual;

select 'echo "Permission on $ORACLE_HOME/bin directory"' from dual;
select 'echo' from dual;
select 'ls -l $ORACLE_HOME | egrep "bin"' from dual;
select 'echo' from dual;

select 'echo "Permission on $ORACLE_HOME directory"' from dual;
select 'echo' from dual;
select 'ls -al $ORACLE_HOME | head -2 | grep "d"' from dual;

select 'echo' from dual;
select 'echo "Permission on Trace directories"' from dual;
select 'echo' from dual;
col dumpfile newline
col permissions newline
select 'echo "'||value||'"' dumpfile,'ls -al ' ||value||' | head -2 | grep "d"' permissions from v$parameter where name like '%dump_dest';
select 'echo' from dual;
select 'echo "ORA_U12c_2.2.1_ENDS"' from dual;

select 'echo' from dual;
select 'echo "ORA_U12c_2.2.2 Permission on Oracle files"' from dual;
select 'echo "ORA_U12c_2.2.2_STARTS"' from dual;
select 'echo' from dual;
select 'echo "Permission on data files"' from dual;
select 'echo' from dual;
select 'ls -l '||file_name from dba_data_files;
select 'echo' from dual;
select 'echo "Permission on control files"' from dual;
select 'echo' from dual;
select 'ls -l '||name from v$controlfile;
select 'echo' from dual;
select 'echo "Permission on other Trace Files"' from dual;
select 'echo' from dual;
select 'ls -l '||value  from v$parameter where name like '%dump_dest';
select 'echo' from dual;
select 'echo' from dual;
select 'echo "Permission on Initialisation Parameter file"' from dual;
select 'echo' from dual;
select 'ls -l $ORACLE_HOME/dbs/spfile'||instance_name||'.ora' from v$instance;
select 'ls -l $ORACLE_HOME/dbs/init'||instance_name||'.ora' from v$instance;
select 'echo' from dual;
select 'echo "Permission on Listener file"' from dual;
select 'echo' from dual;
select 'ls -l $var' from dual;
select 'echo' from dual;
select 'echo "ORA_U12c_2.2.2_ENDS"' from dual;

select 'echo "ORA_U12c_2.2.3 UMASK value for Oracle account"' from dual;
select 'echo "ORA_U12c_2.2.3_STARTS"' from dual;
select 'echo' from dual;
select 'umask' from dual;
select 'echo' from dual;
select 'echo' from dual;
select 'echo "ORA_U12c_2.2.3_ENDS"' from dual;

select 'echo "ORA_U12c_2.1.4 Default Port numbers"' from dual;
select 'echo "ORA_U12c_2.1.4_STARTS"' from dual;
select 'echo' from dual;
select 'echo Ports in tnsnames.ora >>Oracle11g_Unix.txt&' from dual;
select 'cat $ORACLE_HOME/network/admin/tnsnames.ora | grep -i "PORT" >>Oracle11g_Unix.txt&' from dual;
select 'echo Ports in listener.ora >>Oracle11g_Unix.txt&' from dual;
select 'cat $var | grep -i "PORT">>Oracle11g_Unix.txt&' from dual;

select 'echo' from dual;
select 'echo' from dual;

select 'echo "ORA_U12c_2.1.4_ENDS"' from dual;


--------------Checking for accounts with the same username and password

set head off
set feed off
set verify off

set head off
set feed off
set verify off
spool password_equals_username.run  
col user_id newline
col show_it newline

select 'set head off' from sys.dual;
select 'set feed off' from sys.dual;
select 'set verify off' from sys.dual;
select  'spool password_equals_username.txt' from sys.dual;
select  'connect '||username||'/'||username user_id,
        'select ''connected as ''||user||'' with password ''||user from sys.dual;' 
show_it
from dba_users
WHERE username !='SYS'and account_status ='OPEN';
select 'spool off' from sys.dual;
spool off
set head on
set feed on
set verify on
@password_equals_username.run


set termout on

host sh cp.sh
