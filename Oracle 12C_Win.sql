set termout off
spool Oracle12C_Windows.txt
set lines 150
set head off
set colsep '|'
set recsepchar '^'
set recsep wrapped
col desc format a50

select '2.1.1 Ensure the Appropriate Version/Patches for Oracle Software Is Installed ' from dual;
select '2.1.1_STARTS' from dual;
set head on
col name format A25
col value format A15
select dbms_qopatch.GET_OPATCH_LIST from dual; 
select * from sys.registry$history;
col name clear
col value clear
set head off
select '2.1.1_ENDS' from dual;

col desc format a50
select '2.1.2 Ensure All Default Passwords Are Changed' from dual;
select '2.1.2_STARTS' from dual;
set head on
col name format A25
col value format A15
select * from dba_users_with_defpwd;
select username,account_status from dba_users;
col name clear
col value clear
set head off
select '2.1.2._ENDS' from dual;

select '2.1.3 Ensure All Sample Data And Users Have Been Removed' from dual;
select '2.1.3_STARTS' from dual;
set head on
col name format A25
col value format A15
SELECT USERNAME FROM ALL_USERS WHERE USERNAME IN ('BI','HR','IX','OE','PM','SCOTT','SH');
col name clear
col value clear
set head off
select '2.1.3_ENDS' from dual;

select '2.2.1. Ensure Secure Control_<listener_name> Is set  in Listener.ora' from dual;
select '2.2.1._STARTS' from dual;
select 'Refer output.txt file' from dual;
select '2.2.1._ENDS' from dual;

select '2.2.2. Ensure extproc Is Not Present in listener.ora' from dual;
select '2.2.2._STARTS' from dual;
select 'Refer output.txt file' from dual;
select '2.2.2._ENDS' from dual;

select '2.2.3. Ensure ADMIN_RESTRICTIONS Is Set to ON' from dual;
select '2.2.3._STARTS' from dual;
select 'Refer output.txt file' from dual;
select '2.2.3._ENDS' from dual;

select '2.2.4. Ensure SECURE_REGISTER Is Set to TCPS or IPC' from dual;
select '2.2.4._STARTS' from dual;
select 'Refer output.txt file' from dual;
select '2.2.4._ENDS' from dual;

select '2.3.1. Ensure AUDIT_SYS_OPERATIONS Is Set to' from dual;
select '2.3.1._STARTS' from dual;
show parameters 'audit_sys_operations';
select '2.3.1._ENDS' from dual;

select '2.3.2 Ensure AUDIT_TRAIL Is Set to OS DB EXTENDED or XML EXTENDED' from dual;
select '2.3.2_STARTS' from dual;
show parameters 'AUDIT_TRAIL';
select '2.3.2_ENDS' from dual;

select '2.3.3 Ensure GLOBAL_NAMES Is Set to TRUE'  from dual;
select '2.3.3._STARTS' from dual;
show parameters 'GLOBAL_NAMES';
select '2.3.3._ENDS' from dual;

select '2.3.4 Ensure LOCAL_LISTENER Is Set' from dual;
select '2.3.4_STARTS' from dual;
show parameters 'LOCAL_LISTENER';
select '2.3.4_ENDS' from dual;

select '2.3.5. Ensure O7_DICTIONARY_ACCESSIBILITY Is Set to FALSE' from dual;
select '2.3.5_STARTS' from dual;
show parameters 'O7_DICTIONARY_ACCESSIBILITY';
select '2.3.5._ENDS' from dual;

select '2.3.6. Ensure OS_ROLES Is Set to FALSE' from dual;
select '2.3.6._STARTS' from dual;
show parameters 'OS_ROLES';
select '2.3.6._ENDS' from dual;

select '2.3.7. Ensure REMOTE_LISTENER Is Empty' from dual;
select '2.3.7._STARTS' from dual;
show parameters 'REMOTE_LISTENER';
select '2.3.7._ENDS' from dual;

select '2.3.8. Ensure REMOTE_LOGIN_PASSWORDFILE Is Set to Exclusive or Shared' from dual;
select '2.3.8._STARTS' from dual;
show parameters 'REMOTE_LOGIN_PASSWORDFILE';
select '2.3.8._ENDS' from dual;

select '2.3.9. Ensure REMOTE_OS_AUTHENT Is Set to FALSE' from dual;
select '2.3.9._STARTS' from dual;
show parameters 'REMOTE_OS_AUTHENT';
select '2.3.9._ENDS' from dual;

select '2.3.10. Ensure REMOTE_OS_ROLES Is Set to FALSE' from dual;
select '2.3.10._STARTS' from dual;
show parameters 'REMOTE_OS_ROLES';
select '2.3.10._ENDS' from dual;

select '2.3.11. Ensure UTIL_FILE_DIR Is Empty' from dual;
select '2.3.11._STARTS' from dual;
show parameters 'UTIL_FILE_DIR';
select '2.3.11._ENDS' from dual;

select '2.3.12 Ensure SEC_CASE_SENSITIVE_LOGON Is Set to TRUE' from dual;
select '2.3.12._STARTS' from dual;
show parameters 'SEC_ CASE_SENSITIVE_LOGON';
select '2.3.12._ENDS' from dual;

select '2.3.13. Ensure SEC_MAX_FAILED_LOGIN_ATTEMPTS Is Set to 10' from dual;
select '2.3.13._STARTS' from dual;
show parameters 'SEC_MAX_FAILED_LOGIN_ATTEMPTS';
select '2.3.13._ENDS' from dual;

select '2.3.14. Ensure SEC_PROTOCOL_ERROR_FURTHER_ACTION Is Set to DELAY 3  or  DROP 3' from dual;
select '2.3.14._STARTS' from dual;
show parameters 'SEC_PROTOCOL_ERROR_FURTHER_ACTION';
select '2.3.14._ENDS' from dual;

select '2.3.15 Ensure SEC_PROTOCOL_ERROR_TRACE_ACTION Is Set to LOG' from dual;
select '2.3.15._STARTS' from dual;
show parameters 'SEC_PROTOCOL_ERROR_TRACE_ACTION';
select '2.3.15._ENDS' from dual;

select '2.3.16 Ensure SEC_RETURN_SERVER_RELEASE_BANNER Is Set to FALSE' from dual;
select '2.3.16._STARTS' from dual;
show parameters 'SEC_RETURN_SERVER_RELEASE_BANNER';
select '2.3.16._ENDS' from dual;

select '2.3.17 Ensure SQL92_SECURITY Is Set to TRUE' from dual;
select '2.3.17._STARTS' from dual;
show parameters 'SQL92_SECURITY';
select '2.3.17._ENDS' from dual;

select '2.3.18. Ensure_TRACE_FILES_PUBLIC Is Set to FALSE' from dual;
select '2.3.18._STARTS' from dual;
show parameters 'TRACE_FILES_PUBLIC';
select '2.3.18._ENDS' from dual;

select '2.3.19 Ensure RESOURCE_LIMIT Is Set to TRUE' from dual;
select '2.3.19._STARTS' from dual;
show parameters 'RESOURCE_LIMIT';
select '2.3.19._ENDS' from dual;

select '2.3.20. Ensure EXECUTE Is Revoked from PUBLIC on DBMS_ADVISOR' from dual;
select '2.3.20._STARTS' from dual;
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE='PUBLIC'
AND PRIVILEGE='EXECUTE'
AND TABLE_NAME='DBMS_ADVISOR';
select '2.3.20._ENDS' from dual;

select '2.3.21  Ensure EXECUTE Is Revoked from PUBLIC on DBMS_CRYPTO' from dual;
select '2.3.21._STARTS' from dual;
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE='PUBLIC'
AND TABLE_NAME='DBMS_CRYPTO';
select '2.3.21._ENDS' from dual;

select '2.3.22 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_JAVA' from dual;
select '2.3.22._STARTS' from dual;
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE='PUBLIC'
AND PRIVILEGE='EXECUTE'
AND TABLE_NAME='DBMS_JAVA';
select '2.3.22._ENDS' from dual;

select '2.3.23 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_SYS_SQL' from dual;
select '2.3.23._STARTS' from dual;
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE='PUBLIC'
AND PRIVILEGE='EXECUTE'
AND TABLE_NAME='DBMS_SYS_SQL';
select '2.3.23._ENDS' from dual;

select '2.3.24 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_BACKUP_RESTORE' from dual;
select '2.3.24._STARTS' from dual;
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE='PUBLIC'
AND PRIVILEGE='EXECUTE'
AND TABLE_NAME='DBMS_BACKUP_RESTORE';
select '2.3.24._ENDS' from dual;

select '2.3.25 Ensure EXECUTE Is Revoked from PUBLIC on WWV_DBMS_SQL' from dual;
select '2.3.25._STARTS' from dual;
SELECT PRIVILEGE
FROM DBA_TAB_PRIVS
WHERE GRANTEE='PUBLIC'
AND PRIVILEGE='EXECUTE'
AND TABLE_NAME='WWV_DBMS_SQL';
select '2.3.25._ENDS' from dual;


select '2.4.1. Ensure FAILED_LOGIN_ATTEMPTS Is Less than or Equal to 3'  from dual;
select '2.4.1._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select * from dba_profiles where resource_NAME='FAILED_LOGIN_ATTEMPTS';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.1._ENDS' from dual;

select '2.4.2. Ensure PASSWORD_LOCK_TIME Is Greater than or Equal to 1' from dual;
select '2.4.2._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_NAME='PASSWORD_LOCK_TIME' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.2._ENDS' from dual;

select '2.4.3. Ensure PASSWORD_LIFE_TIME Is Less than or Equal to 90' from dual;
select '2.4.3._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_NAME='PASSWORD_LIFE_TIME' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.3._ENDS' from dual;

select '2.4.4. Ensure PASSWORD_REUSE_MAX Is Greater than or Equal to 20' from dual;
select '2.4.4._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_NAME='PASSWORD_REUSE_MAX' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.4._ENDS' from dual;

select '2.4.5 Ensure PASSWORD_REUSE_TIME Is Greater than or Equal to 365' from dual;
select '2.4.5._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_NAME='PASSWORD_REUSE_TIME' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.5._ENDS' from dual;

select '2.4.6 Ensure PASSWORD_GRACE_TIME Is Less than or Equal to 5' from dual;
select '2.4.6._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_NAME='PASSWORD_GRACE_TIME' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.6._ENDS' from dual;

select '2.4.7. Ensure DBA_USERS.PASSWORD Is Not Set to EXTERNAL for Any User' from dual;
select '2.4.7._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_NAME='DBA_USERS.PASSWORD' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.7._ENDS' from dual;

select '2.4.8. Ensure PASSWORD_VERIFY_FUNCTION Is Set for All Profiles' from dual;
select '2.4.8._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_NAME='PASSWORD_VERIFY_FUNCTION' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.8._ENDS' from dual;

select '2.4.9. Ensure SESSIONS_PER_USER Is Less than or Equal to 10' from dual;
select '2.4.9._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_NAME='SESSIONS_PER_USER' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.9._ENDS' from dual;

select '2.4.10. Ensure No Users Are Assigned the DEFAULT Profile' from dual;
select '2.4.10._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_NAME='DEFAULT' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.4.10._ENDS' from dual;

select '2.5.1 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_JOB' from dual;
select '2.5.1._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_ADVISOR';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.1._ENDS' from dual;

select '2.5.2 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_LDAP' from dual;
select '2.5.2._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_LDAP';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.2._ENDS' from dual;

select '2.5.3 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_LOB' from dual;
select '2.5.3._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_LOB';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.3._ENDS' from dual;

select '2.5.4 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_OBFUSCATION_TOOLKIT' from dual;
select '2.5.4._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_OBFUSCATION_TOOLKIT';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.4._ENDS' from dual;

select '2.5.5 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_RANDOM' from dual;
select '2.5.5._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_RANDOM';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.5._ENDS' from dual;

select '2.5.6 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_SCHEDULAR' from dual;
select '2.5.6._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_SCHEDULAR';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.6._ENDS' from dual;

select '2.5.7 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_SQL' from dual;
select '2.5.7._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_SQL';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.7._ENDS' from dual;

select '2.5.8 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_XMLGEN' from dual;
select '2.5.8._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_XMLGEN';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.8._ENDS' from dual;

select '2.5.9 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_XMLQUERY' from dual;
select '2.5.9._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_XMLQUERY';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.9._ENDS' from dual;

select '2.5.10 Ensure EXECUTE Is Revoked from PUBLIC on UTL_FILE' from dual;
select '2.5.10._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='UTL_FILE';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.10._ENDS' from dual;

select '2.5.11 Ensure EXECUTE Is Revoked from PUBLIC on UTL_INADDR' from dual;
select '2.5.11._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='UTL_INADDR';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.11._ENDS' from dual;

select '2.5.12 Ensure EXECUTE Is Revoked from PUBLIC on UTL_TCP' from dual;
select '2.5.12._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='UTL_TCP';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.12._ENDS' from dual;

select '2.5.13 Ensure EXECUTE Is Revoked from PUBLIC on UTL_SMTP' from dual;
select '2.5.13._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='UTL_SMTP';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.13._ENDS' from dual;

select '2.5.14 Ensure EXECUTE Is Revoked from PUBLIC on UTL_HTTP' from dual;
select '2.5.14._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='UTL_HTTP';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.14._ENDS' from dual;

select '2.6.1 Ensure EXECUTE Is Revoked from PUBLIC on WWV_EXECUTE_IMMEDIATE' from dual;
select '2.6.1._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='WWV_EXECUTE_IMMEDIATE';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.6.1._ENDS' from dual;

select '2.6.2 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_IJOB' from dual;
select '2.6.2._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_IJOB';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.6.2._ENDS' from dual;

select '2.6.3 Ensure EXECUTE Is Revoked from PUBLIC on DBMS_FILE_TRANSFER' from dual;
select '2.6.3._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='DBMS_FILE_TRANSFER';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.6.3._ENDS' from dual;

select '2.7.1 Ensure SELECT_ANY_DICTIONARY Is Revoked from Unauthorized GRANTEE' from dual;
select '2.7.1._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='SELECT ANY DICTIONARY'
AND GRANTEE NOT IN ('DBA','DBSNMP','OEM_MONITOR','OLAPSYS','ORACLE_OCM','SYSMAN','WMSYS','SYSBACKUP','SYSDG');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.7.1_ENDS' from dual;

select '2.7.2 Ensure SELECT ANY TABLE Is Revoked from Unauthorized GRANTEE' from dual;
select '2.7.2_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='SELECT ANY TABLE' AND GRANTEE NOT IN ('DBA', 'MDSYS', 'SYS', 'IMP_FULL_DATABASE', 'EXP_FULL_DATABASE',
'DATAPUMP_IMP_FULL_DATABASE', 'WMSYS', 'SYSTEM','OLAP_DBA', 'DV_REALM_OWNER');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.7.2._ENDS' from dual;

select '2.7.3 Ensure AUDIT SYSTEM Is Revoked from Unauthorized GRANTEE' from dual;
select '2.7.3._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='AUDIT SYSTEM' AND GRANTEE NOT IN ('DBA','DATAPUMP_IMP_FULL_DATABASE','IMP_FULL_DATABASE',
'SYS','AUDIT_ADMIN');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.7.3._ENDS' from dual;

select '2.7.4 Ensure EXEMPT ACCESS POLICY Is Revoked from Unauthorized GRANTEE' from dual;
select '2.7.4._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='EXEMPT ACCESS POLICY';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.7.4._ENDS' from dual;

select '2.7.5 Ensure BECOME USER Is Revoked from Unauthorized GRANTEE' from dual;
select '2.7.5._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='BECOME USER' AND GRANTEE NOT IN ('DBA','SYS','IMP_FULL_DATABASE');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.7.5._ENDS' from dual;

select '2.7.6 Ensure GRANT ANY OBJECT PRIVILEGE Is Revoked from Unauthorized GRANTEE' from dual;
select '2.7.6._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='GRANT ANY OBJECT PRIVILEGE' AND GRANTEE NOT IN ('DBA','SYS','IMP_FULL_DATABASE','DATAPUMP_IMP_FULL_DATABASE',
'EM_EXPRESS_ALL','DV_REALM_OWNER');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.7.6._ENDS' from dual;

select '2.7.7 Ensure GRANT ANY ROLE Is Revoked from Unauthorized GRANTEE' from dual;
select '2.7.7._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='GRANT ANY ROLE' AND GRANTEE NOT IN ('DBA','SYS','DATAPUMP_IMP_FULL_DATABASE','IMP_FULL_DATABASE',
'SPATIAL_WFS_ADMIN_USR','SPATIAL_CSW_ADMIN_USR','GSMADMIN_INTERNAL','DV_REALM_OWNER', 'EM_EXPRESS_ALL','DV_OWNER');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.7.7._ENDS' from dual;

select '2.7.8 Ensure GRANT ANY PRIVILEGE Is Revoked from Unauthorized GRANTEE' from dual;
select '2.7.8._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='GRANT ANY PRIVILEGE' AND GRANTEE NOT IN ('DBA','SYS','IMP_FULL_DATABASE','DATAPUMP_IMP_FULL_DATABASE','DV_REALM_OWNER', 'EM_EXPRESS_ALL');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.7.8._ENDS' from dual;

select '2.8.1 Ensure DELETE_CATALOG_ROLE Is Revoked from Unauthorized GRANTEE' from dual;
select '2.8.1._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, GRANTED_ROLE FROM DBA_ROLE_PRIVS WHERE granted_role='DELETE_CATALOG_ROLE' AND GRANTEE NOT IN ('DBA','SYS');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.8.1._ENDS' from dual;

select '2.8.2 Ensure SELECT_CATALOG_ROLE Is Revoked from Unauthorized GRANTEE' from dual;
select '2.8.2._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, GRANTED_ROLE FROM DBA_ROLE_PRIVS WHERE granted_role='SELECT_CATALOG_ROLE' AND grantee not in ('DBA','SYS','IMP_FULL_DATABASE','EXP_FULL_DATABASE','OEM_MONITOR', 'SYSBACKUP','EM_EXPRESS_BASIC','SYSMAN');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.8.2._ENDS' from dual;

select '2.8.3 Ensure EXECUTE_CATALOG_ROLE Is Revoked from Unauthorized GRANTEE' from dual;
select '2.8.3._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select profile,resource_name,limit from dba_profiles where resource_name='FAILED_LOGIN_ATTEMPTS' order by profile,resource_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.8.3._ENDS' from dual;

select '2.8.4 Ensure DBA Is Revoked from Unauthorized GRANTEE' from dual;
select '2.8.4._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, GRANTED_ROLE FROM DBA_ROLE_PRIVS WHERE GRANTED_ROLE='DBA' AND GRANTEE NOT IN ('SYS','SYSTEM');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.8.4._ENDS' from dual;

select '2.8.5 Ensure ALL Is Revoked from Unauthorized GRANTEE on AUD$' from dual;
select '2.8.5._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_TAB_PRIVS WHERE TABLE_NAME='AUD$' AND GRANTEE NOT IN ('DELETE_CATALOG_ROLE');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.8.5._ENDS' from dual;

select '2.8.6 Ensure ALL Is Revoked from Unauthorized GRANTEE on SYS.USER$' from dual;
select '2.8.6._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE
FROM DBA_TAB_PRIVS WHERE TABLE_NAME='USER$' AND OWNER='SYS' AND GRANTEE NOT IN ('CTXSYS','XDB','APEX_030200','SYSMAN','APEX_040000','APEX_040100','APEX_040200','DV_SECANALYST','DVSYS','ORACLE_OCM');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.8.6._ENDS' from dual;

select '2.8.7 Ensure the CREATE SYNONYM Action Audit Is Enabled' from dual;
select '2.8.7._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT AUD.POLICY_NAME, AUD.AUDIT_OPTION, AUD.AUDIT_OPTION_TYPE
FROM AUDIT_UNIFIED_POLICIES AUD, AUDIT_UNIFIED_ENABLED_POLICIES ENABLED
WHERE AUD.POLICY_NAME = ENABLED.POLICY_NAME
AND AUD.AUDIT_OPTION = 'CREATE SYNONYM'
AND AUD.AUDIT_OPTION_TYPE = 'STANDARD ACTION'
AND ENABLED.SUCCESS = 'YES'
AND ENABLED.FAILURE = 'YES'
AND ENABLED.ENABLED_OPT = 'BY'
AND ENABLED.USER_NAME = 'ALL USERS';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.8.7._ENDS' from dual;

select '2.8.8  Ensure the UNIFIED_AUDIT_TRAIL Access Audit Is Enabled' from dual;
select '2.8.8._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT AUD.POLICY_NAME, AUD.AUDIT_OPTION, AUD.AUDIT_OPTION_TYPE
FROM AUDIT_UNIFIED_POLICIES AUD, AUDIT_UNIFIED_ENABLED_POLICIES ENABLED
WHERE AUD.POLICY_NAME = ENABLED.POLICY_NAME
AND AUD.AUDIT_OPTION = 'ALL'
AND AUD.AUDIT_OPTION_TYPE = 'OBJECT ACTION'
AND AUD.OBJECT_SCHEMA = 'SYS'
AND AUD.OBJECT_NAME = 'UNIFIED_AUDIT_TRAIL'
AND ENABLED.SUCCESS = 'YES'
AND ENABLED.FAILURE = 'YES'
AND ENABLED.ENABLED_OPT = 'BY'
AND ENABLED.USER_NAME = 'ALL USERS';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.8.8._ENDS' from dual;

select '2.8.9 Ensure the LOGON AND LOGOFF Actions Audit Is Enabled' from dual;
select '2.8.9._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT *
FROM AUDIT_UNIFIED_ENABLED_POLICIES ENABLED
WHERE ENABLED.SUCCESS = 'YES'
AND ENABLED.FAILURE = 'YES'
AND ENABLED.ENABLED_OPT = 'BY'
AND ENABLED.USER_NAME = 'ALL USERS'
AND EXISTS ( SELECT 'x' FROM AUDIT_UNIFIED_POLICIES AUD WHERE AUD.POLICY_NAME = ENABLED.POLICY_NAME AND AUD.AUDIT_OPTION = 'LOGON' AND AUD.AUDIT_OPTION_TYPE = 'STANDARD ACTION')
AND EXISTS ( SELECT 'x' FROM AUDIT_UNIFIED_POLICIES AUD WHERE AUD.POLICY_NAME = ENABLED.POLICY_NAME AND AUD.AUDIT_OPTION = 'LOGOFF' AND AUD.AUDIT_OPTION_TYPE = 'STANDARD ACTION');
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.8.9._ENDS' from dual;

select '2.9.1 Ensure EXECUTE ANY PROCEDURE Is Revoked from OUTLN' from dual;
select '2.9.1._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='EXECUTE ANY PROCEDURE' AND GRANTEE='OUTLN';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.9.1._ENDS' from dual;

select '2.9.2 Ensure EXECUTE ANY PROCEDURE Is Revoked from DBSNMP' from dual;
select '2.9.2._STARTS' from dual;
SELECT GRANTEE, PRIVILEGE FROM DBA_SYS_PRIVS WHERE PRIVILEGE='EXECUTE ANY PROCEDURE' AND GRANTEE='DBSNMP';
select '2.9.2._ENDS' from dual;

select '3.1.1 Enable USER Audit Option' from dual;
select '3.1.1._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.1._ENDS' from dual;

select '3.1.2 Enable ALTER USER Audit Option' from dual;
select '3.1.2._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.2._ENDS' from dual;

select '3.1.3 Enable DROP USER Audit Option' from dual;
select '3.1.3._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.3._ENDS' from dual;

select '3.1.4 Enable SYSTEM GRANT Audit Option' from dual;
select '3.1.4._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.4._ENDS' from dual;

select '3.1.5 Enable PROFILE Audit Option' from dual;
select '3.1.5._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.5._ENDS' from dual;

select '3.1.6 Enable ALTER PROFILE Audit Option' from dual;
select '3.1.6._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.6._ENDS' from dual;

select '3.1.7 Enable DROP Profile Audit Option' from dual;
select '3.1.7._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.7._ENDS' from dual;

select '3.1.8 Enable DATABASE LINK Audit Option' from dual;
select '3.1.8._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.8._ENDS' from dual;

select '3.1.9 Enable PUBLIC DATABASE LINK Audit Option' from dual;
select '3.1.9._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.9._ENDS' from dual;

select '3.1.10 Enable PUBLIC SYNONYM Audit Option' from dual;
select '3.1.10._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.10._ENDS' from dual;

select '3.1.11 Enable SYNONYM Audit Option' from dual;
select '3.1.11._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.11._ENDS' from dual;

select '3.1.12 Enable GRANT DIRECTORY Audit Option' from dual;
select '3.1.12._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.12._ENDS' from dual;

select '3.1.13 Enable SELECT ANY DICTIONARY Audit Option' from dual;
select '3.1.13._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.13._ENDS' from dual;

select '3.1.14 Enable GRANT ANY OBJECT PRIVILEGE Audit Option' from dual;
select '3.1.14._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.14._ENDS' from dual;

select '3.1.15 Enable GRANT ANY PRIVILEGE Audit Option' from dual;
select '3.1.15._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.15._ENDS' from dual;

select '3.1.16 Enable DROP ANY PROCEDURE Audit Option' from dual;
select '3.1.16._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.16._ENDS' from dual;

select '3.1.17  Enable ALL Audit Option on SYS.AUD$' from dual;
select '3.1.17._STARTS' from dual;
set head on
set lines 450
col profile format a300
col resource_name format a400
col limit format a100
SELECT * FROM DBA_OBJ_AUDIT_OPTS;
col profile clear 
col resource_name clear
col limit clear
set head off
select '3.1.17._ENDS' from dual;

select '3.1.18 Enable PROCEDURE Audit Option' from dual;
select '3.1.18._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.18._ENDS' from dual;

select '3.1.19 Enable ALTER SYSTEM Audit Option' from dual;
select '3.1.19._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.19._ENDS' from dual;

select '3.1.20 Enable TRIGGER Audit Option' from dual;
select '3.1.20._STARTS' from dual;
SELECT AUDIT_OPTION, SUCCESS, FAILURE FROM DBA_STMT_AUDIT_OPTS;
select '3.1.20._ENDS' from dual;


set recsep off
spool off

--------------Operating System Audit Script Generation
set head off
set feed off
set verify off

set lines 300
spool host.bat


select '@echo off' from dual;
select 'Rem -n removes numbering' from dual;
select 'Rem -r displays msgs to stderr' from dual;
select 'Echo Please enter the Oracle Home and press CTRL+Z and then ENTER to continue&' from dual;
select 'copy con temp0.txt > null&' from dual;
select 'setlocal&' from dual;
select 'for /f "delims=" %%d in (temp0.txt) do set orahome=%%d&' from dual;
select 'Echo.>>Oracle12C_Windows.txt&' from dual;
select 'Echo %orahome% >> oraclehome.txt&' from dual;
select 'Echo HOSTNAME>>Oracle12C_Windows.txt&' from dual;
select 'Echo.>>Oracle12C_Windows.txt&' from dual;
select 'hostname >>Oracle12C_Windows.txt&' from dual;

select 'Echo.>>Oracle12C_Windows.txt&' from dual;
select 'Echo.>>Oracle12C_Windows.txt&' from dual;

select 'endlocal&' from dual;

spool off

host host

set termout on

host cp.bat

