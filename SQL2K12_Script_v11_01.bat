rem Type - Configuration Audit Script

@echo off

del %computername%_SQL2K12.txt
CLS
echo "Refreshed by Deloitte"
Echo Audit Script for SQL Server 2012 is running. Kindly wait for the script to terminate.

Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_00 - Hostname, IP Address, Date and Time of Execution>> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo Script Version >> %computername%_SQL2K12.txt
Echo.  >> %computername%_SQL2K12.txt
Echo SCRIPT VERSION - 1.0 >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo Hostname >> %computername%_SQL2K12.txt
hostname >> hostname.txt
for /f %%a in (hostname.txt) do set hostname=%%a
Echo %hostname% >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo IP Address >> %computername%_SQL2K12.txt
ipconfig /all>> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo Script Execution Date >> %computername%_SQL2K12.txt
date /t >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo Script Execution Start Time >> %computername%_SQL2K12.txt
time /t >> %computername%_SQL2K12.txt




Echo Operating System and Network Specific Configurations >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_01 - Location of Program Files,Data Files and Transaction log Files >>%computername%_SQL2K12.txt
Echo Enter the SQL Instance name and press CTRL+Z and then ENTER to continue
copy con temp0.txt > null
setlocal
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
if /I %sqlpath% EQU MSSQLSERVER ( reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\%sqlpath%\Setup" /v SQLPath >> %computername%_SQL2K12.txt ) else ( reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlpath%\Setup" /v SQLPath >> %computername%_SQL2K12.txt )
endlocal
Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
setlocal
for /f %%a in (hostname.txt) do set hostname=%%a
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
if /I %sqlpath% EQU MSSQLSERVER ( OSQL -E -s"|" -w 20000 -n -i sql1.sql  >> %computername%_SQL2K12.txt ) else ( OSQL -E -S %hostname%\%sqlpath% -s"|" -w 20000 -n -i sql1.sql  >> %computername%_SQL2K12.txt )
endlocal



Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_02 - MSSQL server service account>> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
setlocal
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
if /I %sqlpath% EQU MSSQLSERVER ( sc qc %sqlpath% | find /I "SERVICE_START_NAME" >> %computername%_SQL2K12.txt ) else ( sc qc mssql$%sqlpath% | find /I "SERVICE_START_NAME" >> %computername%_SQL2K12.txt )
endlocal




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_03 -  MSSQL Server service account rights>> %computername%_SQL2K12.txt
setlocal
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
if /I %sqlpath% EQU MSSQLSERVER ( sc qc %sqlpath% | find /I "SERVICE_START_NAME" >> %computername%_SQL2K12.txt ) else ( sc qc mssql$%sqlpath% | find /I "SERVICE_START_NAME" >> %computername%_SQL2K12.txt )
endlocal
DumpSec  /rpt=rights /saveas=fixed /outfile=account_rights.txt>> %computername%_SQL2K12.txt
copy %computername%_SQL2K12.txt + account_rights.txt %computername%_SQL2K12.txt
del account_rights.txt




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_04 - SQL Server Agent service account rights>> %computername%_SQL2K12.txt
setlocal
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
if /I %sqlpath% EQU MSSQLSERVER ( sc qc %sqlpath% | find /I "SERVICE_START_NAME" >> %computername%_SQL2K12.txt ) else ( sc qc mssql$%sqlpath% | find /I "SERVICE_START_NAME" >> %computername%_SQL2K12.txt )
endlocal
DumpSec  /rpt=rights /saveas=fixed /outfile=agentaccount_rights.txt>> %computername%_SQL2K12.txt
copy %computername%_SQL2K12.txt + agentaccount_rights.txt %computername%_SQL2K12.txt
del agentaccount_rights.txt


Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_05 - SQL Servers accessed via Internet>> %computername%_SQL2K12.txt
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\Instance Names\SQL" >> test.txt
findstr /I %sqlpath% test.txt >> test1.txt
for /f "tokens=3" %%d in (test1.txt) do set sqlinst=%%d
Echo SQL2K12_05 - TCP Port>> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlinst%\MSSQLServer\SuperSocketNetLib\TCP\IP1" | find "TcpPort" >> %computername%_SQL2K12.txt
Echo SQL2K12_05 - UDP Port>> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlinst%\MSSQLServer\SuperSocketNetLib\UDP" | find "UdpPort" >> %computername%_SQL2K12.txt


Echo SQL2K12_06 - SQL Client server traffic  Encryption>> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt 
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlinst%\MSSQLServer\SuperSocketNetLib" | find "ForceEncryption" >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt



Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_07 - SQL Volume / partition type>> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo System Drive >> %computername%_SQL2K12.txt
Echo %systemroot% >> %computername%_SQL2K12.txt
psinfo -d  >> %computername%_SQL2K12.txt
Echo end >> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\DASHBOARD\Setup" /v SQLPath > temp.txt
findstr SQLPath temp.txt > temp2.txt
for /f "tokens=3" %%a in (temp2.txt) do set sqlroot=%%a
showacls "%sqlroot%" >> %computername%_SQL2K12.txt
del temp.txt
del temp2.txt
Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt






Echo SQL Server Installation and Patches >> %computername%_SQL2K12.txt

Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_08 - SQL Server Ports>> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlinst%\MSSQLServer\SuperSocketNetLib\TCP\IP1" | find "TcpPort" >> %computername%_SQL2K12.txt




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_09 - Authentication Mode >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlinst%\MSSQLServer" | find "LoginMode" >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt



Echo SQL Server Settings>> %computername%_SQL2K12.txt

Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_14 - SQL Server Configuration Manager>> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlinst%\MSSQLServer\SuperSocketNetLib\Np" | find "Enabled" >> %computername%_SQL2K12.txt




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_15 - Auto restart SQL server>> %computername%_SQL2K12.txt
setlocal
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
if /I %sqlpath% EQU MSSQLSERVER ( sc qc %sqlpath% | find /I "START_TYPE" >> %computername%_SQL2K12.txt ) else ( sc qc mssql$%sqlpath% | find /I "START_TYPE" >> %computername%_SQL2K12.txt )
endlocal




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_16 - Auto restart SQL server agent>> %computername%_SQL2K12.txt
setlocal
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
if /I %sqlpath% EQU MSSQLSERVER ( sc qc SQLServerAgent | find /I "START_TYPE" >> %computername%_SQL2K12.txt ) else ( sc qc sqlagent$%sqlpath% | find /I "START_TYPE" >> %computername%_SQL2K12.txt )
endlocal




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_17 Distributed Transaction Coordinator>> %computername%_SQL2K12.txt
sc qc MSDTC | find /I "START_TYPE">> %computername%_SQL2K12.txt




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_19 Backup/Restore from tape timeout>> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlinst%\MSSQLServer" | find "Tapeloadwaittime" >> %computername%_SQL2K12.txt 




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_21 Error Logs Configurations >> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Microsoft SQL Server\%sqlinst%\MSSQLServer" | find "NumErrorLogs">> %computername%_SQL2K12.txt




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_23 Trace messages >> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Microsoft SQL Server\%sqlinst%\SQLServerAgent" | find "ErrorLoggingLevel">> %computername%_SQL2K12.txt




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_30 Event Forwarding to different Servers>> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Microsoft SQL Server\%sqlinst%\SQLServerAgent" | find "AlertForwardAlways">> %computername%_SQL2K12.txt




Echo Access Control>> %computername%_SQL2K12.txt

Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_31 SQL server install directory permission>> %computername%_SQL2K12.txt
setlocal
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
if /I %sqlpath% EQU MSSQLSERVER ( reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\%sqlpath%\Setup" /v SQLPath >> temp.txt ) else ( reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlpath%\Setup" /v SQLPath >> temp.txt )
endlocal
findstr SQLPath temp.txt > temp2.txt
for /f "tokens=3*" %%a in (temp2.txt) do set sqlroot="%%a %%b"
showacls %sqlroot% >> %computername%_SQL2K12.txt
del temp.txt
del temp2.txt






Echo Auditing and Logging >> %computername%_SQL2K12.txt

Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
Echo SQL2K12_42 Auditing Mode >> %computername%_SQL2K12.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Microsoft SQL Server\%sqlinst%\MSSQLServer" | find "AuditLevel" >> %computername%_SQL2K12.txt 




Echo. >> %computername%_SQL2K12.txt
Echo. >> %computername%_SQL2K12.txt
setlocal
for /f %%a in (hostname.txt) do set hostname=%%a
for /f "delims= " %%d in (temp0.txt) do set sqlpath=%%d
if /I %sqlpath% EQU MSSQLSERVER ( OSQL -E -s"|" -w 20000 -n -i SQL2K12_queries.sql >> %computername%_SQL2K12.txt ) else ( OSQL -E -S %hostname%\%sqlpath% -s"|" -w 20000 -n -i SQL2K12_queries.sql >> %computername%_SQL2K12.txt )
endlocal
del temp.txt
del temp2.txt
del null
del temp3.bat
del temp0.txt
del hostname.txt
del test1.txt
del test.txt


Echo. >> %computername%_SQL2K12.txt
Echo Script Execution End Time >> %computername%_SQL2K12.txt
time /t >> %computername%_SQL2K12.txt

Echo. >> %computername%_SQL2K12.txt

Echo --------------END OF OUTPUT-------------- >> %computername%_SQL2K12.txt







