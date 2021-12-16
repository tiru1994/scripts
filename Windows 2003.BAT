Echo ############################################################################################## 	>> output.txt
Echo 	   Prepared by Deloitte (c) 2019 >>output.txt
Echo ############################################################################################## 	>> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ############################################################################################## 	>> output.txt
Echo Executing the WIN2003.bat file............								>> output.txt
Echo. >> output.txt		
	
Echo NOTES: 												>> output.txt
Echo This script must be run locally on a Windows Server as a user with Administrative privileges. 	>> output.txt
Echo ############################################################################################## 	>> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================================= >> output.txt
Echo 				SERVER INFORMATION		 	     >> output.txt
Echo ======================================================================= >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo The Name of the Server >> output.txt
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

Echo The Operating System of the Server >> output.txt
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


Echo ================================ >> output.txt
Echo 2.1. AUDITING LOGGING MONITORING >> output.txt
Echo ================================ >> output.txt

Echo ================================= >> output.txt
Echo 2.1.1. AUDITING SHOULD BE ENABLED >> output.txt
Echo ================================= >> output.txt

Echo. >> output.txt
FIND/i "Audit account logon events" auditpolicy.txt >> output.txt  
Echo. >> output.txt	
FIND/i "Audit account management"  auditpolicy.txt >> output.txt
Echo. >> output.txt		
FIND/i "Audit directory service access"	auditpolicy.txt >> output.txt
Echo. >> output.txt	
FIND/i "Audit logon events"	auditpolicy.txt >> output.txt
Echo. >> output.txt	
FIND/i "Audit object access"  auditpolicy.txt >> output.txt
Echo. >> output.txt		
FIND/i "Audit policy change"  auditpolicy.txt >> output.txt
Echo. >> output.txt		
FIND/i "Audit privilege use"  auditpolicy.txt >> output.txt
Echo. >> output.txt		
FIND/i "Audit process tracking"	auditpolicy.txt >> output.txt
Echo. >> output.txt	
FIND/i "Audit system events"	auditpolicy.txt >> output.txt
Echo. >> output.txt	
FIND/i "Audit account logon events"   auditpolicy.txt >> output.txt
Echo. >> output.txt		
FIND/i "Audit account management"	auditpolicy.txt >> output.txt
Echo. >> output.txt	
FIND/i "Audit directory service access"	auditpolicy.txt >> output.txt
Echo. >> output.txt	
FIND/i "Audit logon events"  auditpolicy.txt >> output.txt
Echo. >> output.txt		
	
		



Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================================================= >> output.txt
Echo 2.1.2. AUDITING OF SENSITIVE SYSTEM,APPLICATION FILES, AND DIRECTORIES SHOULD BE ENABLED >> output.txt
Echo ======================================================================================= >> output.txt

showacls.exe %systemroot% >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32 >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32\drivers >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32\config >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32\spool >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\repair >> output.txt
Echo. >> output.txt

Echo ========================================================================== >> output.txt
Echo 2.1.3. AUDITING OF SYSTEM REGISTRY KEYS SHOULD BE ENABLED >> output.txt
Echo ==========================================================================>> output.txt
Echo. >> output.txt
Echo The registry key access details are made available in the registry text file >> output.txt
Echo. >> output.txt

Echo ========================================================================== >> registry.txt
Echo 2.1.3. AUDITING OF SYSTEM REGISTRY KEYS SHOULD BE ENABLED >> registry.txt
Echo ========================================================================== >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\Software\Microsoft\Windows NT\Current Version\Perflib" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Winlogon" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\LSA" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\KnownDLLs" >> registry.txt
Echo. >> registry.txt

accesschk -k  "HKLM\System\CurrentControlSet\Services\LanManServer\Shares" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\System\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKCR" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\RPC" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\AeDebug" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Compatibility" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Drivers" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Embedding" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Fonts" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\FontSubstitutes" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Font Drivers" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\FontMapper" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\GRE_Initialize" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\MCI" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\MCI Extensions" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Ports" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Type 1 Installer" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\ProfileList" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\WOW" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\System\CurrentControlSet\Services\UPS" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKU\.default" >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedPaths" >> registry.txt
Echo. >> registry.txt


Echo ============================================== >> output.txt
Echo 2.1.4. GUEST ACCESS TO LOGS SHOULD BE DISABLED >> output.txt
Echo ============================================== >> output.txt
Echo. >> output.txt

Echo The recommended value for the following registry is 1 >> output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\RestrictGuestAccess" >> output.txt
Echo. >> output.txt


reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System\RestrictGuestAccess" >> output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security\RestrictGuestAccess" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================== >> output.txt
Echo 2.1.5. ADEQUATE SPACE SHOULD BE ALLOCATED FOR EVENT VIEWER >> output.txt
Echo ========================================================== >> output.txt

Echo. >> output.txt

Echo Atleast 100MB size should be allocated >>output.txt
Echo. >> output.txt >> output.txt

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

Echo =================================== >> output.txt
Echo 2.1.6 CONFIGURE 'RETAIN SYSTEM LOG' >> output.txt
Echo =================================== >> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\System\Retention" >> output.txt
Echo Value 0 indicates logs are overwritten if log file reaches its maximum size>> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================== >> output.txt
Echo 2.1.7 CONFIGURE 'RETAIN SECURITY LOG' >> output.txt
Echo ==================================== >> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Security\Retention" >> output.txt
Echo Value 0 indicates logs are overwritten if log file reaches its maximum size>> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================= >> output.txt
Echo 2.1.8 CONFIGURE 'RETAIN APPLICATION LOG' >> output.txt
Echo ========================================= >> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application\Retention" >> output.txt
Echo Value 0 indicates logs are overwritten if log file reaches its maximum size>> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ======================== >> output.txt
Echo 2.2. PASSWORD MANAGEMENT >> output.txt
Echo ======================== >> output.txt

Echo ========================================= >> output.txt
Echo 2.2.1. DEFAULT PASSWORD SHOULD BE CHANGED >> output.txt
Echo ========================================= >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt

Echo ============================================= >> output.txt
Echo 2.2.2.  STRONG PASSWORD SHOULD BE IMPLEMENTED      >> output.txt
Echo ============================================= >> output.txt

Echo. >> output.txt
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
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================== >> output.txt
Echo 2.2.3. LAN MAN HASHES SHOULD NOT BE STORED LOCALLY >> output.txt
Echo ================================================== >> output.txt
Echo. >> output.txt
Echo The recommended value of the following registry is 1 >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\NoLMHash" >> output.txt
Echo. >> output.txt


Echo ============================= >> output.txt
Echo 2.3.  USER ACCOUNT MANAGEMENT >> output.txt
Echo ============================= >> output.txt
Echo. >> output.txt

Echo ========================================================= >> output.txt
Echo 2.3.1. DORMANT ACCOUNTS SHOULD BE DELETED FROM THE SYSTEM >> output.txt
Echo ========================================================= >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt

Echo ======================================================= >> output.txt
Echo 2.3.2. BLANK PASSWORDS SHOULD NOT BE USED ON THE SERVER >> output.txt
Echo ======================================================= >> output.txt
Echo. >> output.txt
Find /i " Limit local account use of blank password" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo =============================================== >> output.txt
Echo 2.3.3. NTMLV2 AUTHENTICATION SHOULD BE ACCEPTED >> output.txt
Echo =============================================== >> output.txt
Echo. The recommended value of the following registry is 5 >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\LMCompatibilityLevel" >> output.txt
find /i "LAN Manager Authentication" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =================================================== >> output.txt
Echo 2.3.4. SESSION SHOULD BE EXPIRED ON IDLE SMB SERVER >> output.txt
Echo =================================================== >> output.txt
Echo. >> output.txt
FIND/i "Network security: Force logoff when logon hours expire" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================== >> output.txt
Echo 2.3.5. LOCAL USER ACCOUNTS SHOULD BE AUTHENTICATED >> output.txt
Echo ================================================== >> output.txt
Echo.  >> output.txt
Echo The recommended value of the following registry is 0 >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\ForceGuest" >> output.txt
Echo. >> output.txt

Echo ====================================================== >> output.txt
Echo 2.3.6. ACCESS SHOULD BE RESTRICTED ON THE LOCAL SERVER >> output.txt
Echo ====================================================== >> output.txt
dumpsec /rpt=users /saveas=fixed /outfile=users.txt

copy output.txt + users.txt output.txt
del user.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================== >> output.txt
Echo 2.3.7.ACCOUNT LOCKOUT POLICY SHOULD BE ENABLED >> output.txt
Echo ============================================== >> output.txt
Echo. >> output.txt
FIND/i "Account lockout duration"  accountlockoutpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Reset Account lockout counter after"  accountlockoutpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Account lockout threshold"  accountlockoutpolicy.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt
Echo ============================================== >> output.txt
Echo 2.3.8.ADMINISTRATOR ACCOUNT SHOULD BE RENAMED >> output.txt
Echo ============================================== >> output.txt
dumpsec /rpt=users /saveas=fixed /outfile=users.txt

copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
FIND/i "rename" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ======================== >> output.txt
Echo 2.4.SYSTEM CONFIGURATION >> output.txt
Echo ======================== >> output.txt
Echo. >> output.txt

Echo ================================================== >> output.txt
Echo 2.4.1."8.3"NAMING CONVECTION SHOULD NOT BE ENABLED >> output.txt
Echo ================================================== >> output.txt
Echo The recomended value of the following registry key is 1 >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\FileSystem\NtfsDisable8dot3NameCreation" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\FileSystem\Win31FileSystem" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ========================================== >> output.txt
Echo 2.4.2.WARNING BANNER SHOULD BE IMPLEMENTED >> output.txt
Echo ========================================== >> output.txt

Echo. >> output.txt

reg query "HKLM\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Policies\System\legalnoticecaption" >> output.txt
reg query "HKLM\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Policies\System\legalnoticetext" >> output.txt
Echo. >> output.txt

Echo ==================================================== >> output.txt
Echo 2.4.3.SECURITY EVENT LOG WARNING SHOULD BE GENERATED >> output.txt
Echo ==================================================== >> output.txt
Echo. >> output.txt
Echo The recommended value of the following registry is 90 >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security\WarningLevel" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ================================= >> output.txt
Echo 2.4.4.AUTO RUN SHOULD BE DISABLED >> output.txt
Echo ================================= >> output.txt
Echo The recommended value of the following registry  is 0xFF >> output.txt
Echo. >> output.txt
reg query "HKLM\Software\MIcrosoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun" >> output.txt
Echo. >> output.txt

Echo =================================================================== >> output.txt
Echo 2.4.5.ONLY NECESSARY SERVICES SHOULD BE INSTALLED ON NETWORK SERVER >> output.txt
Echo =================================================================== >> output.txt
net start >> output.txt
Echo. >> output.txt

Echo =========================================== >> output.txt
Echo 2.4.6.NTFS SHOULD BE USED ON ALL PARTITIONS >> output.txt
Echo =========================================== >> output.txt
psinfo -d >> output.txt
Echo. >> output.txt

Echo ============================================= >> output.txt
Echo 2.4.7.NULL SESSION PIPES SHOULD BE RESTRICTED >> output.txt
Echo ============================================= >> output.txt
Echo. >> output.txt
FIND/i "Network access: Named Pipes that can be accessed anonymously" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================= >> output.txt
Echo 2.4.8.USERs SHOULD NOT LOGON USING CACHED ACCOUNT INFORMATION >> output.txt
Echo ============================================================= >> output.txt
Echo. >> output.txt
FIND/i  "Interactive logon: Number of previous logons to cache" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================== >> output.txt
Echo 2.4.9. USER RIGHTS ASSIGNMENT SHOULD BE STRONG >> output.txt
Echo ============================================== >> output.txt
Echo. >> output.txt
copy output.txt + userrights.txt output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt
Echo ========================================================= >> output.txt
Echo 2.4.1O. PAGE FILE SETTING SHOULD BE ADEQUATELY CONFIGURED >> output.txt
Echo. 		AND 		 			       >> output.txt
Echo 2.4.11. TIME ZONE SETTING				       >> output.txt
Echo ========================================================= >> output.txt
Echo. >> output.txt
systeminfo >> output.txt
wmic pagefile list >> output.txt
Echo If systems is in Domain, the time will be synchronized through Domain controller, using Windows Time service >> output.txt
Echo Checking for Windows Time service >> output.txt
sc query | find "W32Time" >> output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DateTime\Servers" >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =================================================== >> output.txt
Echo 2.4.12. ADEQUATE USER POLICIES SHOULD BE CONFIGURED >> output.txt
Echo =================================================== >> output.txt
Echo. >> output.txt
find /i "Do not preserve zone information" admtemplates_user.txt >> output.txt
find /i "Hide mechanisms to Remove zone information" admtemplates_user.txt >> output.txt
find /i "Notify antivirus programs when opening attachments" admtemplates_user.txt >> output.txt
find /i "Remove Security tab" admtemplates_user.txt >> output.txt
find /i "Prevent access to registry editing tools" admtemplates_user.txt >> output.txt
find /i "Password protect the screen saver" admtemplates_user.txt >> output.txt
find /i "Screen saver Timeout" admtemplates_user.txt >> output.txt
find /i "Enable Screen saver" admtemplates_user.txt >> output.txt


Echo. >> output.txt
Echo. >> output.txt

Echo =================================================== >> output.txt
Echo 2.4.13. LATEST SECURITY PATCHES SHOULD BE INSTALLED >> output.txt
Echo =================================================== >> output.txt
Echo. >> output.txt
Echo Look into security patches text file >> output.txt
Echo. >> output.txt
wmic qfe list  >> securitypatches.txt
Echo. >> securitypatches.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ========================================================= >> output.txt
Echo 2.4.14.APPROPRIATE TERMINAL SERVICES SHOULD BE CONFIGURED >> output.txt
Echo ========================================================= >> output.txt
Echo. >> output.txt
find /i "Always prompt for password upon connection" admtemplates.txt >> output.txt
find /i "Set client connection encryption level" admtemplates.txt >> output.txt
find /i "Require  user authentication for remote connections by using network level authentication" admtemplates.txt >> output.txt
find /i "Do not allow drive redirection" admtemplates.txt >> output.txt
find /i "Automatic reconnection" admtemplates.txt >> output.txt
find /i "Allow users to connect remotely by using Remote Desktop Services" admtemplates.txt >> output.txt
find /i "Do not allow passwords to be saved" admtemplates.txt >> output.txt
find /i "Set time limit for active but idle remote desktop services sessions" admtemplates.txt >> output.txt
find /i "Set time limit for Active remote Desktop services sessions" admtemplates.txt >> output.txt
Echo. >> output.txt

Echo ============================================== >> output.txt
Echo 2.4.15.ANTI VIRUS SOFTWARE SHOULD BE INSTALLED >> output.txt
Echo ============================================== >> output.txt
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
Echo 2.4.16.SECURITY OPTIONS SETTING SHOULD BE STRENGTHENED >> output.txt
Echo ====================================================== >> output.txt
Echo. >> output.txt
copy output.txt + securityoptions.txt output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ================================================= >> output.txt
Echo 2.4.17.SNMP COMMUNITY STRING SHOULD BE CONFIGURED>> output.txt
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

Echo ==================================================== >> output.txt
Echo 2.4.18.TCP/IP SETTINGS SHOULD BE STRONGLY CONFIGURED>> output.txt
Echo ==================================================== >> output.txt

Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\" >> output.txt
Echo. >> output.txt

Echo ============================================== >> output.txt
Echo 2.4.19.LATEST SERVICE PACK SHOULD BE INSTALLED >> output.txt
Echo ============================================== >> output.txt
Echo. >> output.txt
Echo Look into security patches text file >> output.txt
Echo. >> output.txt
ver >> output.txt
Echo. >> securitypatches.txt
Echo. >> output.txt
Echo. >> output.txt
Echo ===================== >> output.txt
Echo 2.5. GROUP MANAGEMENT >> output.txt
Echo ===================== >> output.txt
Echo. >> output.txt

Echo ======================== >> output.txt
Echo 2.5.1. GROUPS SHOULD BE CREATED TO RESTRICT ACCESS >> output.txt
Echo 2.5.2. TELNET CLIENT GROUPS SHOULD NOT EXIST       >> output.txt
Echo 2.5.3. USER LOCAL GROUP SHOULD BE APPROPRIATELY DEFINED >> output.txt
Echo ======================== >> output.txt
Echo. >> output.txt
dumpsec /rpt=Groupscol /saveas=fixed /outfile=users.txt

copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================== >> output.txt
Echo 2.6. FILE SYSTEM ACCESS AND MANAGEMENT >> output.txt
Echo ==================================== >> output.txt
Echo. >> output.txt

Echo ========================================================= >> output.txt
Echo 2.6.1. SHARES SHOULD BE CREATED AND SECURED APPROPRIATELY >> output.txt
Echo ========================================================= >> output.txt
NET SHARE>> output.txt
Echo. >> output.txt

Echo ============================= >> output.txt
Echo 2.6.2. LOGS SHOULD BE SECURED >> output.txt
Echo ============================= >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\winevt\Logs\Application.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\winevt\Logs\Security.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\winevt\Logs\System.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\config\AppEvent.Evt" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\config\SysEvent.Evt" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\config\SecEvent.Evt" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo ============================ >> output.txt
Echo 2.6.3. RESTRICTION ON SHARES >> output.txt
Echo ============================ >> output.txt
Echo The recommended value of the followinf registry is  COMCFG, DFS$  >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters\NullSessionShares" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo ************************************************** End of Script *********************************************************** >> output.txt