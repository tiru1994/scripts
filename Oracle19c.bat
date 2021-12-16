echo Enter the ORACLE_HOME path,
echo for example, c:\oracle\product\10.2.0\db_1
set /p homedir=
set curdir=%CD%

Echo Oracle 19c Configuration Interrogation Script>> Oracle19c_win_output.txt
Echo. >> Oracle19c_win_output.txt


Echo The Name of the System >> Oracle19c_win_output.txt
Echo ---------------------- >> Oracle19c_win_output.txt
hostname >> Oracle19c_win_output.txt

Echo. >> Oracle19c_win_output.txt


Echo Today's Date  >> Oracle19c_win_output.txt
Echo ------------  >> Oracle19c_win_output.txt
date /t >> Oracle19c_win_output.txt
Echo. >> Oracle19c_win_output.txt

Echo The file created at >> Oracle19c_win_output.txt
Echo ------------------- >> Oracle19c_win_output.txt
time /t >> Oracle19c_win_output.txt

Echo. >> Oracle19c_win_output.txt

Echo The Operating System of the Server >> Oracle19c_win_output.txt
Echo ---------------------------------- >> Oracle19c_win_output.txt
Echo. >> Oracle19c_win_output.txt
ver >> Oracle19c_win_output.txt

echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo Listener file name - WINlistener.txt>> Oracle19c_win_output.txt
echo sqlnet file name - WINsqlnetora.txt>> Oracle19c_win_output.txt
Echo init and sp files - WINdbsfiles.txt>> Oracle19c_win_output.txt
echo Oracle directory permission - Oracle19c_permissions >> Oracle19c_win_output.txt

echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo 2.1.1 Insecure Oracle database release >> Oracle19c_win_output.txt
set ORACLE_HOME=%homedir%
call %ORACLE_HOME%\OPatch\opatch.bat lsinventory >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo 2.1.2. Unlimited access to tkprof utility >> Oracle19c_win_output.txt
cacls %ORACLE_HOME%\bin\tkprof.exe  >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt


echo 2.1.4 Change standard ports >> Oracle19c_win_output.txt
lsnrctl status >> Oracle19c_win_output.txt
echo Obtaining listener file(s)...
set lfile=%curdir%\WINlistener.txt
cd %ORACLE_HOME%\NETWORK\ADMIN
echo Listener files (ignore SAMPLE): > %lfile%
for /D /r %%i in (listener.ora) DO echo ----------- >> %lfile% & echo Filename: %%i >> %lfile% & echo ----------- >> %lfile% & type %%i >> %lfile%
cd %curdir%
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo 2.2.1 Weak Permission on Oracle Directories >> Oracle19c_permissions.txt
cacls %ORACLE_HOME%\..\..\* /T >> Oracle19c_permissions.txt


echo 2.2.2 Weak Permission on critical Oracle files >> Oracle19c_win_output.txt
cacls %ORACLE_HOME%\network\admin\listener.ora >> Oracle19c_win_output.txt
cacls %ORACLE_HOME%\bin >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo 2.2.4 Integration of Active Directory Services with Oracle Database >> Oracle19c_win_output.txt
echo Manual check >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo 2.2.5 Authentication and Certification Parameters >> Oracle19c_win_output.txt
echo Refer Winsqlnetora.txt file >> Oracle19c_win_output.txt
echo Obtaining sqlnet.ora...
set ifile=%curdir%\WINsqlnetora.txt
cd %ORACLE_HOME%\network\admin
echo sqlnet.ora: > %ifile%
for %%i in (sqlnet.ora) DO echo ----------- >> %ifile% & echo Filename: %%i >> %ifile% & echo ----------- >> %ifile% & type %%i >> %ifile%
cd %curdir%
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo 2.3.5. Http and ftp access to the oracle database >> Oracle19c_win_output.txt
echo Refer Winlistener file >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo 2.6.2 Ensure extproc Is Not Present in listener.ora >> Oracle19c_win_output.txt
FIND /I "extproc" %ORACLE_HOME%\network\admin\listener.ora >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo 2.8.1. Change standard ports >> Oracle19c_win_output.txt
echo Refer Winlistener file >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo 2.8.5 Support for Oracle Native Encryption and SSL Authentication >> Oracle19c_win_output.txt
echo Refer Winsqlnetora.txt file >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt
echo. >> Oracle19c_win_output.txt

echo Obtaining init*.ora and SP*.ora file(s)...
set sfile=%curdir%\WINdbsfiles.txt
cd %ORACLE_HOME%\database
echo initSID.ora and SP files: > %sfile%
for %%i in (init*.ora) DO echo ----------- >> %sfile% & echo Filename: %%i >> %sfile% & echo ----------- >> %sfile% & type %%i >> %sfile%
cd %ORACLE_HOME%\dbs
for %%i in (*.ora) DO echo ----------- >> %sfile% & echo Filename: %%i >> %sfile% & echo ----------- >> %sfile% & type %%i >> %sfile%
cd %curdir%