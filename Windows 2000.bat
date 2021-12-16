Echo ############################################################################################## 	>> output.txt
Echo       Deloitte India Windows 2000 Configuration Interrogation Script             	    >> output.txt
Echo       Property of Deloitte Touche Tohmatsu India LLP 					                 	>> output.txt
Echo ############################################################################################## 	>> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ############################################################################################## 	>> output.txt
Echo Executing the WIN2000.bat file............								>> output.txt
Echo. >> output.txt		
	
Echo NOTES: 												>> output.txt
Echo This script must be run locally on a Windows 2000 system as a user with Administrative privileges. 	>> output.txt
Echo ############################################################################################## 	>> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================================= >> output.txt
Echo 				SYSTEM INFORMATION		 	     >> output.txt
Echo ======================================================================= >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo The Name of the System >> output.txt
Echo ---------------------- >> output.txt
hostname >> output.txt

Echo. >> output.txt


Echo Today's Date  >> output.txt
Echo ------------  >> output.txt
date /t >> output.txt
Echo. >> output.txt

Echo The file created at >> output.txt
Echo ------------------- >> output.txt
time /t >> output.txt

Echo. >> output.txt

Echo The Operating System of the Machine >> output.txt
Echo ---------------------------------- >> output.txt
Echo. >> output.txt
ver >> output.txt

Echo. >> output.txt


Echo Network Configuration >> output.txt
Echo --------------------- >> output.txt
Echo. >> output.txt
ipconfig /all >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ---------------------------------------------------------------------------------------------------------------------------- >> output.txt

Echo ================================ >> output.txt
Echo 2.1. AUDITING LOGGING MONITORING >> output.txt
Echo ================================ >> output.txt

Echo ================================= >> output.txt
Echo 2.1.1. AUDITING SHOULD BE ENABLED >> output.txt
Echo ================================= >> output.txt

Echo. >> output.txt

FIND /i "Audit account logon events" auditpolicy.txt >> output.txt	
Echo. >> output.txt

FIND /i "Audit account management" auditpolicy.txt >> output.txt
Echo. >> output.txt

FIND /i  "Audit directory service access" auditpolicy.txt >> output.txt
Echo. >> output.txt

FIND /i "Audit account logon events" auditpolicy.txt >>output.txt
Echo. >> output.txt

FIND /i "Audit logon events" auditpolicy.txt >>output.txt
Echo. >> output.txt

FIND /i "Audit object access" auditpolicy.txt >> output.txt
Echo. >> output.txt
	
FIND /i "Audit policy change" auditpolicy.txt >> output.txt
Echo. >> output.txt
	
FIND /i "Audit privilege use" auditpolicy.txt >> output.txt
Echo. >> output.txt
	
FIND /i "Audit process tracking" auditpolicy.txt >> output.txt
Echo. >> output.txt

FIND /i "Audit server events" auditpolicy.txt >> output.txt
FIND /i "Audit system events" auditpolicy.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ====================================================================================== >> output.txt
Echo 2.1.2. AUDITING OF SENSITIVE SYSTEM,APPLICATION FILES AND DIRECTORIES SHOULD BE ENABLED >> output.txt
Echo ====================================================================================== >> output.txt
Echo. >> output.txt

showacls.exe %systemroot% >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\repair >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32 >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32\config >> output.txt
Echo. >> output.txt

Echo. >> output.txt

Echo ==================================================================== >> output.txt
Echo 2.1.3. AUDITING OF SENSITIVE SYSTEM REGISTRY KEYS SHOULD BE ENABLED >> output.txt
Echo ==================================================================== >> output.txt
Echo. >> output.txt
accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run">> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\KnownDLLs" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\System\CurrentControlSet\Control\SecurePipeServers\winreg" >> output.txt
Echo. >> output.txt

Echo. >> output.txt

Echo ============================================== >> output.txt
Echo 2.1.4. GUEST ACCESS TO LOGS SHOULD BE DISABLED >> output.txt
Echo ============================================== >> output.txt
Echo. >> output.txt

Echo "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\RestrictGuestAccess" >> output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System\RestrictGuestAccess" >> output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security\RestrictGuestAccess" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================= >> output.txt
Echo 2.1.5. LOGS CONTAINING AUDITING INFORMATION SHOULD BE SECURED >> output.txt
Echo ============================================================= >> output.txt
Echo. >> output.txt

showacls %systemroot%\System32\config\APPEVENT.EVT  >> output.txt
Echo. >> output.txt

showacls %systemroot%\System32\config\SECEVENT.EVT >> output.txt
Echo. >> output.txt

showacls %systemroot%\System32\config\SYSEVENT.EVT >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.1.6.THE USE OF BACKUP AND RESTORE PRIVILEGES SHOULD BE AUDITED >> output.txt
Echo ================================================================ >> output.txt

Echo. >> output.txt
FIND/i "Audit use of Backup and Restore privilege" securityoptions.txt  >>output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================== >> output.txt
Echo 2.1.7. SPACE ALLOCATED FOR EVENT VIEWER SHOULD BE ADEQUATELY DEFINED >> output.txt
Echo ==================================================================== >> output.txt

Echo. >> output.txt
Echo. >> output.txt
Echo Atleast 100MB size should be allocated >>output.txt
Echo. >> output.txt 

Echo Application Event Log Maxsize >> output.txt
Echo ----------------------------- >> output.txt
Echo. >> output.txt

Echo The following registry string shows the Max Size of Application Event Log >> output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\MaxSize" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo Security Event Log Max Size >> output.txt
Echo --------------------------- >> output.txt
Echo. >> output.txt

Echo The following registry string shows the Max Size of Security Event Log >> output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security\MaxSize" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo System Event Log Max Size >> output.txt
Echo ------------------------- >> output.txt
Echo. >> output.txt

Echo The following registry string shows the Max Size of System Event Log >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\Eventlog\System\MaxSize" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt 

Echo ==================================================================  >> output.txt
Echo 2.1.8. USERS SHOULD BE LOGGED OFF AFTER A SPECIFIED PERIOD OF TIME >> output.txt
Echo ==================================================================  >> output.txt
Echo. >> output.txt

Find/i "Amount of idle time required before disconnecting session" securityoptions.txt >> output.txt
Echo. >> output.txt

Find/i "Automatically log off users when logon time expires (local)" securityoptions.txt  >> output.txt
Echo. >> output.txt


Echo ======================== >> output.txt
Echo 2.2. PASSWORD MANAGEMENT >> output.txt
Echo ======================== >> output.txt

Echo ========================================= >> output.txt
Echo 2.2.1. DEFAULT PASSWORD SHOULD BE RENAMED >> output.txt
Echo ========================================= >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt

Echo ====================================================================== >> output.txt
Echo 2.2.2.STRONG PASSWORD AND ACCOUNT LOCKOUT POLICY SHOULD BE IMPLEMENTED>> output.txt
Echo ====================================================================== >> output.txt

Echo. >> output.txt
FIND /i "Enforce password history" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Maximum password age" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Minimum password age" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Minimum password length" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Password must meet complexity requirements" passwordpolicy.txt >> output.txt
Echo. >> output.txt  
FIND /i "Store passwords using reversible encryption" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Account lockout duration" accountlockoutpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Account lockout threshold" accountlockoutpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Reset account lockout counter after" accountlockoutpolicy.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt



Echo ============================= >> output.txt
Echo 2.3.  USER ACCOUNT MANAGEMENT >> output.txt
Echo ============================= >> output.txt
Echo. >> output.txt

Echo ========================================================= >> output.txt
Echo 2.3.1. DORMANT ACCOUNTS SHOULD BE DELETED FROM THE SYSTEM >> output.txt
Echo ========================================================= >> output.txt
Echo. >> output.txt
Echo  Manual check >> output.txt
Echo. >> output.txt

Echo ========================================================  >> output.txt
Echo 2.3.2.THE DEFAULT ACCOUNTS SHOULD BE CONFIGURED SECURELY  >> output.txt		
Echo 2.3.3.ADMINISTRATOR ACCOUNT SHOULD BE RENAMED >> output.txt
Echo ============================================== >> output.txt
dumpsec /rpt=users /saveas=fixed /outfile=users.txt

copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
Echo. >> output.txt
Echo. >> output.txt



Echo ======================== >> output.txt
Echo 2.4.SYSTEM CONFIGURATION >> output.txt
Echo ======================== >> output.txt
Echo. >> output.txt

Echo ================================================== >> output.txt
Echo 2.4.1.NAMING CONVECTION SHOULD NOT BE ENABLED >> output.txt
Echo ================================================== >> output.txt
Echo. >> output.txt
Echo "The recommended value of the following registry should be 1" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\FileSystem\NtfsDisable8dot3NameCreation" >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\FileSystem\Win31FileSystem" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ========================================== >> output.txt
Echo 2.4.2.WARNING BANNER SHOULD BE IMPLEMENTED >> output.txt
Echo ========================================== >> output.txt
Echo. >> output.txt
FIND /i "message text" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt


Echo ================================= >> output.txt
Echo 2.4.3.AUTO RUN SHOULD BE DISABLED >> output.txt
Echo ================================= >> output.txt
Echo. >> output.txt
Echo The recommended value of the following registry value should be 0xFF or 255>> output.txt
Echo. >> output.txt
reg query "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun" >> output.txt

Echo =================================================================== >> output.txt
Echo 2.4.4.ONLY NECESSARY SERVICES SHOULD BE INSTALLED ON NETWORK SERVER >> output.txt
Echo =================================================================== >> output.txt
sc query state= all | findstr "SERVICE_NAME DISPLAY_NAME STATE" >> output.txt
Echo. >> output.txt

Echo ============================================== >> output.txt
Echo 2.4.5. USER RIGHTS ASSIGNMENT SHOULD BE STRONG >> output.txt
Echo ============================================== >> output.txt
Echo. >> output.txt
copy output.txt + userrights.txt output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================= >> output.txt
Echo 2.4.6. PAGE FILE SETTING SHOULD BE ADEQUATELY CONFIGURED >> output.txt
Echo. 		AND 		 			                           >> output.txt
Echo 2.4.7. TIME ZONE SETTING				                  >> output.txt
Echo ========================================================= >> output.txt
Echo. >> output.txt
wmic.exe pagefile list /format:list >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo =================================================== >> output.txt
Echo 2.4.8. LATEST SECURITY PATCHES SHOULD BE INSTALLED >> output.txt
Echo =================================================== >> output.txt
Echo. >> output.txt
Echo Checking for hotfix deployed on system >> output.txt
systeminfo | find "KB" >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =================================================================== >> output.txt
Echo 2.4.9.ANTI VIRUS SOFTWARE SHOULD BE INSTALLED AND UPDATED REGULARLY >> output.txt
Echo =================================================================== >> output.txt
psinfo -s|find /I "mcafee" >> output.txt
Echo. >> output.txt
psinfo -s|find /I "symantec" >> output.txt
Echo. >> output.txt
psinfo -s|find /I "trend micro" >> output.txt
Echo. >> output.txt
psinfo -s|find /I "kaspersky" >> output.txt
Echo. >> output.txt
psinfo -s|find /I "AVG" >> output.txt
Echo. >> output.txt

echo Services >> output.txt

net start|find /I "mcafee" >> output.txt
Echo. >> output.txt
net start|find /I "symantec" >> output.txt
Echo. >> output.txt 
net start|find /I "trend micro" >> output.txt
Echo. >> output.txt
net start|find /I "AVG" >> output.txt
Echo. >> output.txt
net start|find /I "kaspersky" >> output.txt
Echo. >> output.txt

Echo **IF OUTPUT IS BLANK - NO ANTI VIRUS IS INSTALLED / MANUAL CHECK** >> output.txt
Echo. >> output.txt

Echo ====================================================== >> output.txt
Echo 2.4.10.SECURITY OPTIONS SETTING SHOULD BE STRENGTHENED >> output.txt
Echo ====================================================== >> output.txt
Echo. >> output.txt
copy output.txt + securityoptions.txt output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================= >> output.txt
Echo 2.4.11.SNMP COMMUNITY STRING SHOULD BE CONFIGURED >> output.txt
Echo ================================================= >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMPTRAP" >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters" >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP" >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" >> output.txt
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Policies\SNMP" >> output.txt
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Policies\SNMP\Parameters" >> output.txt
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Policies\SNMP\Parameters\ValidCommunities" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================== >> output.txt
Echo 2.4.12.TCP/IP STACK SETTINGS SHOULD BE STRONGLY CONFIGURED >> output.txt
Echo ========================================================== >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================== >> output.txt
Echo 2.4.13.LATEST SERVICE PACK SHOULD BE INSTALLED >> output.txt
Echo ============================================== >> output.txt
Echo. >> output.txt
systeminfo | find "OS Version" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================================== >> output.txt
Echo 2.4.14.SUFFICIENT FREE DISK SPACE SHOULD BE PRESENT ON THE SYSTEM PARTITION >> output.txt
Echo =========================================================================== >> output.txt
Echo. >> output.txt
wmic logicaldisk get size,freespace,caption >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ====================================================================== >> output.txt
Echo 2.4.15.SECURITY LOG NEAR CAPACITY WARNING SETTING SHOULD BE CONFIGURED >> output.txt
Echo ====================================================================== >> output.txt
Echo. >> output.txt
Echo The recommended value of the following registry should be 90 >> output.txt
reg query "HKLM\System\CurrentControlSet\Services\Eventlog\Security\WarningLevel" >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================== >> output.txt
Echo 2.4.16.NTFS SHOULD BE USED ON ALL PARTITIONS >> output.txt
Echo =========================================== >> output.txt
psinfo -d >> output.txt
Echo. >> output.txt

Echo ==================================================================== >> output.txt
Echo 2.4.17.SCREENSAVER TIMEOUT AND PASSWORD PROTECTION SHOULD BE ENABLED >> output.txt
Echo ==================================================================== >> output.txt
Echo. >> output.txt
Echo The recommended value for the registry is 1 >> output.txt
Echo. >> output.txt
reg query "HKU\.Default\Control Panel\Desktop\ScreenSaveActive" >> output.txt
Echo. >> output.txt
Echo The recommended value for the registry is 1 >> output.txt
Echo. >> output.txt
reg query "HKU\.Default\Control Panel\Desktop\ScreenSaverIsSecure" >> output.txt
Echo. >> output.txt
Echo The recommended value for the registry is 300 seconds >> output.txt
Echo. >> output.txt
reg query "HKU\.Default\Control Panel\Desktop\ScreenSaveTimeOut" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo    ====================================================== >> output.txt
Echo	2.4.18 Allow Automatic Administrative Logon: Disabled	>> output.txt
Echo    ====================================================== >> output.txt
Echo. >> output.txt
findstr/i "Recovery Console: Allow automatic" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo    ============================================================= >> output.txt
Echo	2.4.19 Do Not Display Last User Name in Logon Screen: Enabled	>> output.txt
Echo    ============================================================= >> output.txt
Echo. >> output.txt
findstr/i "Interactive Logon: Do not display last username" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo ===================== >> output.txt
Echo 2.5. GROUP MANAGEMENT >> output.txt
Echo ===================== >> output.txt
Echo. >> output.txt

Echo =========================================================================================== >> output.txt
Echo 2.5.1. NAMING CONVENTION SHOULD BE ESTABLISHED AND FOLLOWED FOR ALL GLOBAL AND LOCAL GROUPS >> output.txt
Echo 2.5.3. USER LOCAL GROUP SHOULD BE APPROPRIATELY DEFINED  >> output.txt
Echo 2.5.4. SPECIAL GROUP "EVERYONE" SHOULD BE USED WITH CAUTION >> output.txt
Echo 2.5.5. NON ESSENTIAL USERS SHOULD NOT BE PRESENT IN ADMINISTRATORS GROUP >> output.txt
Echo ============================================================================================ >> output.txt

dumpsec /rpt=Groupscol /saveas=fixed /outfile=users.txt

copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================ >> output.txt
Echo 2.5.2. RESTRICTED GROUP FEATURE SHOULD BE UTILIZED >> output.txt
Echo ================================================ >> output.txt
Echo. >> output.txt
Echo Manual Check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ==================================== >> output.txt
Echo 2.6. FILE SYSTEM ACCESS & MANAGEMENT >> output.txt
Echo ==================================== >> output.txt
Echo. >> output.txt

Echo ========================================================= >> output.txt
Echo 2.6.1. SHARES SHOULD BE CREATED AND SECURED APPROPRIATELY >> output.txt
Echo ========================================================= >> output.txt
NET SHARE>> output.txt
Echo. >> output.txt

Echo ======================================================================  >> output.txt
Echo 2.6.2. DIRECTORIES CONTAINING SENSITIVE WINDOWS FILE SHOULD BE SECURED>> output.txt
Echo ====================================================================== >> output.txt
Echo. >> output.txt
showacls.exe %systemroot% >> output.txt
Echo. >> output.txt
showacls.exe %systemroot%\system32 >> output.txt
Echo. >> output.txt
showacls.exe %systemroot%\system32\drivers >> output.txt
Echo. >> output.txt


Echo ================================================ >> output.txt
Echo 2.6.3. KEY EXECUTABLE FILES SHOULD BE RESTRICTED>> output.txt
Echo ================================================ >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\ssystem32\arp.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\atsvc.exe" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\at.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\attrib.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\cacls.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\cmd.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\dcpromo.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\debug.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\edit.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\edlin.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\finger.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\ftp.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\ipconfig.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\nbtstat.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\net.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\net1.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\netstat.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\nslookup.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\ping.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\posix.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\qbasic.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\rcp.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\regedt32.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\regsvr32.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\rexec.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\route.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\rsh.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\runonce.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\syskey.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\telnet.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\tftp.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\tracert.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\system32\xcopy.exe" >> output.txt
Echo. >> output.txt
cacls "C:\WINNT\regedit.exe" >> output.txt
Echo. >> output.txt
Echo Manual check for  rdisk exe file, rollback exe file and secfixup exe file >> output.txt
Echo. >> output.txt
Echo. >> output.txt
cacls "C:\ntbootdd.sys" >> output.txt
Echo. >> output.txt
cacls "C:\bootsect.dos" >> output.txt
Echo. >> output.txt
cacls "C:\bootsect.dos" >> output.txt
Echo. >> output.txt
showacls.exe %systemroot% >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================= >> output.txt
Echo 2.6.4. STRONG PERMISSIONS SHOULD BE ASSIGNED TO CRITICAL SYSTEMS, FILES AND FOLDERS   >> output.txt
Echo ================================================================================= >> output.txt
Echo. >> output.txt
showacls.exe %systemroot%\system32\LogFiles >> output.txt
Echo. >> output.txt
showacls.exe %systemroot%\repair >> output.txt
Echo. >> output.txt
showacls.exe %systemroot%\system32 >> output.txt
Echo. >> output.txt
showacls.exe %systemroot%\system32\config >> output.txt
Echo. >> output.txt
cacls "C:\boot.ini" >> output.txt
Echo. >> output.txt
cacls "C:\ntldr" >> output.txt
Echo. >> output.txt
cacls "C:\ntdetect.com" >> output.txt
Echo. >> output.txt
cacls "C:\ntbootdd.sys" >> output.txt
Echo. >> output.txt
cacls "C:\bootsect.dos" >> output.txt
Echo. >> output.txt
showacls.exe %systemroot% >> output.txt
Echo. >> output.txt



Echo ========================================================================== >> output.txt
Echo 2.6.5. ACCESS TO REGISTRY KEYS CONTAINING SENSITIVE INFORMATION SHOULD BE RESTRICTED >> output.txt
Echo ========================================================================== >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\Software\Microsoft\Windows NT\Current Version\Perflib" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Winlogon" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\LSA" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\KnownDLLs" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\System\CurrentControlSet\Services\LanManServer\Shares" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\RPC" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\AeDebug" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Compatibility" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Drivers" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Embedding" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Fonts" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\FontSubstitutes" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Font Drivers" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\FontMapper" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\GRE_Initialize" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\MCI" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\MCI Extensions" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Ports" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Type 1 Installer" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\ProfileList" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\WOW" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\System\CurrentControlSet\Services\UPS" >> output.txt
Echo. >> output.txt

accesschk -k "HKU\.default" >> output.txt
Echo. >> output.txt

accesschk -k "HKLM\SOFTWARE\Windows3.1MigrationStatus" >> output.txt
Echo. >> output.txt


Echo ================ >> output.txt
Echo 2.7. Encryption	>> output.txt
Echo ================ >> output.txt
Echo. >> output.txt

Echo ========================================== >> output.txt
Echo 2.7.1 Disable weak encryption protocol.	>> output.txt
Echo ========================================== >> output.txt
Echo. >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\">> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL2\Server\Enabled">> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL3\Server\Enabled">> output.txt
Echo. >> output.txt

Echo ========================================== >> output.txt
Echo 2.7.2 Enable TLS 1.0 and above protocol 	>> output.txt
Echo ========================================== >> output.txt
Echo. >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols">> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS1.2\Server\Enabled">> output.txt
Echo TLS 1.2 is enabled if value of the key ENABLED is returned 1, disabled if 0 >> output.txt
Echo. >> output.txt


Echo ================= >> output.txt
Echo 2.8. SMB Protocol	>> output.txt
Echo ================= >> output.txt

Echo =============================== >> output.txt
Echo 2.8.1 Disable Weak SMB protocol.	>> output.txt
Echo =============================== >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\SMB1" >> output.txt
Echo SMB1 can be considered as disabled if output is 0 or output is blank as the key does not exist. >> output.txt

Echo ************************************************** End of Script *********************************************************** >> output.txt
