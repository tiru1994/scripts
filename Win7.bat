
Echo ############################################################################################## 	>> output.txt
echo  Prepared by Deloitte Touche Thomastu India LLP                     			>> output.txt	

Echo ############################################################################################## 	>> output.txt
Echo Executing the WIN7.bat file............								>> output.txt
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
Echo. >> output.txt

dumpsec /showaudit /rpt=policy /saveas=fixed /outfile=policy.txt


copy output.txt + policy.txt output.txt
del policy.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =================================================================================== >> output.txt
Echo 2.1.2. AUDITING OF SENSITIVE SYSTEM-APPLICATION-FILES-DIRECTORIES SHOULD BE ENABLED >> output.txt
Echo =================================================================================== >> output.txt

showacls.exe %systemroot% >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32 >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32\drivers >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32\config >> output.txt
Echo. >> output.txt

showacls.exe %systemroot% >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32\spool >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\repair >> output.txt
Echo. >> output.txt

Echo ========================================================================== >> output.txt
Echo 2.1.3. AUDITING OF SYSTEM REGISTRY KEYS SHOULD BE ENABLED >> output.txt
Echo ==========================================================================>> output.txt

accesschk -k  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Perflib" >> output.txt
Echo. >> output.txt

accesschk -k  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SYSTEM\CurrentControlSet\Control\LSA" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\KnownDLLs" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\System\CurrentControlSet\Services\LanManServer\Shares" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\System\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\RPC" >> output.txt
Echo. >> output.txt

accesschk -k  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\AeDebug" >> output.txt
Echo. >> output.txt

accesschk -k  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Compatibility" >> output.txt
Echo. >> output.txt

accesschk -k  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Drivers32" >> output.txt
Echo. >> output.txt

accesschk -k  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Embedding" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Fonts" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\FontSubstitutes" >> output.txt
Echo. >> output.txt

accesschk -k  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Font Drivers" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\FontMapper" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\GRE_Initialize" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\MCI32" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\MCI Extensions" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Ports" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Ports" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\ProfileList" >> output.txt
Echo. >> output.txt

accesschk -k  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WOW" >> output.txt
Echo. >> output.txt

accesschk -k  "HKLM\System\CurrentControlSet\Services\UPS" >> output.txt
Echo. >> output.txt
accesschk -k  "HKEY_USERS\.default" >> output.txt
Echo. >> output.txt

accesschk -k  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedPaths" >> output.txt
Echo. >> output.txt

Echo ========================================================== >> output.txt
Echo 2.1.4. ADEQUATE SPACE SHOULD BE ALLOCATED FOR EVENT VIEWER >> output.txt
Echo ========================================================== >> output.txt

Echo. >> output.txt
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


Echo ============================================== >> output.txt
Echo 2.1.5. GUEST ACCESS TO LOGS SHOULD BE DISABLED >> output.txt
Echo ============================================== >> output.txt
Echo. >> output.txt

Echo Value of 1 is SAFE and Value of 0 is UNSAFE >> output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Application\RestrictGuestAccess" >> output.txt
Echo. >> output.txt


reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\System\RestrictGuestAccess" >> output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Eventlog\Security\RestrictGuestAccess" >> output.txt
Echo. >> output.txt

Echo ======================== >> output.txt
Echo 2.2. PASSWORD MANAGEMENT >> output.txt
Echo ======================== >> output.txt

Echo ========================================= >> output.txt
Echo 2.2.1. DEFAULT PASSWORD SHOULD BE RENAMED >> output.txt
Echo ========================================= >> output.txt
Echo. >> output.txt
Echo **This is a manual check** >> output.txt
Echo. >> output.txt

Echo ================================= >> output.txt
Echo 2.2.2.  WEAK PASSWORD POLICY      >> output.txt
Echo ================================= >> output.txt

Echo. >> output.txt
Echo. >> output.txt

dumpsec /showaudit /rpt=policy /saveas=fixed /outfile=policy.txt


rem copy output.txt + policy.txt output.txt
rem del policy.txt
rem Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
rem Echo. >> output.txt
rem Echo. >> output.txt

FIND/i "Enforce password history" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Maximum password age" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Minimum password age" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Minimum password length" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Password must meet complexity requirements" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Store passwords using reversible encryption"  passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Account lockout threshold"  accountlockoutpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Account lockout duration"  accountlockoutpolicy.txt >> output.txt
Echo. >> output.txt
FIND/i "Reset account lockout counter after"  accountlockoutpolicy.txt >> output.txt
Echo. >> output.txt

Echo ================================================== >> output.txt
Echo 2.2.3. LAN MAN HASHES SHOULD NOT BE STORED LOCALLY >> output.txt
Echo ================================================== >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\NoLMHash" >> output.txt
Echo. >> output.txt

Echo ================================================== >> output.txt
Echo 2.2.4. STRONG KEY PROTECTION FOR USER PRIVATE KEYS >> output.txt
Echo ================================================== >> output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Cryptography" >> output.txt
Echo. >> output.txt

Echo ============================= >> output.txt
Echo 2.3.  USER ACCOUNT MANAGEMENT >> output.txt
Echo ============================= >> output.txt
Echo. >> output.txt

Echo ========================================================= >> output.txt
Echo 2.3.1. DORMANT ACCOUNTS SHOULD BE DELETED FROM THE SYSTEM >> output.txt
Echo ========================================================= >> output.txt
Echo. >> output.txt
Echo **This is a manual check** >> output.txt
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
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" >> output.txt
find /i "LAN Manager Authentication" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo =================================================== >> output.txt
Echo 2.3.4. SESSION SHOULD BE EXPIRED ON IDLE SMB SERVER >> output.txt
Echo =================================================== >> output.txt
FIND/i "Network security: Force logoff when logon hours expire" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================== >> output.txt
Echo 2.3.5. LOCAL USER ACCOUNTS SHOULD BE AUTHENTICATED >> output.txt
Echo ================================================== >> output.txt
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
dumpsec /showaudit /rpt=policy /saveas=fixed /outfile=policy.txt

copy output.txt + policy.txt output.txt
del policy.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
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
reg query "HKLM\System\CurrentControlSet\Control\FileSystem\NtfsDisable8dot3NameCreation" >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\FileSystem\Win31FileSystem" >> output.txt
Echo. >> output.txt

Echo ========================================== >> output.txt
Echo 2.4.2.WARNING BANNER SHOULD BE IMPLEMENTED >> output.txt
Echo ========================================== >> output.txt
reg query "HKLM\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Policies\System\legalnoticecaption" >> output.txt
reg query "HKLM\SOFTWARE\MICROSOFT\Windows\CurrentVersion\Policies\System\legalnoticetext" >> output.txt
Echo. >> output.txt

Echo ==================================================== >> output.txt
Echo 2.4.3.SECURITY EVENT LOG WARNING SHOULD BE GENERATED >> output.txt
Echo ==================================================== >> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Security" >> output.txt
Echo. >> output.txt

Echo ================================= >> output.txt
Echo 2.4.4.AUTO RUN SHOULD BE DISABLED >> output.txt
Echo ================================= >> output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" >> output.txt
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
reg query "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\restrictnullsessaccess" >> output.txt
FIND/i "Network access: Named Pipes that can be accessed anonymously" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo ============================================================= >> output.txt
Echo 2.4.8.USERs SHOULD NOT LOGON USING CACHED ACCOUNT INFORMATION >> output.txt
Echo ============================================================= >> output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v CachedLogonsCount >> output.txt
FIND/i  "Interactive logon: Number of previous logons to cache" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo ============================================== >> output.txt
Echo 2.4.9. USER RIGHTS ASSIGNMENT SHOULD BE STRONG >> output.txt
Echo ============================================== >> output.txt
dumpsec /rpt=rights /saveas=fixed /outfile=rights.txt

copy output.txt + rights.txt output.txt
del rights.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
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
find /i "Do not preserve zone information" admtemplates_user.txt >> output.txt
find /i "Hide mechanisms to Remove zone information" admtemplates_user.txt >> output.txt
find /i "Notify antivirus programs when opening attachments" admtemplates_user.txt >> output.txt
find /i "Remove Security tab" admtemplates_user.txt >> output.txt
find /i "Prevent access to registry editing tools" admtemplates_user.txt >> output.txt
find /i "Password protect the screen saver" admtemplates_user.txt >> output.txt
find /i "Screen saver Timeout" admtemplates_user.txt >> output.txt
find /i "Enable Screen saver" admtemplates_user.txt >> output.txt
Echo. >> output.txt

Echo =================================================== >> output.txt
Echo 2.4.13. LATEST SECURITY PATCHES SHOULD BE INSTALLED >> output.txt
Echo =================================================== >> output.txt
Echo. >> output.txt
wmic qfe list  >> output.txt
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

Echo ==================================== >> output.txt
Echo 2.4.16.SECURE FIREWALL CONFIGURATION >> output.txt
Echo ==================================== >> output.txt
netsh advfirewall show domainprofile >>output.txt
Echo. >> output.txt
netsh advfirewall show privateprofile >>output.txt
Echo. >> output.txt
netsh advfirewall show publicprofile >>output.txt
Echo. >> output.txt

Echo ====================================================== >> output.txt
Echo 2.4.17.SECURITY OPTIONS SETTING SHOULD BE STRENGTHENED >> output.txt
Echo ====================================================== >> output.txt
copy output.txt + securityoptions.txt output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ===================== >> output.txt
Echo 2.5. GROUP MANAGEMENT >> output.txt
Echo ===================== >> output.txt
Echo. >> output.txt

Echo ======================== >> output.txt
Echo "2.5.1. & 2.5.2 & 2.5.3" >> output.txt
Echo ======================== >> output.txt

dumpsec /rpt=Groupscol /saveas=fixed /outfile=users.txt

copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
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

Echo ============================= >> output.txt
Echo 2.6.2. LOGS SHOULD BE SECURED >> output.txt
Echo ============================= >> output.txt
showacls.exe C:\Windows\system32\winevt\Logs\Application.evtx >> output.txt
showacls.exe C:\Windows\system32\winevt\Logs\Security.evtx >> output.txt
showacls.exe C:\Windows\system32\winevt\Logs\System.evtx >> output.txt
Echo. >> output.txt
showacls.exe C:\Windows\system32\config\appevent.evt >> output.txt
showacls.exe C:\Windows\system32\config\secevent.evt >> output.txt
showacls.exe C:\Windows\system32\config\sysevent.evt >> output.txt
Echo. >> output.txt

Echo ============================ >> output.txt
Echo 2.6.3. RESTRICTION ON SHARES >> output.txt
Echo ============================ >> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\LanmanServer\Parameters" >> output.txt
Echo. >> output.txt

Echo ==================================================================================== >> output.txt
Echo 2.6.4. Set 'Restrictions for Unauthenticated RPC clients' to'Enabled Authenticated' >> output.txt
Echo ==================================================================================== >> output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Rpc" >> output.txt
Echo. >> output.txt

Echo ======================================================== >> output.txt
Echo 2.6.5. Set 'Solicited Remote Assistance' to 'Disabled' >> output.txt
Echo ======================================================== >> output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\Client" >> output.txt
Echo. >> output.txt

Echo =================================================================================== >> output.txt
Echo 2.7. Encryption >> output.txt
Echo =================================================================================== >> output.txt

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client:AllowBasic">> output.txt
Echo. >> output.txt

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client:AllowUnencryptedTraffic" >> output.txt
Echo. >> output.txt

reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client:AllowDigest" >> output.txt
Echo. >> output.txt

Echo ************************************************** End of Script *********************************************************** >> output.txt