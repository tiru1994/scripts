Echo ############################################################################################## 	>> output.txt
Echo       Deloitte Windows Server 2016 Configuration Interrogation Script               	>> output.txt
Echo       Property of Deloitte Touche Tohmatsu LLP 					                 	>> output.txt
Echo ############################################################################################## 	>> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ############################################################################################## 	>> output.txt
Echo Executing the WIN2016.bat file............								>> output.txt
Echo. >> output.txt		
	
Echo NOTES: 												>> output.txt
Echo This script must be run locally on a Windows Server as a user with Administrative privileges. 	>> output.txt
Echo ############################################################################################## 	>> output.txt
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
dumpsec /showaudit /rpt=policy /saveas=fixed /outfile=policy.txt

copy output.txt + policy.txt output.txt
del policy.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo. >> output.txt


Echo Network Configuration >> output.txt
Echo --------------------- >> output.txt
Echo. >> output.txt
ipconfig /all >> output.txt

Echo. >> output.txt
Echo. >> output.txt


Echo ====================== >> output.txt
Echo 1. Account policies>> output.txt
Echo ====================== >> output.txt

Echo =======================================>> output.txt
Echo 1.1 Password and Account lockout policy>> output.txt
Echo ======================================= >> output.txt
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
Echo ======================================================================================= >> output.txt
Echo 1.2 The Null Credentials Logon should not be included as a member of the Everyone group >> output.txt
Echo ======================================================================================= >> output.txt
REG QUERY HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa\everyoneincludesanonymous >> output.txt
Echo. >> output.txt
Echo If Value displayed is 0 then parameter is diabled >> output.txt
Echo. >> output.txt
Echo ===========================================>> output.txt
Echo 1.3 SET CLIENT CONNECTION ENCRYPTION LEVEL >> output.txt
Echo ===========================================>> output.txt
Echo The recommended Value of following registry key should be set to 3 (High level) >> output.txt
Echo. >> output.txt
Echo -Security Layer 1(Low Level) – With a low security level, only the communications sent from the client to the server are  encrypted using 56-bit encryption. >> output.txt
Echo -Security Layer 2(Client Compaitable) – Having a client compatible security level, communications between the server and the client are encrypted at the maximum key strength supported by the client.>> output.txt
Echo -Security Layer 3(High Level) – With a high security level, communications between server and client are encrypted using 128-bit encryption.  >> output.txt
Echo. >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\MinEncryptionLevel"  >> output.txt
Echo. >> output.txt
Echo ========================================================================================= >> output.txt
Echo 1.4 User sessions that are inactive for a set amount of time should have their session disabled >> output.txt
Echo ========================================================================================= >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\MaxIdleTime" >> output.txt
Echo. >> output.txt
Echo ====================================================>>  output.txt
Echo 1.5  Unnecessary network protocols should be removed >> output.txt
Echo ==================================================== >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo ================================================================== >> output.txt
Echo 1.6 A legal notice and warning should be implemented on the server >> output.txt
Echo ================================================================== >> output.txt
REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies\System\legalnoticecaption >> output.txt
REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies\System\legalnoticetext >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo =================>> output.txt
Echo  2 Local Policies>> output.txt
Echo =================>> output.txt
Echo. >> output.txt
Echo ===========================>> output.txt
Echo  2.1 User Rights Assignment>> output.txt
Echo =========================== >> output.txt
copy output.txt + userrights.txt output.txt
Echo. >> output.txt
Echo =====================>> output.txt
Echo 2.2. Dormant Accounts>> output.txt
Echo =====================>> output.txt
Echo Manual Check >> output.txt
Echo =====================>> output.txt
Echo  2.3 Security options >> output.txt
Echo ===================== >> output.txt
copy output.txt + securityoptions.txt output.txt
Echo. >> output.txt
Echo ========================================= >> output.txt
Echo 3 Windows Firewall With Advanced Security >> output.txt
Echo ========================================= >> output.txt
Echo. >> output.txt
Echo ================== >> output.txt
Echo 3.1 Domain Profile>> output.txt
Echo ================== >> output.txt
Echo. >> output.txt
netsh advfirewall show domainprofile>> output.txt
Echo. >> output.txt
Echo ================== >> output.txt
Echo 3.2 Private Profile>> output.txt
Echo ================== >> output.txt
Echo. >> output.txt
netsh advfirewall show privateprofile>> output.txt
Echo. >> output.txt
Echo ================== >> output.txt
Echo 3.3 Public Profile>> output.txt
Echo ================== >> output.txt
Echo. >> output.txt
netsh advfirewall show publicprofile>> output.txt
Echo. >> output.txt
Echo ===================================>> output.txt
Echo  4 Auditing, Logging and Monitoring>> output.txt
Echo =================================== >> output.txt
Echo. >> output.txt
Echo =====================>> output.txt
Echo  4.1 Account policies>> output.txt
Echo =====================>> output.txt
copy output.txt + auditpolicy.txt output.txt
Echo. >> output.txt
Echo Detailed Audit logging >> output.txt
auditpol /get /category:* >> output.txt
Echo ====================>> output.txt
Echo  4.2 Event Log sizes >> output.txt
Echo ==================== >> output.txt
Echo. >> output.txt
Echo Security:Maximum Log Size (KB)' to 'Enabled:102400 KB (100MB) or greater, System: Maximum Log Size (KB)' to 'Enabled:102400 KB (100MB) or greater, Application: Maximum Log Size (KB)' to 'Enabled:102400 KB (100MB) or greater' >> output.txt
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
Echo ========================================= >> output.txt
Echo 4.3. Permissions on Event logs>> output.txt
Echo ========================================= >> output.txt
Echo. >> output.txt
Echo Application log >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application\RestrictGuestAccess" >> output.txt
Echo. >> output.txt
Echo Permission on Application.evtx (Application log file) >> output.txt
accesschk C:\Windows\System32\winevt\Logs\application.evtx >> output.txt

Echo Security log >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Security\RestrictGuestAccess" >> output.txt
Echo. >> output.txt
Echo Permission on Security.evtx (Security log file) >> output.txt
accesschk C:\Windows\System32\winevt\Logs\security.evtx >> output.txt

Echo System log>> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\System\RestrictGuestAccess" >> output.txt
Echo. >> output.txt
Echo Permission on System.evtx (System log file) >> output.txt
accesschk C:\Windows\System32\winevt\Logs\system.evtx >> output.txt
Echo ====================================>> output.txt
Echo  5 Administrative templates >> output.txt
Echo ====================================>> output.txt
Echo. >> output.txt
Echo ==================>> output.txt
Echo  5.1 Control Panel >> output.txt
Echo ==================>> output.txt
Echo. >> output.txt
find /I  "Control Panel\Personalization" admtemplates.txt >> output.txt
Echo. >> output.txt
Echo ========>> output.txt
Echo  5.2 MSS >> output.txt
Echo ========>> output.txt

echo 1. MSS: Enable Automatic Logon (not recommended)' is set to 'Disabled' >> output.txt
reg query "HKLM\Software\Microsoft\Windows NT\Currentversion\Winlogon\AutoAdminLogon" >>output.txt
echo 2. MSS: (DisableIPSourceRouting IPv6) IP source routing protection level >> output.txt
reg query "HKLM\System\Currentcontrolset\Services\Tcpip6\Parameters\DisableIPSourceRouting" >> output.txt
echo 3. MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)' to 'Enabled: Highest protection, source routing is completely disabled' >> output.txt
reg query "HKLM\System\Currentcontrolset\Services\Tcpip\Parameters\DisableIPSourceRouting" >> output.txt
echo 4. MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes' to 'Disabled' >> output.txt
reg query "HKLM\System\Currentcontrolset\Services\Tcpip\Parameters\EnableICMPRedirect" >> output.txt
echo 5. MSS: (KeepAliveTime) How often keep-alive packets are sent in milliseconds' to 'Enabled: 300,000 or 5 minutes (recommended) >> output.txt
reg query "HKLM\System\Currentcontrolset\Services\Tcpip\Parameters\KeepAliveTime" >> output.txt
echo 6. MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers' to 'Enabled' >> output.txt
reg query "HKLM\System\Currentcontrolset\Services\Netbt\Parameters\nonamereleaseondemand" >> output.txt
echo 7. MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses (could lead to DoS)' to 'Disabled' >> output.txt
reg query "HKLM\System\Currentcontrolset\Services\Tcpip\Parameters\PerformRouterDiscovery" >>  output.txt
echo 8. MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)' to 'Enabled' >> output.txt
reg query "HKLM\System\Currentcontrolset\Control\Session Manager\SafeDllSearchMode" >> output.txt
echo 9. MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires ' to 'Enabled >> output.txt
reg query "HKLM\Software\Microsoft\Windows NT\Currentversion\Winlogon\ScreenSaverGracePeriod"  >> output.txt
echo 10. MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted' to 'Enabled: 3' >> output.txt
reg query "HKLM\System\Currentcontrolset\Services\Tcpip6\Parameters\tcpmaxdataretransmissions"  >> output.txt
echo 11. MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted' to 'Enabled: 3' >> output.txt
reg query "HKLM\System\Currentcontrolset\Services\Tcpip\Parameters\tcpmaxdataretransmissions" >>  output.txt
echo 12. MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning' to 'Enabled: 90% or less' >> output.txt
reg query "HKLM\System\Currentcontrolset\Services\Eventlog\Security\WarningLevel" >> output.txt
Echo. >> output.txt
Echo ============>> output.txt
Echo  5.3 Network >> output.txt
Echo ============>> output.txt
Echo. >> output.txt
find /I "Turn off multicast name resolution" admtemplates.txt >> output.txt
find /I "Enable Font Providers" admtemplates.txt >> output.txt
find /I "Enable insecure guest logons" admtemplates.txt >> output.txt
find /I "Turn on Mapper I/O (LLTDIO) driver" admtemplates.txt >> output.txt
find /I "Turn on Responder (RSPNDR) driver" admtemplates.txt >> output.txt
find /I "Turn off Microsoft Peer-to-Peer Networking Services" admtemplates.txt >> output.txt
find /I "Prohibit installation and configuration of Network Bridge on your DNS domain network" admtemplates.txt >> output.txt
find /I "Prohibit use of Internet Connection Sharing on your DNS domain network" admtemplates.txt >> output.txt
find /I "Require domain users to elevate when setting a network's location" admtemplates.txt >> output.txt
Echo Disable IPv6 >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters:DisabledComponents" >> output.txt
find /I "Configuration of wireless settings using Windows Connect Now" admtemplates.txt >> output.txt
find /I "Prohibit access of the Windows Connect Now wizards" admtemplates.txt >> output.txt
find /I "Minimize the number of simultaneous connections to the Internet or a Windows Domain" admtemplates.txt >> output.txt
find /I "Prohibit connection to non-domain networks when connected to domain authenticated network" admtemplates.txt >> output.txt
Echo. >> output.txt
Echo ============>> output.txt
Echo  5.4 System >> output.txt
Echo ============>> output.txt
Echo. >> output.txt
find /I "Include command line in process creation events" admtemplates.txt >> output.txt
find /I "Continue experiences on this device" admtemplates.txt >> output.txt
find /I "Turn off background refresh of Group Policy" admtemplates.txt >> output.txt
find /I "Turn off access to the Store" admtemplates.txt >> output.txt
find /I "Turn off Internet Connection Wizard if URL connection" admtemplates.txt >> output.txt
find /I "Turn off Internet download for Web publishing" admtemplates.txt >> output.txt
find /I "Turn off printing over HTTP" admtemplates.txt >> output.txt
find /I "Turn off Registration if URL connection" admtemplates.txt >> output.txt
find /I "Turn off Search Companion content file updates" admtemplates.txt >> output.txt
find /I "Order Prints" admtemplates.txt >> output.txt
find /I "Publish to Web" admtemplates.txt >> output.txt
find /I "Turn off the Windows Messenger Customer Experience Improvement Program" admtemplates.txt >> output.txt
find /I "Turn off Windows Customer Experience Improvement Program" admtemplates.txt >> output.txt
find /I "Turn off Windows Error Reporting" admtemplates.txt >> output.txt
find /I "Disallow copying of user input methods to the system account for sign-in" admtemplates.txt >> output.txt
find /I "Block user from showing account details on sign-in" admtemplates.txt >> output.txt
find /I "Do not display network selection UI" admtemplates.txt >> output.txt
find /I "Do not enumerate connected users on domain-joined computers" admtemplates.txt >> output.txt
find /I "Enumerate local users on domain-joined computers" admtemplates.txt >> output.txt
find /I "Turn off app notifications on the lock screen" admtemplates.txt >> output.txt
find /I "Turn on convenience PIN sign-in" admtemplates.txt >> output.txt
find /I "Enable RPC Endpoint Mapper Client Authentication" admtemplates.txt >> output.txt
find /I "Restrict Unauthenticated RPC clients" admtemplates.txt >> output.txt
find /I "Enable/Disable PerfTrack" admtemplates.txt >> output.txt
find /I "Turn off the advertising ID" admtemplates.txt >> output.txt
find /I "Enable Windows NTP Client" admtemplates.txt >> output.txt
find /I "Enable Windows NTP Server" admtemplates.txt >> output.txt
Echo. >> output.txt
Echo =======================>> output.txt
Echo  5.5 Windows Components >> output.txt
Echo =======================>> output.txt
Echo. >> output.txt
find /I "\windows components" admtemplates.txt >> output.txt
Echo. >> output.txt
Echo =======================>> output.txt
Echo  5.6 LAPS >> output.txt
Echo =======================>> output.txt
Echo 1. LAPS AdmPwd GPO Extension / CSE is installed >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\Winlogon\GPExtensions\{D76B9641-3288-4f75-942D087DE603E3EA}\DllName" >> output.txt
Echo If output is not returned then parameter is not configured >> output.txt
Echo 2. 'Do not allow password expiration time longer than required by policy' should be enabled >> output.txt
REG QUERY HKEY_LOCAL_MACHINE\SOFTWARE\Policies\MicrosoftServices\AdmPwd\PwdExpirationProtectionEnabled >> output.txt
Echo If output is not returned then parameter is not configured >> output.txt
Echo 3. Enable Local Admin Password Management >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd\AdmPwdEnabled" >> output.txt
Echo If output is not returned then parameter is not configured >> output.txt
Echo 4. Password Settings: Password Complexity' is set to 'Enabled: Large letters + small letters + numbers + special characters >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\MicrosoftServices\AdmPwd\PasswordComplexity" >> output.txt
Echo Recommended value is  Enabled: Large letters + small letters + numbers + special characters, if output is blank then parameter is not configured >> output.txt
Echo 5. Password Settings: Password Length >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft Services\AdmPwd\PasswordLength" >> output.txt
Echo Password length must be set to 8 >> output.txt
Echo 6. 'Password Settings: Password Age (Days) >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\MicrosoftServices\AdmPwd\PasswordAgeDays" >> output.txt
Echo Password age must be set to 90 days >> output.txt
Echo. >> output.txt
Echo Checking for LAPS configuration in Administrative templates >>output.txt
find /I "LAPS" admtemplates.txt >> output.txt
Echo. >> output.txt
Echo ===================================>> output.txt
Echo  5.7 SCM: Pass the Hash Mitigations >> output.txt
Echo ===================================>> output.txt
Echo. >> output.txt
find /I "Apply UAC restrictions to local accounts" admtemplates.txt >> output.txt
Echo If output is not returned then parameter is not configured >> output.txt
Echo. >> output.txt
Echo ===================================================================================================================================>> output.txt
Echo  5.8 Only administrators should be able to redefine certain base system-wide attributes such as COM ports, Serial ports or printers >> output.txt
Echo ===================================================================================================================================>> output.txt
Echo. >> output.txt
find /I "Strengthen default permissions of internal system objects" securityoptions.txt >> output.txt
find /I "System objects: Require case insensitivity for non-Windows subsystems" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo ============= >> output.txt
Echo  6 Encryption >> output.txt
Echo ============= >> output.txt
Echo ===================================== >> output.txt
Echo  6.1 Disable weak Encryption protocol >> output.txt
Echo ===================================== >> output.txt
Echo. >> output.txt
REG QUERY "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\">> output.txt
REG QUERY "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL2\Server\Enabled">> output.txt
REG QUERY "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL3\Server\Enabled">> output.txt
Echo. >> output.txt
Echo ====================================== >> output.txt
Echo  6.2 Enable TLS 1.2 and above protocol >> output.txt
Echo ====================================== >> output.txt
REG QUERY "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols">> output.txt
REG QUERY "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS1.2\Server\Enabled">> output.txt
Echo TLS 1.2 is enabled if value of the key ENABLED is returned 1, disabled if 0 >> output.txt
Echo. >> output.txt
Echo =============>> output.txt
Echo 7 SMB Protcol >> output.txt
Echo ============= >> output.txt 
Echo. >> output.txt
Echo ============================>> output.txt
Echo 7.1 Disable weak SMB Protcol >> output.txt
Echo ============================ >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\SMB1" >> output.txt
Echo SMB1 can be considered as disabled if output is 0 or output is blank as the key does not exist. >> output.txt
Echo ========================>> output.txt
Echo 8 Non-Essential Services >> output.txt
Echo =========================>> output.txt
Echo. >> output.txt
Echo =================================== >> output.txt
Echo 8.1. Disable Non-Essential Services >> output.txt
Echo =================================== >> output.txt
Echo. >> output.txt
sc query state= all | find "SERVICE_NAME STATE" >> output.txt
Echo. >> output.txt
Echo ============================>> output.txt
Echo 9. System Folder Permissions >> output.txt
Echo ============================ >> output.txt
showacls %systemdrive% >> output.txt
showacls %systemroot% >> output.txt
showacls %systemroot%\system32 >> output.txt
showacls %systemroot%\system32\drivers >> output.txt
showacls %systemroot%\system32\config >> output.txt
showacls %systemroot%\system32\spool >> output.txt
showacls %systemroot%\sysvol >> output.txt
showacls %systemroot%\security >> output.txt
showacls %systemroot%\ntds >> output.txt
showacls %systemroot%\ntfrs >> output.txt
Echo. >> output.txt

Echo End Of Script >> output.txt


