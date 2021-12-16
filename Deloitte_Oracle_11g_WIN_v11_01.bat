@echo off
rem -------------------------------------------------------------
rem Oracle 11g OS-side audit script
rem copyright (c) Deloitte Touche Tohmatsu India LLP (c) 2021
rem -------------------------------------------------------------
rem Operational instructions to the client:
rem
rem It is the client’s responsibility to perform the following 
rem steps prior to execution of the script in the production 
rem environment:
rem 
rem a) Scrutinize the contents of these scripts to ensure that they 
rem    do not contain statements, commands or other code that might 
rem    negatively influence the environment(s) in either a 
rem    security or operational way.
rem    
rem b) Test the scripts on the test environment to ensure that they 
rem    do not contain statements, commands or other code that might 
rem    negatively influence the environment(s) in either a security 
rem    or operational way.
rem    
rem c) The final responsibility for executing this script lies with 
rem    the client.  
rem 
rem d) It is advised to execute the script during off-peak hours.
rem -------------------------------------------------------------------------

echo ----------------------------------------------------------------------------
echo Upon termination, 13 text files will be created in this directory. 
echo Copy these files and share with Deloitte Team.
echo ----------------------------------------------------------------------------

echo Enter the ORACLE_HOME path,
echo for example, C:\app\Administrator\product\11.2.0\dbhome_1
set /p homedir=
set curdir=%CD%

echo Obtaining system information...
net accounts > WINaccounts.txt
net start > WINservices.txt
net user > WINusers.txt
net localgroup > WINlocalgroup.txt
schtasks > WINschtasks.txt
systeminfo > WINsysteminfo.txt

echo Obtaining list of Oracle patches...
set ORACLE_HOME=%homedir%
call %ORACLE_HOME%\OPatch\opatch.bat lsinventory > WINopatch.txt

echo Obtaining file permissions for Oracle data and programs...
dir/s %ORACLE_HOME%\..\..\.. > WINdir.txt
cacls %ORACLE_HOME%\..\..\..\* /T > WINcacls.txt

echo Obtaining listener file(s)...
set lfile=%curdir%\WINlistener.txt
cd %ORACLE_HOME%\NETWORK\ADMIN
echo Listener files (ignore SAMPLE): > %lfile%
for /D /r %%i in (listener.ora) DO echo ----------- >> %lfile% & echo Filename: %%i >> %lfile% & echo ----------- >> %lfile% & type %%i >> %lfile%
cd %curdir%

echo Obtaining listener information...
%ORACLE_HOME%/bin/lsnrctl.exe status > WINlistener_status.txt
%ORACLE_HOME%/bin/lsnrctl.exe show log_status > WINlistener_log.txt

echo Obtaining init*.ora and SP*.ora file(s)...
set ifile=%curdir%\WINinitora.txt
cd %ORACLE_HOME%\database
echo initSID.ora and SP files: > %ifile%
for %%i in (init*.ora) DO echo ----------- >> %ifile% & echo Filename: %%i >> %ifile% & echo ----------- >> %ifile% & type %%i >> %ifile%
cd %ORACLE_HOME%\dbs
for %%i in (sp*.ora) DO echo ----------- >> %ifile% & echo Filename: %%i >> %ifile% & echo ----------- >> %ifile% & type %%i >> %ifile%
cd %curdir%

echo SCRIPT FINISHED.