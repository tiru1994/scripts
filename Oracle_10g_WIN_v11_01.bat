@echo off
rem -------------------------------------------------------------
rem Oracle 10g audit script - operating system side
rem copyright (c) Deloitte Touche Tohmatsu India LLP (c) 2021
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
rem -------------------------------------------------------------------------
rem Upon termination, 11 WIN*.txt files will be created in the same directory 
rem from where the script was executed.
rem -------------------------------------------------------------------------

echo Enter the ORACLE_HOME path,
echo for example, c:\oracle\product\10.2.0\db_1
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
dir/s %ORACLE_HOME%\..\.. > WINdir.txt
cacls %ORACLE_HOME%\..\..\* /T > WINcacls.txt

echo Obtaining listener file(s)...
set lfile=%curdir%\WINlistener.txt
cd %ORACLE_HOME%\NETWORK\ADMIN
echo Listener files (ignore SAMPLE): > %lfile%
for /D /r %%i in (listener.ora) DO echo ----------- >> %lfile% & echo Filename: %%i >> %lfile% & echo ----------- >> %lfile% & type %%i >> %lfile%
cd %curdir%

echo Obtaining init*.ora and SP*.ora file(s)...
set ifile=%curdir%\WINinitora.txt
cd %ORACLE_HOME%\database
echo initSID.ora and SP files: > %ifile%
for %%i in (init*.ora) DO echo ----------- >> %ifile% & echo Filename: %%i >> %ifile% & echo ----------- >> %ifile% & type %%i >> %ifile%
cd %ORACLE_HOME%\dbs
for %%i in (sp*.ora) DO echo ----------- >> %ifile% & echo Filename: %%i >> %ifile% & echo ----------- >> %ifile% & type %%i >> %ifile%
cd %curdir%

echo SCRIPT FINISHED.