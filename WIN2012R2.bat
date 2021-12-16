Echo ############################################################################################## 	>> output.txt
Echo       Deloitte Windows Server 2012 R2 Configuration Interrogation Script             	>> output.txt
Echo       Property of Deloitte Touche Tohmatsu India LLP 					                 	>> output.txt
Echo ############################################################################################## 	>> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ############################################################################################## 	>> output.txt
Echo Executing the WIN2012r2.bat file............								>> output.txt
Echo. >> output.txt		
	
Echo NOTES: 												>> output.txt
Echo This script must be run locally on a Windows Server 2012 R2 as a user with Administrative privileges. 	>> output.txt
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


Echo ========================= >> output.txt
Echo 2.1. MSS Security Options >> output.txt
Echo ========================= >> output.txt

		
echo	2.1.1 Set 'MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)' to 'Disabled' 	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon:AutoAdminLogon"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.2 Set 'MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)' to 'Enabled: Highest protection, source routing is completely disabled'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters:DisableIPSourceRouting"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.3 Set 'MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)' to 'Enabled: Highest protection, source routing is completely disabled'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters:EnableICMPRedirect"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.4 Set 'MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes' to 'Disabled'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters:EnableICMPRedirect"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.5 Set 'MSS: (KeepAliveTime) How often keep-alive packets are sent in milliseconds' to 'Enabled: 300,000 or 5 minutes (recommended)'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters:KeepAliveTime"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.6 Set 'MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers' to 'Enabled'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters:NoNameReleaseOnDemand"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.7 Set 'MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses (could lead to DoS)' to 'Disabled'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters:PerformRouterDiscovery "  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.8 Set 'MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)' to 'Enabled' 	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager:SafeDllSearchMode"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.9 Set 'MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)' to 'Enabled: 5 or fewer seconds'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\Winlogon:ScreenSaverGracePeriod"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.10 Set 'MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted' to 'Enabled: 3'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters:TcpMaxDataRetransmissions"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.11 Set 'MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted' to 'Enabled: 3'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters:TcpMaxDataRetransmissions"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	
		
echo	2.1.12 Set 'MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning' to 'Enabled: 90% or less'  	>> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Eventlog\Security:WarningLevel"  	>> output.txt
echo.	>> output.txt	
echo.	>> output.txt	


Echo ============================= >> output.txt
Echo 2.2. Network Security Options >> output.txt
Echo ============================= >> output.txt

		
echo 2.2.1 Set 'Network security: Allow Local System to use computer identity for NTLM' to 'Enabled'  	>>output.txt
FIND/i "Network security: Allow Local System to use computer identity for NTLM" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.2.2 Set 'Network security: Allow LocalSystem NULL session fallback' to 'Disabled'  	>>output.txt
FIND/i "Network security: Allow LocalSystem NULL session fallback" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.2.3 Set 'Network Security: Allow PKU2U authentication requests to this computer to use online identities' to 'Disabled'  	>>output.txt
FIND/i "Network Security: Allow PKU2U authentication requests to this computer to use online identities" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.2.4 Set 'Network Security: Configure encryption types allowed for Kerberos' to 'AES256_HMAC_SHA1, Future encryption types'  	>>output.txt
FIND/i "Network Security: Configure encryption types allowed for Kerberos" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.2.5 Set 'Network security: Do not store LAN Manager hash value on next password change' to 'Enabled'  	>>output.txt
FIND/i "Network security: Do not store LAN Manager hash value on next password change" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.2.6 Set 'Network security: Force logoff when logon hours expire' to 'Enabled'  	>>output.txt
FIND/i "Network security: Force logoff when logon hours expire" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	


echo "2.2.7. Set Network security Send NTLMv2 response only Refuse LM & NTLM" >> output.txt
FIND/i "Network security: LAN Manager authentication level" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.2.8 Set 'Network security: LDAP client signing requirements' to 'Negotiate signing or higher'  	>>output.txt
FIND/i "Network security: LDAP client signing requirements" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.2.9 Set 'Network security: Minimum session security for NTLM SSP based (including secure RPC) clients' to 'Require NTLMv2 session security, Require 128-bit encryption'  	>>output.txt
FIND/i "Network security: Minimum session security for NTLM SSP based (including secure RPC) clients" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.2.10 Set 'Network security: Minimum session security for NTLM SSP based (including secure RPC) servers' to 'Require NTLMv2 session security, Require 128-bit encryption'  	>>output.txt
FIND/i "Network security: Minimum session security for NTLM SSP based (including secure RPC) servers" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	


Echo ====================== >> output.txt
Echo 2.3. Security Options >> output.txt
Echo ====================== >> output.txt

		
echo 2.3.1 Set 'Interactive logon: Do not display last user name' to 'Enabled'  	>>output.txt
find/i "Interactive Logon: Don't display last" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.3.2 Set 'Interactive logon: Do not require CTRL+ALT+DEL' to 'Disabled'  	>>output.txt
find/i "Interactive Logon: Do not require CTRL+ALT+DEL" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.3.3 Set 'Interactive logon: Machine inactivity limit' to '900 or fewer second(s), but not 0'  	>>output.txt
find/i "Interactive Logon: Machine inactivity limit" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.3.4 Configure 'Interactive logon: Message text for users attempting to log on'  	>>output.txt
find/i "Interactive Logon: Message text for users attempting to log on" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.3.5 Configure 'Interactive logon: Message title for users attempting to log on'  	>>output.txt
find/i "Interactive Logon: Message title for users attempting to log on" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.3.6 Set 'Interactive logon: Number of previous logons to cache (in case domain controller is not available)' to '1 or fewer logon(s)' (MS only	>>output.txt
find/i "Interactive Logon: Number of previous logons to cache" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.3.7 Set 'Interactive logon: Prompt user to change password before expiration' to ' 14 days'  	>>output.txt
find/i "Interactive Logon: Prompt user to change password before expiration" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.3.8 Set 'Interactive logon: Require Domain Controller Authentication to unlock workstation' to DIsabled (MS only)  	>>output.txt
find/i "Interactive Logon: Require Domain Controller Authentication to unlock workstation" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
echo 2.3.9 Set 'Interactive logon: Smart card removal behavior' to 'Lock Workstation' or higher  	>>output.txt
find/i "Interactive Logon: Smart card removal behavior" securityoptions.txt >> output.txt
echo. >> output.txt	
echo. >> output.txt	
		
		
Echo ================================== >> output.txt
Echo 2.4. User Account Security Options >> output.txt
Echo ================================== >> output.txt
		
echo 2.4.1 Set 'User Account Control: Admin Approval Mode for the Built-in Administrator account' to 'Enabled'  	>>output.txt
find/i "User Account Control: Admin Approval Mode for the Built-in Administrator account" securityoptions.txt >> output.txt
echo. >>output.txt	
echo.	>>output.txt	
		
echo 2.4.2 Set 'User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop' to 'Disabled'  	>>output.txt
find/i "User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop" securityoptions.txt >> output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.3 Set 'User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode' to 'Prompt for consent on the secure desktop'  	>>output.txt
find/i "User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode" securityoptions.txt >> output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.4 Set 'User Account Control: Behavior of the elevation prompt for standard users' to 'Automatically deny elevation requests'  	>>output.txt
find/i "User Account Control: Behavior of the elevation prompt for standard users" securityoptions.txt >> output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.5 Set 'User Account Control: Detect application installations and prompt for elevation' to 'Enabled'  	>>output.txt
find/i "User Account Control: Detect application installations and prompt for elevation" securityoptions.txt >> output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.6 Set 'User Account Control: Only elevate UIAccess applications that are installed in secure locations' to 'Enabled'  	>>output.txt
find/i "User Account Control: Only elevate UIAccess applications that are installed in secure locations" securityoptions.txt >> output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.7 Set 'User Account Control: Run all administrators in Admin Approval Mode' to 'Enabled'  	>>output.txt
find/i "User Account Control: Run all administrators in Admin Approval Mode" securityoptions.txt >> output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.8 Set 'User Account Control: Switch to the secure desktop when prompting for elevation' to 'Enabled'  	>>output.txt
find/i "User Account Control: Switch to the secure desktop when prompting for elevation" securityoptions.txt >> output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.9 Set 'User Account Control: Virtualize file and registry write failures to per-user locations' to 'Enabled'  	>>output.txt
find/i "User Account Control: Virtualize file and registry write failures to per-user locations" securityoptions.txt >> output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.10 Ensure 'Enable Windows NTP Client' is set to 'Enabled'	>>output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters"     	>>output.txt 
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.11 Ensure 'Restrict Remote Desktop Services users to a single Remote Desktop Services session' is set to 'Enabled'	>>output.txt
find/i "Restrict Remote Desktop Services users to a single Remote Desktop Services session" admtemplates.txt    >>output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.12 Set 'Allow remote access' is set to disabled	>>output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"     	>>output.txt
echo. >>output.txt	
echo. >>output.txt	
		
echo 2.4.13 Logging PowerShell Activity	>>output.txt
reg query "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\Transcription"     	>>output.txt
find/i "PowerShell Transcription" admtemplates.txt    >>output.txt

echo. >>output.txt	
echo. >>output.txt	
		

Echo ================ >> output.txt
Echo 2.5. User Rights >> output.txt
Echo ================ >> output.txt

echo	2.5.1. User Rights Assignments'  	>>output.txt
copy output.txt + userrights.txt output.txt
echo.	>>output.txt	
echo.	>>output.txt	

Echo ====================== >> output.txt
Echo 2.6. Security Settings >> output.txt
Echo ====================== >> output.txt

echo 2.6.1 Account Policies	>>output.txt
copy output.txt + accountlockoutpolicy.txt output.txt

Echo ===================================== >> output.txt
Echo 2.7. Auditing, Logging and Monitoring >> output.txt
Echo ===================================== >> output.txt

echo	2.7.1. Audit Policy	>>output.txt
copy output.txt + auditpolicy.txt output.txt
Echo. >> output.txt
Echo Detailed Audit logging >> output.txt
auditpol /get /category:* >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.7.2. Event log Sizes	>>output.txt

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

echo.	>>output.txt	
echo.	>>output.txt	

echo	2.7.3. Permissions on Event logs	>>output.txt

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

echo.	>>output.txt	
echo.	>>output.txt	

echo	2.7.4. Auditing of sensitive system and application files and directories should be enabled for servers	>>output.txt
echo    Manual Check>>output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.7.5. Auditing of sensitive system registry keys should be enabled on servers	>>output.txt
echo    Manual Check>>output.txt
echo.	>>output.txt	
echo.	>>output.txt	

Echo ============================ >> output.txt
Echo 2.8. General Security Checks >> output.txt
Echo ============================ >> output.txt

echo	2.8.1 Accounts	>>output.txt
FIND /i "Accounts: Rename administrator account" securityoptions.txt >> output.txt
FIND /i "Accounts: Disable guest account" securityoptions.txt >> output.txt
FIND /i "Accounts: Limit local account use of blank passwords to console logon only" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.2 Audit	>>output.txt
FIND /i "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" securityoptions.txt >> output.txt
FIND /i "Shut down system immediately if unable to log security audits" securityoptions.txt >> output.txt
FIND /i "Audit the access of global system objects" securityoptions.txt >> output.txt
FIND /i "Audit the use of Backup and Restore privilege" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.3 DCOM	>>output.txt
FIND /i "DCOM: Machine Access Restrictions in Security Descriptor Definition Language (SDDL) syntax" securityoptions.txt >> output.txt
FIND /i "DCOM: Machine Launch Restrictions in Security Descriptor Definition Language (SDDL) syntax" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.4 Domain controller	>>output.txt
FIND /i "Domain controller: Allow server operators to schedule tasks" securityoptions.txt >> output.txt
FIND /i "Domain controller: LDAP server signing requirements" securityoptions.txt >> output.txt
FIND /i "Domain controller: Refuse machine account password changes" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.5 Domain member	>>output.txt
FIND /i "Domain member: Digitally encrypt or sign secure channel data (always)" securityoptions.txt >> output.txt
FIND /i "Domain member: Digitally encrypt secure channel data (when possible)" securityoptions.txt >> output.txt
FIND /i "Domain member: Digitally sign secure channel data (when possible)" securityoptions.txt >> output.txt
FIND /i "Domain member: Disable machine account password changes" securityoptions.txt >> output.txt
FIND /i "Domain member: Maximum machine account password age" securityoptions.txt >> output.txt
FIND /i "Domain member: Require strong (Windows 2000 or later) session key" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.6 Microsoft network client	>>output.txt
FIND /i "Microsoft network client: Digitally sign communications (always)" securityoptions.txt >> output.txt
FIND /i "Microsoft network client: Digitally sign communications (if server agrees)" securityoptions.txt >> output.txt
FIND /i "Microsoft network client: Send unencrypted password to third-party SMB servers" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.7 Microsoft network server	>>output.txt
FIND /i "Microsoft network server: Amount of idle time required before suspending session" securityoptions.txt >> output.txt
FIND /i "Microsoft network server: Digitally sign communications (always)" securityoptions.txt >> output.txt
FIND /i "Microsoft network server: Digitally sign communications (if client agrees)" securityoptions.txt >> output.txt
FIND /i "Microsoft network server: Disconnect clients when logon hours expire" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.8 Recovery console	>>output.txt
FIND /i "Recovery console: Allow automatic administrative logon" securityoptions.txt >> output.txt
FIND /i "Recovery console: Allow floppy copy and access to all drives and all folders" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.9 Network Access	>>output.txt
FIND /i "Network access:" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.10 Shutdown	>>output.txt
FIND /i "Shutdown: Allow system to be shut down without having to log on" securityoptions.txt >> output.txt
FIND /i "Shutdown: Clear virtual memory pagefile" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.11 System objects	>>output.txt
FIND /i "System objects: Require case insensitivity for non-Windows subsystems" securityoptions.txt >> output.txt
FIND /i "System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.8.12 System settings	>>output.txt
FIND /i "System settings: Optional subsystems" securityoptions.txt >> output.txt
FIND /i "System settings: Use Certificate Rules on Windows Executables for Software Restriction Policies" securityoptions.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

Echo ============================================ >> output.txt
Echo 2.9. Windows Firewall With Advanced Security >> output.txt
Echo ============================================ >> output.txt
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

Echo ======================== >> output.txt
Echo 2.10. Windows Components >> output.txt
Echo ======================== >> output.txt

echo	2.10.1 AutoPlay Policies	>>output.txt
FIND /i "Turn off Autoplay" admtemplates.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.10.2 Event Log	>>output.txt
FIND /i "Specify the maximum log file size" admtemplates.txt >> output.txt
FIND /i "Control Event Log behavior when the log file reaches its maximum size" admtemplates.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.10.3. Terminal Services	>>output.txt
FIND /i "Set client connection encryption level" admtemplates.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.10.4 Windows Installer	>>output.txt
FIND /i "Always install with elevated privileges" admtemplates.txt >> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

Echo ============================= >> output.txt
Echo 2.11. Non-Essential Services >> output.txt
Echo ============================= >> output.txt

echo	2.11.1 Disable non-essential services	>>output.txt
Echo. >> output.txt
sc query state= all | findstr "SERVICE_NAME STATE" >> output.txt
Echo. >> output.txt

Echo ================ >> output.txt
Echo 2.12. Encryption >> output.txt
Echo ================ >> output.txt

echo	2.12.1 Enable TLS 1.2 and above protocol 	>>output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols"	>> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS1.2\Server\Enabled"	>> output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo	2.12.2 Disable weak SMB protocol	>>output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters " 	>>output.txt
echo.	>>output.txt	
echo.	>>output.txt	

echo ----------------------------------------------------------------End of Script-------------------------------------------------------------------------------- >>output.txt
