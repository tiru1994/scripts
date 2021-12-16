set termout off
spool Oracle19C_Windows.txt
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
select * from sys.registry$history;
col name clear
col value clear
set head off
select '2.1.1_ENDS' from dual;

select '2.1.3. Default database users' from dual;
select '2.1.3_STARTS' from dual;
set head on
col name format A25
col value format A15
select USERNAME, ACCOUNT_STATUS, PROFILE from DBA_USERS;
col name clear
col value clear
set head off
select '2.1.3_ENDS' from dual;

col desc format a50
select '2.1.5 Ensure All Default Passwords Are Changed' from dual;
select '2.1.5_STARTS' from dual;
set head on
col name format A25
col value format A15
select * from dba_users_with_defpwd;
col name clear
col value clear
set head off
select '2.1.5._ENDS' from dual;

col desc format a50
select '2.1.6. Presence of external users' from dual;
select '2.1.6_STARTS' from dual;
set head on
col name format A25
col value format A15
SELECT username, authentication_type from DBA_USERS where authentication_type = 'EXTERNAL';
col name clear
col value clear
set head off
select '2.1.6._ENDS' from dual;


col desc format a50
select '2.3.1. Remote OS authentication' from dual;
select '2.3.1_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'remote_os_authent';
col name clear
col value clear
set head off
select '2.3.1._ENDS' from dual;

col desc format a50
select '2.3.2. Remote OS roles' from dual;
select '2.3.2_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'remote_os_roles';
col name clear
col value clear
set head off
select '2.3.2._ENDS' from dual;


col desc format a50
select '2.3.6. Lack of auditing for SYSDBA and SYSOPER roles' from dual;
select '2.3.6_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'audit_sys_operations';
col name clear
col value clear
set head off
select '2.3.6._ENDS' from dual;

col desc format a50
select '2.3.7. Insecure remote login settings' from dual;
select '2.3.7_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'remote_login_passwordfile';
col name clear
col value clear
set head off
select '2.3.7._ENDS' from dual;

select '2.4.1. Appropriate user profiles should be set SEC_RETURN_SERVER_RELEASE_BANNER is set to false' from dual;
select '2.4.1_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'sec_return_server_release_banner';
col name clear
col value clear
set head off
select '2.4.1_ENDS' from dual;

select '2.4.2. DB_SECUREFILE is set to ALWAYS' from dual;
select '2.4.2_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'db_securefile';
col name clear
col value clear
set head off
select '2.4.2_ENDS' from dual;

select '2.4.3. SEC_CASE_SENSITIVE_LOGON is set to TRUE' from dual;
select '2.4.3_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'sec_case_sensitive_logon';
col name clear
col value clear
set head off
select '2.4.3_ENDS' from dual;

select '2.4.4. SEC_MAX_FAILED_LOGIN_ATTEMPTS is set to 3' from dual;
select '2.4.4_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'sec_max_failed_login_attempts';
col name clear
col value clear
set head off
select '2.4.4_ENDS' from dual;

select '2.4.5. SEC_PROTOCOL_ERROR_FURTHER_ACTION is set to DELAY or DROP' from dual;
select '2.4.5_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'sec_protocol_error_further_action';
col name clear
col value clear
set head off
select '2.4.5_ENDS' from dual;

select '2.4.6. SEC_PROTOCOL_ERROR_TRACE_ACTION is set to LOG or ALERT' from dual;
select '2.4.6_STARTS' from dual;
set head on
col name format A25
col value format A15
select VALUE from v$parameter where NAME = 'sec_protocol_error_trace_action';
col name clear
col value clear
set head off
select '2.4.6_ENDS' from dual;

select '2.4.7. Failed login attempts' from dual;
select '2.4.7_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select PROFILE, RESOURCE_NAME, LIMIT from DBA_PROFILES WHERE RESOURCE_NAME = 'FAILED_LOGIN_ATTEMPTS';
col profile format clear
col resource_name format clear
col limit format clear
set head off
select '2.4.7_ENDS' from dual;

select '2.4.8. Password Life time ' from dual;
select '2.4.8_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select PROFILE, RESOURCE_NAME, LIMIT from DBA_PROFILES WHERE RESOURCE_NAME = 'PASSWORD_LIFE_TIME';
col profile  clear
col resource_name  clear
col limit  clear
set head off
select '2.4.8_ENDS' from dual;

select '2.4.9. Password reuse max' from dual;
select '2.4.9_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='PASSWORD_REUSE_MAX';
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='PASSWORD_REUSE_TIME';
col profile  clear
col resource_name  clear
col limit  clear
set head off
select '2.4.9_ENDS' from dual;

select '2.4.10. Password lock time ' from dual;
select '2.4.10_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='PASSWORD_LOCK_TIME';
col profile  clear
col resource_name  clear
col limit  clear
set head off
select '2.4.10_ENDS' from dual;

select '2.4.11. Password grace time ' from dual;
select '2.4.11_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='PASSWORD_GRACE_TIME';
col profile  clear
col resource_name  clear
col limit  clear
set head off
select '2.4.11_ENDS' from dual;

select '2.4.12. Password verify function ' from dual;
select '2.4.12_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='PASSWORD_VERIFY_FUNCTION';
col profile  clear
col resource_name clear
col limit  clear
set head off
select '2.4.12_ENDS' from dual;

select '2.4.13. User profile settings ‘CPU_PER_SESSION' from dual;
select '2.4.13_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='CPU_PER_SESSION';
col profile  clear
col resource_name  clear
col limit clear
set head off
select '2.4.13_ENDS' from dual;

select '2.4.14. User profile settings ‘PRIVATE_SGA’ ' from dual;
select '2.4.14_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='PRIVATE_SGA';
col profile  clear
col resource_name  clear
col limit  clear
set head off
select '2.4.14_ENDS' from dual;

select '2.4.15. Set LOGICAL_READS_PER_SESSION as appropriate ' from dual;
select '2.4.15_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='LOGICAL_READS_PER_SESSION';
col profile  clear
col resource_name  clear
col limit  clear
set head off
select '2.4.15_ENDS' from dual;



select '2.4.16 all accounts, except for application and process related accounts are restricted to a single, concurrent login' from dual;
select '2.4.16_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='SESSIONS_PER_USER';
col profile  clear
col resource_name  clear
col limit  clear
set head off
select '2.4.16_ENDS' from dual;


select '2.4.17. Users profile settings CONNECT_TIME' from dual;
select '2.4.17_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='CONNECT_TIME';
col profile  clear
col resource_name  clear
col limit  clear
set head off
select '2.4.17_ENDS' from dual;


select '2.4.18. Users profile settings IDLE_TIME' from dual;
select '2.4.18_STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT * FROM DBA_PROFILES where RESOURCE_NAME ='IDLE_TIME';
col profile  clear
col resource_name  clear
col limit  clear
set head off
select '2.4.18_ENDS' from dual;



select '2.5.1. Temporary and Default Tablespace Management ' from dual;
select '2.5.1_STARTS' from dual;
set head on
col name format A25
col value format A15
SELECT USERNAME, DEFAULT_TABLESPACE, TEMPORARY_TABLESPACE, ACCOUNT_STATUS from DBA_USERS;
col name clear
col value clear
set head off
select '2.4.18_ENDS' from dual;

select '2.5.2. Prevent access to ALL_SOURCE' from dual;
select '2.5.2._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT PRIVILEGE FROM DBA_TAB_PRIVS WHERE GRANTEE='PUBLIC' AND PRIVILEGE='EXECUTE' AND TABLE_NAME='ALL_SOURCE';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.2._ENDS' from dual;

select '2.5.3. Free disk space for Tablespaces ' from dual;
select '2.5.3._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
select df.tablespace_name "Tablespace",
totalusedspace "Used MB",
(df.totalspace - tu.totalusedspace) "Free MB",
df.totalspace "Total MB",
round(100 * ( (df.totalspace - tu.totalusedspace)/ df.totalspace))
"Pct. Free"
from
(select tablespace_name,
round(sum(bytes) / 1048576) TotalSpace
from dba_data_files
group by tablespace_name) df,
(select round(sum(bytes)/(1024*1024)) totalusedspace, tablespace_name
from dba_segments
group by tablespace_name) tu
where df.tablespace_name = tu.tablespace_name;
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.3._ENDS' from dual;

select '2.5.4. Prevent assignment of DBA ' from dual;
select '2.5.4._STARTS' from dual;
set head on
col profile format a30
col resource_name format a40
col limit format a10
SELECT GRANTEE, GRANTED_ROLE from DBA_ROLE_PRIVS where GRANTED_ROLE= 'DBA';
col profile clear 
col resource_name clear
col limit clear
set head off
select '2.5.4._ENDS' from dual;

select '2.6.1. Presence of dormant accounts_STARTS' from dual;
select '2.6.1._STARTS' from dual;
set head on
col name format A25
col value format A15
select username, account_status, last_login FROM DBA_USERS;
col name clear
col value clear
set head off
select '2.6.1._ENDS' from dual;

select '2.7.1. Lack of detailed audit settings ' from dual;
select '2.7.1._STARTS' from dual;
set head on
col audit_option format A35
SELECT * FROM AUDIT_UNIFIED_ENABLED_POLICIES;
select AUDIT_OPTION, POLICY_NAME from AUDIT_UNIFIED_POLICIES;
col audit_option clear
set head off
select '2.7.1._ENDS' from dual;

select '2.7.2 SYSLOG auditing' from dual;
select '2.7.2._STARTS' from dual;
set head on
col name format A25
col value format A15
select value FROM v$parameter where NAME = 'unified_audit_systemlog';
show parameter audit;
col name clear
col value clear
set head off
select '2.7.2._ENDS' from dual;

select '2.8.2. Encrypt Sensitive Credential Data in the Data Dictionary' from dual;
select '2.8.2._STARTS' from dual;
set head on
col name format A25
col value format A15
select * from dictionary_credentials_encrypt;
col name clear
col value clear
set head off
select '2.8.2._ENDS' from dual;

select '2.8.3 Signature-Based Security for LOB Locators' from dual;
select '2.8.3._STARTS' from dual;
set head on
col name format A25
col value format A15
select * from dictionary_credentials_encrypt;
col name clear
col value clear
set head off
select '2.8.3._ENDS' from dual;

select '2.8.6. Support for Additional Algorithms for Offline Tablespace Encryption' from dual;
select '2.8.6._STARTS' from dual;
set head on
col name format A25
col value format A15
select * from V$ENCRYPTED_TABLESPACES;
col name clear
col value clear
set head off
select '2.8.6._ENDS' from dual;

select '2.8.7 Verify the type of encryption used.' from dual;
select '2.8.7._STARTS' from dual;
set head on
col name format A25
col value format A15
select * from V$DATABASE_KEY_INFO;
col name clear
col value clear
set head off
select '2.8.7._ENDS' from dual;

quit;

spool off



