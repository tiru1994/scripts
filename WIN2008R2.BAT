Echo ############################################################################################## 	>> output.txt
Echo       Deloitte Windows Server 2008 R2 Configuration Interrogation Script             	>> output.txt
Echo       Property of Deloitte Touche Tohmatsu LLP 					                 	>> output.txt
Echo ############################################################################################## 	>> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ############################################################################################## 	>> output.txt
Echo Executing the WIN2008R2.bat file............								>> output.txt
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
Echo ================================================================== >> output.txt
Echo 2.1.1. AUDIT THE ACCESS OF GLOBAL SYSTEM OBJECTS SHOUD BE DISABLED>> output.txt
Echo ================================================================== >> output.txt
Echo. >> output.txt
Echo "The recommended Value of following registry key should be set to 0" >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Control\Lsa\AuditBaseObjects" >>output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================================================================= >> output.txt
Echo 2.1.2. AUDITING OF SENSITIVE SYSTEM , APPLICATION FILES AND DIRECTORIES SHOULD BE ENABLED ON SERVERS >> output.txt
Echo ======================================================================================================== >> output.txt
Echo. >> output.txt

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

Echo. >> output.txt
Echo. >> output.txt


rem Echo ======================================================================= >> output.txt
rem Echo 2.1.3. AUDITING OF SENSITIVE REGISTRY KEYS SHOULD BE ENABLED ON SERVERS>> output.txt
rem Echo ======================================================================= >> output.txt
rem Echo. >> output.txt

rem Echo The registry key access details are made available in the registry text file >> output.txt
rem Echo. >> output.txt

Echo =======================================================================  >> output.txt
Echo 2.1.3. AUDITING OF SENSITIVE REGISTRY KEYS SHOULD BE ENABLED ON SERVERS >> output.txt
Echo ======================================================================= >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt

Echo ===============================================================================  >> output.txt
Echo 2.1.4	AUDITING SHOULD BE ENABLED FOR ACCOUNT LOGON EVENT SUCCESSES AND FAILURES.>> output.txt
Echo ============================================================================ >> output.txt
Echo. >> output.txt

FIND /i "Audit account logon events" auditpolicy.txt >> output.txt	
Echo. >> output.txt


Echo ============================================================================  >> output.txt
Echo 2.1.5. AUDITING SHOULD BE ENABLED FOR ACCOUNT MANAGEMENT SUCCESS AND FAILURE>> output.txt
Echo ============================================================================ >> output.txt
Echo. >> output.txt

FIND /i "Audit account management" auditpolicy.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ===================================================================== >>output.txt
Echo 2.1.6. AUDITING SHOULD BE ENABLED FOR LOGON EVENT SUCCESS AND FAILURE>>output.txt 
Echo =====================================================================>>output.txt
Echo. >> output.txt

FIND /i "Audit logon events" auditpolicy.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt
	
Echo ============================================================================================= >> output.txt
Echo 2.1.7. AUDITING SHOULD BE ENABLED FOR OBJECT ACCESS IF AN EVENT CORRELATION SYSTEM IS PRESENT>> output.txt
Echo ============================================================================================= >> output.txt
Echo. >> output.txt

FIND /i "Audit object access" auditpolicy.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo =============================================================== >> output.txt
Echo 2.1.8	AUDITING SHOULD BE ENABLED FOR SUCCESSFUL POLICY CHANGES.>> output.txt
Echo 						And										>> output.txt
Echo 2.1.9	AUDITING SHOULD BE ENABLED FOR SYSTEM EVENTS SUCCESSES.>> output.txt
Echo ============================================================= >> output.txt
Echo. >> output.txt

FIND /i  "Audit directory service access" auditpolicy.txt >> output.txt
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

FIND /i "Audit system events" auditpolicy.txt >> output.txt
Echo. >> output.txt	

Echo. >> output.txt
Echo. >> output.txt


Echo ================================================================================================================================================================ >> output.txt
Echo 2.1.10	FOR SERVERS, THE AUDIT LOGS SHOULD BE SUFFICIENTLY LARGE AND THE OVERWRITE POLICY SHOULD BE APPROPRIATE TO ENSURE THE AUDIT TRAIL IS USABLE AND MANAGEABLE.>> output.txt
Echo ================================================================================================================================================================= >> output.txt

Echo. >> output.txt
Echo "Maximum size must be =or > 100 mb" >> output.txt
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

Echo ===============================================================================================>>output.txt
Echo 2.1.11	Logs containing auditing information should be protected from guest access for servers. >> output.txt 
Echo ===============================================================================================>>output.txt
Echo. >> output.txt

Echo "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\Eventlog\Application\RestrictGuestAccess" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Services\Eventlog\System\RestrictGuestAccess" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Services\Eventlog\Security\RestrictGuestAccess" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\winevt\Application.evtx" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\winevt\system.evtx" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\winevt\security.evtx" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ====================================== >> output.txt
Echo 2.2. FILE SYSTEM ACCESS AND MANAGEMENT >> output.txt
Echo ====================================== >> output.txt

Echo ================================================================================= >> output.txt
Echo 2.2.1. DIRECTORIES THAT CONATAIN SENSITIVE WINDOWS SYSTEM FILES SHOULD BE SECURED>> output.txt 
Echo ================================================================================= >> output.txt
Echo. >> output.txt

showacls.exe %systemdrive% >> output.txt
Echo. >> output.txt
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
showacls.exe %systemroot%\sysvol >> output.txt
Echo. >> output.txt
showacls.exe %systemroot%\security >> output.txt
Echo. >> output.txt
showacls.exe %systemroot%\ntds >> output.txt
Echo. >> output.txt
showacls.exe %systemroot%\ntfrs >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo =================================================================================================================== >>output.txt
Echo 2.2.2 FILE SHARES OTHER THAN THE BUILT-IN ADMINISTRATIVE FILE SHARES SHOULD BE CREATED ONLY AS NECESSARY AND SECURED >> output.txt
Echo =================================================================================================================== >> output.txt
Echo. >> output.txt
net share >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================>>output.txt
Echo 2.2.3 KEY EXECUTIBLE FILES SHOULD BE PROPERLY RESTRICTED FROM UNAUTHORISED USERS>> output.txt
Echo ================================================================================ >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\arp.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\at.exe"  >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\attrib.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\cacls.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\cmd.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\dcpromo.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\eventcreate.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\finger.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\ftp.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\gpupdate.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\icacls.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\ipconfig.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\nbtstat.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\net.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\net1.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\netsh.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\netstat.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\nslookup.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\ping.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\reg.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\regedt32.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\regini.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\regsvr32.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\route.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\runonce.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\sc.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\secedit.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\subst.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\systeminfo.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\syskey.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\telnet.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\tftp.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\tlntsvr.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\tracert.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\xcopy.exe" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================================== >> output.txt
Echo 2.2.4	LOGS CONTAINING AUDITING INFORMATION SHOULD BE SECURED AT THE DIRECTORY LEVEL >> output.txt
Echo ==================================================================================== >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\Winevt\Logs\Application.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\Winevt\Logs\Security.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\Winevt\Logs\Setup.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\Winevt\Logs\System.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\Winevt\Logs\ForwardedEvents.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\Winevt\Logs\HardwareEvents.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\Winevt\Logs\Internet Explorer.evtx" >> output.txt
Echo. >> output.txt
cacls "C:\Windows\system32\Winevt\Logs\Key Management Service.evtx" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================================================================================================================================================================== >> output.txt
Echo 2.2.5. PARTS OF THE REGISTRY CONTAINING SENSITIVE SYSTEM, SECURITY, AND NETWORK CONFIGURATION INFORMATION SHOULD BE SECURED TO PREVENT UNAUTHORIZED USERS FROM LEVERAGING SYSTEM INFORMATION TO LEARN ABOUT AND EXPLOIT THE SERVER >> output.txt
Echo ================================================================================================================================================================================================================================== >> output.txt
Echo. >> output.txt
accesschk -k HKLM\Software\Microsoft\WindowsNT\CurrentVersion\Winlogon>> output.txt
accesschk -k HKLM\SYSTEM\CurrentControlSet\Control\Lsa>> output.txt
accesschk -k HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers>> output.txt
accesschk -k HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\KnownDLLs>> output.txt
accesschk -k HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Shares>> output.txt
accesschk -k HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities>> output.txt
accesschk -k HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers>> output.txt
accesschk -k HKLM\SOFTWARE\Policies\SNMP\Parameters\ValidCommunities>> output.txt
accesschk -k HKLM\SOFTWARE\Policies\SNMP\Parameters\PermittedManagers>> output.txt

Echo. >> output.txt

Echo ================================================================== >> output.txt
Echo 2.2.6. SHARES THAT ARE ACCESSIBLE ANONYMOUSLY SHOULD BE RESTRICTED >> output.txt
Echo ================================================================== >> output.txt
Echo. >> output.txt
Echo  "The recommended Value of following registry key should be set to COMCFG,DFS$" >>output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ====================================================================================================================  >> output.txt
Echo 2.2.7.  REGISTRY SHOULD BE SECURED SO THAT UNAUTHORIZED USERS CANNOT MODIFY THE LIST OF PROGRAMS RUN ON START UP >> output.txt
Echo ==================================================================================================================== >> output.txt
Echo. >> output.txt
accesschk -k HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run>> output.txt
accesschk -k HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce>> output.txt
Echo if output of point is not displayed, refer registry.txt file >> output.txt
accesschk -k HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\ >> registry.txt
Echo. >> output.txt



Echo ======================================================== >> output.txt
Echo 2.2.8. THE REGISTRY'S ALLOWED SUBPATHS SHOULD BE SECURED>> output.txt
Echo ======================================================== >> output.txt
Echo. >> output.txt
FIND/i "Network access: Remotely accessible registry paths" securityoptions.txt  >>output.txt
Echo. >> output.txt
FIND/i "Network access: Remotely accessible registry paths and sub-paths" securityoptions.txt  >>output.txt
Echo. >> output.txt  

Echo. >> output.txt

Echo. >> output.txt


Echo ============================================================================= >> output.txt
Echo 2.2.9. UNAUTHORIZED USERS SHOULD NOT BE ALLOWED TO REMOTELY EDIT THE REGISTRY >> output.txt
Echo ============================================================================= >> output.txt
Echo. >> output.txt

accesschk -k HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg >> output.txt
Echo. >> output.txt 

Echo. >> output.txt
Echo. >> output.txt


Echo ============================================================================================ >> output.txt
Echo 2.2.10. UNAUTHORIZED USERS SHOULD NOT BE ALLOWED TO REMOTELY EDIT THE REGISTRY'S ALLOWED PATH >> output.txt
Echo ============================================================================================ >> output.txt
Echo. >> output.txt
accesschk -k HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg>>output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt


Echo ======================== >> output.txt
Echo 2.3.NETWORK CONFIGURATION >> output.txt
Echo ======================== >> output.txt
Echo. >> output.txt

Echo ================================================== >> output.txt
Echo 2.3.1. DENIAL OF ACCESS TO THE SYSTEM FROM NETWORK >> output.txt 
Echo ================================================== >> output.txt
Echo. >> output.txt

FIND /i "Access this computer from the network" userrights.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================== >> output.txt
Echo 2.3.2. MINIMUM SESSION SECURITY FOR NTLM SSP BASED SERVERS >> output.txt
Echo ========================================================== >> output.txt
Echo. >> output.txt
Echo "The recommended Value of following registry key should be set to 0X20000000" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinServerSec" >> output.txt
find /i "NTLM SSP" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ============================================================== >> output.txt
Echo 2.3.3. MICROSOFT NETWORK SERVER: DIGITALLY SIGN COMMUNICATIONS(Always) >> output.txt
Echo ============================================================== >> output.txt
Echo. >> output.txt
Echo "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\RequireSecuritySignature" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================== >> output.txt
Echo 2.3.4. DONOT ALLOW ANONYMOUS ENUMERATION OF SAM ACCOUNT AND SHARES>> output.txt
Echo ================================================================== >> output.txt
Echo. >> output.txt
Echo "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\RestrictAnonymous" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.3.5. DONOT STORE LANMANAGER HASH VALUE ON NEXT PASSWORD CHANGE>> output.txt
Echo ================================================================ >> output.txt
Echo. >> output.txt
Echo  "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\NoLMHash" >> output.txt
Echo. >> output.txt

Echo ======================================= >> output.txt
Echo 2.3.6. LAN MANAGER AUTHENTICATION LEVEL>> output.txt
Echo ======================================= >> output.txt
Echo. >> output.txt
Echo "For the Enterprise Member Server and Enterprise Domain Controller profile The recommended Value of following registry key should be set to 3"
Echo. >> output.txt
Echo "For the SSLF Member Server and SSLF Domain Controller profile The recommended Value of following registry key should be set to 5"
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel" >> output.txt
Echo. >> output.txt

Echo ============================================= >> output.txt
Echo 2.3.7. SET CLIENT CONNECTION ENCRYPTION LEVEL >> output.txt
Echo ============================================= >> output.txt
Echo. >> output.txt
Echo "The recommended Value of following registry key should be set to 3" >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\MinEncryptionLevel" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ===================================== >> output.txt
Echo 2.3.8. DONOT ALLOW DRIVE REDIRECTION>> output.txt
Echo ===================================== >> output.txt		
Echo. >> output.txt
Echo For the Enterprise Member Server and Enterprise Domain Controller profile The recommended value is Not Configured >> output.txt
Echo. >> output.txt
Echo For the SSLF Member Server and SSLF Domain Controller profile  The recommended value of following registry key should be set to 1 >> output.txt
Echo. >> output.txt
find /i "Do not allow drive redirection" admtemplates.txt >> output.txt
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\fDisableCdm"  >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================ >> output.txt
Echo 2.3.9	RPC ENDPOINT MAPPER CLIENT AUTHENTICATION>> output.txt
Echo ================================================>>output.txt
Echo. >> output.txt
find /i "RPC Endpoint Mapper Client"  admtemplates.txt >> output.txt
Echo. >> output.txt

Echo ===================== >> output.txt
Echo 2.4. GROUP MANAGEMENT >> output.txt
Echo ===================== >> output.txt
Echo. >> output.txt

Echo ============================================================================================================================================================== >> output.txt
Echo 2.4.1. THE BUILT IN LOCAL GROUPS SHOULD ONLY CONTAIN GLOBAL GROUPS THAT ARE AUTHORIZED FOR EACH PURPOSE                                                        >> output.txt 
Echo 2.4.3. THE RENAMED ADMINISTRATOR ACCOUNT SHOULD BE THE ONLY MEMBER OF THE LOCAL ADMINISTRATORS GROUP AND ALL REMAINING MEMBERS SHOULD NOT BE INDIVIDUAL USERS  >> output.txt
Echo 2.4.7. THE USERS LOCAL GROUP SHOULD ONLY CONTAIN THE DOMAIN USERS GLOBAL GROUP                                                                                 >> output.txt
Echo ============================================================================================================================================================== >> output.txt
Echo. >> output.txt
dumpsec /rpt=Groupscol /saveas=fixed /outfile=users.txt
copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================================== >> output.txt
Echo 2.4.2. NULL CREDENTIAL LOGON SHOULD NOT BE INCLUDED AS A MEMBER OF THE EVERYONE GROUP >> output.txt 
Echo ==================================================================================== >> output.txt
Echo. >> output.txt
Echo  "The recommended Value of following registry key should be set to 0">> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\everyoneincludesanonymous" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================================== >> output.txt
Echo 2.4.4. RESTRICTED GROUP FEATURE SHOULD BE UTILIZED TO CONTROL ACCESS TO CRITICAL SYSTEM GROUPS ON THE SERVER >> output.txt 
Echo ========================================================================================================== >> output.txt
Echo. >> output.txt
Echo Manual Check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================================== >> output.txt
Echo 2.4.5. THE SPECIAL GROUP EVERYONE SHOULD BE GIVEN LEAST REQUIRED ACCESS TO FILES AND DIRECTORIES >> output.txt 
Echo ========================================================================================================== >> output.txt
Echo. >> output.txt
Echo Manual Check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================ >> output.txt
Echo 2.4.6. TELNET CLIENT GROUP SHOULD NOT BE CREATED >> output.txt 
Echo ================================================ >> output.txt
Echo. >> output.txt
dumpsec /rpt=Groupscol /saveas=fixed /outfile=users.txt
copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ======================== >> output.txt
Echo 2.5. PASSWORD MANAGEMENT  >> output.txt
Echo ======================== >> output.txt
Echo. >> output.txt

Echo ========================================================================================== >> output.txt
Echo 2.5.1. DEFAULT PASSWORDS SUPPLIED WITH SOFTWARE PACKAGES SHOULD BE CHANGED ON INSTALLATION >> output.txt 
Echo ========================================================================================== >> output.txt
Echo. >> output.txt
ECHO "Manual Check" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================ >> output.txt
Echo 2.5.2. STRONG PASSWORD SHOULD BE IMPLEMENTED >> output.txt 
Echo ============================================ >> output.txt
Echo. >> output.txt
FIND /i "Enforce password history" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Maximum password age" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Minimum password age" passwordpolicy.txt >> output.txt
Echo. >> output.txt
FIND /i "Minimum password length" passwordpolicy.txt >> output.txt
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

Echo ======================================================================== >> output.txt
Echo 2.5.3. PASSWORD SHOULD NOT BE STORED LOCALLY USING REVERSIBLE ENCRYPTION >> output.txt 
Echo ======================================================================== >> output.txt
Echo. >> output.txt
FIND /i "Store passwords using reversible encryption" passwordpolicy.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================= >> output.txt
Echo 2.5.4. DEFAULT PASSWORD FOR AUTOMATIC LOGON SHOULD BE REMOVED >> output.txt 
Echo ============================================================= >> output.txt
Echo. >> output.txt
Echo The recommended state is that registry value shouldnot exist >> output.txt
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\DefaultPassword"   >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ===================================================================================================================================== >> output.txt
Echo 2.5.5. THE PASSWORD FOR THE RENAMED LOCAL Administrator ACCOUNT SHOULD BE CHANGED IN ACCORDANCE WITH CORPORATE STANDARD AND GUIDELINES  >> output.txt 
Echo ===================================================================================================================================== >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =================================================================== >> output.txt
Echo 2.5.6. USER'S PRIVATE KEY SHOULD REQUIRE PASSWORD BEFORE BEING USED  >> output.txt 
Echo =================================================================== >> output.txt
Echo. >> output.txt
Echo. "The recommended Value of following registry key should be set to 2" >> output.txt
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Policies\Microsoft\Cryptography\ForceKeyProtection"  >> output.txt
Find /i "Force strong key protection" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt


Echo =========================== >> output.txt
Echo 2.6. SYSTEM CONFIGURATION   >> output.txt
Echo =========================== >> output.txt
Echo. >> output.txt

Echo ===================================================================== >> output.txt
Echo 2.6.1	A LEGAL NOTICE AND WARNING SHOULD BE IMPLEMENTED ON THE SERVER.>> output.txt 
Echo ===================================================================== >> output.txt
Echo. >> output.txt 
FIND /i "Interactive Logon: Message title for users"  securityoptions.txt >> output.txt
Echo. >> output.txt
FIND /i "Interactive Logon: Message text for users" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =================================================================================== >> output.txt
Echo 2.6.2. ACCESS TO THE WINDOWS POWERSHELL SHOULD BE RESTRICTED TO PRIVILEGED ACCOUNTS >> output.txt
Echo =================================================================================== >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================================= >> output.txt
Echo 2.6.3. ANONYMOUS ACCESS TO NAMED PIPES AND SHARES SHOULD BE RESTRICTED >> output.txt 
Echo ======================================================================= >> output.txt
Echo. >> output.txt
FIND /i "Network access: Restrict anonymous access to Named Pipes and Shares"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================================== >> output.txt
Echo 2.6.4	BACKGROUND REFRESHING OF GROUP POLICY SETTINGS SHOULD BE ENABLED. >> output.txt 
Echo ======================================================================== >> output.txt
Echo. >> output.txt
FIND /i "Turn Off background refresh of Group Policy" admtemplates.txt >> output.txt 
Echo. >> output.txt

Echo ======================================================================================================= >> output.txt
Echo 2.6.5. CERTAIN REGISTRY KEYS SHOULD BE SECURED TO PREVENT UNAUTHORIZED ACCESS TO SERVERS CONFIGURATION  >> output.txt
Echo ======================================================================================================= >> output.txt
Echo. >> output.txt
accesschk -k  HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\PerfLib>> output.txt 
accesschk -k  HKLM\SOFTWARE\MICROSOFT\Rpc >> output.txt 
accesschk -k  HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\>> output.txt 
accesschk -k  HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\AeDebug>> output.txt 
accesschk -k HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\Compatibility32>> output.txt 
accesschk -k  HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\Drivers32>> output.txt 
accesschk -k  HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\Font Drivers>> output.txt 
accesschk -k HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\Fonts>> output.txt 
accesschk -k  HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\FontMapper>> output.txt 
accesschk -k HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\FontSubstitutes>> output.txt 
accesschk -k HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\GRE_Initialize>> output.txt 
accesschk -k HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\MCI32>> output.txt 
accesschk -k HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\MCIExtensions>> output.txt 
accesschk -k  HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\Ports >> output.txt 
accesschk -k HKLM\SOFTWARE\MICROSOFT\WindowsNT\CurrentVersion\ProfileList>> output.txt 
accesschk -k HKEY_USERS\.default>> output.txt 

Echo. >> output.txt


Echo ================================================================================================ >> output.txt
Echo 2.6.6 CLIENT CONNECTION SHOULD USE HIGH LEVEL OF ENCRYPTION WHEN CONNECTED VIA TERMINAL SERVICES  >> output.txt
Echo ================================================================================================ >> output.txt
find /i "client connection encryption level" admtemplates.txt >> output.txt
Echo. >> output.txt

Echo ===================================== >> output.txt
Echo 2.6.7. DISABLE AUTORUN FOR ALL DEVICES >> output.txt
Echo ====================================== >> output.txt
Echo. >> output.txt
Echo The recommended value of the following registry is 0xFF >> output.txt
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun"  >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================================== >> output.txt
Echo 2.6.8. DNS SERVICES SHOULD BE CONFIGURED TO PREVENT USERS FROM CHANGING DNS SETTINGS >> output.txt
Echo ==================================================================================== >> output.txt
Echo. >> output.txt
find /i "dns client" admtemplates.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================= >> output.txt
Echo 2.6.9. DOMAIN AUTHENTIFICATION REQUIRED TO UNLOCK SERVERS >> output.txt
Echo ========================================================= >> output.txt
Echo. >> output.txt
FIND /i "Interactive logon: Require Domain Controller authentication"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ====================================================== >> output.txt
Echo 2.6.10. DOWN-LEVEL AUTHENTICATION SHOULD BE RESTRICTED >> output.txt
Echo ====================================================== >> output.txt
Echo. >> output.txt
FIND /i "Microsoft network client: Send unencrypted password"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.6.11. ERROR REPORTING NOTIFICATION SHOULD BE DISPLAYED TO USERS >> output.txt
Echo ================================================================ >> output.txt
Echo. >> output.txt
find /i "Display Error Notification" admtemplates.txt>> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================================== >> output.txt
Echo 2.6.12. LDAP CLIENT SIGNATURES SHOULD BE ALLOWED IF NEGOTIATED WITH THE SERVER >> output.txt
Echo ============================================================================== >> output.txt
Echo. >> output.txt
FIND /i "Network security: LDAP client signing requirements"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================================== >> output.txt
Echo 2.6.13. MICROSOFT NETWORK SERVERS SHOULD DIGITALLY SIGN COMMUNICATIONS WITH CLIENT >> output.txt
Echo ==================================================================================== >> output.txt
Echo. >> output.txt
FIND /i "Microsoft network server: Digitally sign communications (if client agrees)"  securityoptions.txt >> output.txt
Echo. >> output.txt
FIND /i "Microsoft network server: Digitally sign communications (always)"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================== >> output.txt
Echo 2.6.14. NETWORK CONNECTION SETTINGS SHOULD BE CONFIGURED APPROPIATELY >> output.txt
Echo ===================================================================== >> output.txt
Echo. >> output.txt
FIND /i "Prohibit installation and configuration of Network Bridge" admtemplates.txt>> output.txt
FIND /i "Prohibit use of Internet Connection Sharing" admtemplates.txt>> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================================================== >> output.txt
Echo 2.6.15. NETWORK SERVICES THAT COMPROMISE THE SECURITY OF THE SERVER SHOULD NOT BE INSTALLED >> output.txt
Echo ===========================================================================================  >> output.txt
net start >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================= >> output.txt
Echo 2.6.16. NTFS SHOUD BE USED ON ALL PARTITION, THERE SHOULD BE NO UNFORMATTED SPACE ON DRIVE>> output.txt
Echo ========================================================================================= >> output.txt
psinfo -d >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================= >> output.txt
Echo 2.6.17. NULL SESSION PIPES SHOULD BE RESTRICTED   >> output.txt
Echo ========================================================================================= >> output.txt
FIND /i "Network access: Named pipes that can be accessed anonymously"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================= >> output.txt
Echo 2.6.18. NULL SESSION SID TO NAME TRANSLATION SHOULD BE RESTRICTED   >> output.txt
Echo ========================================================================================= >> output.txt
FIND /i "Network access: Allow anonymous SID/Name translation"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ===================================================================================================================================== >> output.txt
Echo 2.6.19. ONLY ADMINISTRATORS SHOULD HAVE THE ABILITY TO EJECT REMOVABLE MEDIA. INTERACTIVE USERS SHOULD NOT HAVE THIS ABILITY >> output.txt
Echo =====================================================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Allowed to format and eject removable media"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ==================================================================================================================================================================================================================================================== >> output.txt
Echo 2.6.20. ONLY CERTAIN SERVERS ON THE NETWORK SHOULD BE IDENTIFIABLE IN MY NETWORK PLACES. THIS INCLUDES FILE AND PRINT SERVERS AND CERTAIN APPLICATION SERVERS. SERVERS SUCH AS DOMAIN CONTROLLERS, WEB SERVERS, AND DATABASE SERVERS SHOULD BE HIDDEN >> output.txt
Echo =====================================================================================================================================================================================================================================================  >> output.txt
Echo. >> output.txt
net config server >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================================================================= >> output.txt
Echo 2.6.21. ONE INSTANCE OF WINDOWS 2008 SERVER SHOULD BE THE ONLY OPERATING SYSTEM ON THE PRODUCTION SERVER, NO DUAL BOOT PRODUCTION SERVER>> output.txt
Echo ========================================================================================================================================== >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================================================= >> output.txt
Echo 2.6.22.  ONLY THE USERS LOGGED ON LOCALLY SHOULD BE ABLE TO ACCESS DATA ON THE MEDIA IN THE CD-ROM DRIVE AND FLOPPY DRIVE >> output.txt
Echo =====================================================================================================================  >> output.txt
Echo. >> output.txt
Find /i "Devices: Restrict CD-ROM access to locally logged-on user only"	securityoptions.txt >> output.txt
Find /i "Restrict floppy access to locally logged-on user only" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ===================================================================================================================================== >> output.txt
Echo 2.6.23. OPTIONAL SUBSYSTEMS USED TO SUPPORT APPLICATIONS SHOULD NOT BE ENABLED >> output.txt
Echo =====================================================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Optional subsystems"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt



Echo =========================================================== >> output.txt
Echo 2.6.24. SECURE CHANNEL DATA SHOULD BE SET TO ALWAYS ENCRYPT >> output.txt
Echo ============================================================  >> output.txt
Echo. >> output.txt
FIND /i "Domain member: Digitally encrypt or sign secure channel data (always)"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================================== >> output.txt
Echo 2.6.25. SECURE CHANNEL TRAFFIC SHOULD BE ENCRYPTED OR SIGNED IF THE DOMAIN CONTROLLER IS CAPABLE >> output.txt
Echo ================================================================================================== >> output.txt
Echo. >> output.txt
Echo The recommended value of the following registry is 1  >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\SealSecureChannel"  >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\SignSecureChannel"  >> output.txt
Echo. >> output.txt
FIND /i "Digitally encrypt secure channel data"  securityoptions.txt >> output.txt
FIND /i "Digitally sign secure channel data"  securityoptions.txt >> output.txt 
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================== >> output.txt
Echo 2.6.26. SECURITY CONFIGURTION WIZARD >> output.txt
Echo ====================================  >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================================== >> output.txt
Echo 2.6.27. SERVERS SHOULD AUTOMATICALLY SUPPORT DYNAMIC UPDATES OF DNS INFORMATION WITH CORPORATE DNS SERVERS>> output.txt
Echo ========================================================================================================== >> output.txt
Echo. >> output.txt
Echo The recommended value of the following registry is 1  >> output.txt
Echo. >> output.txt
reg query "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient"  >> output.txt
find /I "Dynamic update" admtemplates.txt >> output.txt
Echo. >> output.txt

Echo ========================================================================================== >> output.txt
Echo 2.6.28. SERVICES RUNNING AS LOCALSYSTEM SHOULD NOT BE ALLOWED TO INTERACT WITH THE DESKTOP >> output.txt
Echo ==========================================================================================  >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================================================================== >> output.txt
Echo 2.6.29. SIMPLE TCP/IP SERVICES THAT ENABLE UNNECESSARY ENTICEMENT INFORMATION SERVICES TO RUN SHOULD BE REMOVED >> output.txt
Echo ==============================================================================================================  >> output.txt
Echo. >> output.txt
ECHO "The following registry values must be removed or set to  0" >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableTcpChargen"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableTcpDaytime"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableTcpDiscard"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableTcpEcho"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableTcpQotd"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpChargen "  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpDaytime"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpDiscard"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpEcho"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpQotd"  >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================================================================================================================================================= >> output.txt
Echo 2.6.30. SNMP SHOULD BE DISABLED IF IT IS NOT BEING USED FOR REMOTE MANAGEMENT. IF SNMP IS REQUIRED, SNMP SHOULD BE CONFIGURED SO THAT UNAUTHORIZED USERS ARE UNABLE TO QUERY THE SERVER >> output.txt
Echo =======================================================================================================================================================================================  >> output.txt
Echo. >> output.txt
find /i "snmp" admtemplates.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================================================================================================================================================= >> output.txt
Echo 2.6.31. SOFTWARE RESTRICTIONS SHOULD BE USED TO RESTRICT MALICIOUS CODE EXECUTION  >> output.txt
Echo =======================================================================================================================================================================================  >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================================================================================================================================================= >> output.txt
Echo 2.6.32. THE ABILITY TO AUTOMATICALLY DOWNLOAD AND INSTALL PATCHES VIA WINDOWS UPDATE SHOULD BE DISABLED  >> output.txt
Echo =======================================================================================================================================================================================  >> output.txt
Echo. >> output.txt
find /i "windows update" admtemplates.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================================================================== >> output.txt
Echo 2.6.33. ABILITY TO QUERY GROUP AND IDENTIFY RESULTANT SET OF POLICIES SHOULD BE RESTRICTED TO ADMINISTRATORS >> output.txt
Echo ===========================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Disallow Interactive Users from generating Resultant Set of Policy data" admtemplates.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================================================================================================================================================== >> output.txt
Echo 2.6.34. USER RIGHT SHOULD BE RESTRICTED TO ENSURE THE SERVER IS SECURE FROM NETWORK-BASED ATTACKS. ANY ADMINISTRATIVE GROUPS OR THOSE ACCESSING THE SERVER VIA SHARES WILL REQUIRE THIS RIGHT >> output.txt
Echo ===========================================================================================================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Access this Computer from the network" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================================================================================================================================================== >> output.txt
Echo 2.6.35. THE ACT AS PART OF THE OPERATING SYSTEM ADVANCED USER RIGHT SHOULD BE RESTRICTED SO THAT NO ONE CAN ACT AS THE “SYSTEM” >> output.txt
Echo ===========================================================================================================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Act as part of the operating system" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt



Echo =========================================================================================================================================================================================== >> output.txt
Echo 2.6.36. ALLOW LOG ON LOCALLY STANDARD USER RIGHT SHOULD BE RESTRICTED TO ALLOW >> output.txt
Echo ===========================================================================================================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Allow log on locally" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================================================================================================================================================== >> output.txt
Echo 2.6.37. THE ALLOW LOGON THROUGH TERMINAL SERVICES STANDARD USER RIGHT SHOULD BE RESTRICTED  >> output.txt
Echo ===========================================================================================================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Allow log on through Remote Desktop Services" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================================= >> output.txt
Echo 2.6.38. BACKUP FILES AND DIRECTORIES STANDARD USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo =============================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Back up files and directories" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =============================================================================================== >> output.txt
Echo 2.6.39. BYPASS TRAVERSE CHECKING ADVANCED USER RIGHT SHOUD BE ALLOWED TO AUTHENTICATED USER GROUP >> output.txt
Echo ===============================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Bypass traverse checking" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo =========================================================================== >> output.txt
Echo 2.6.40. THE CHANGE THE SYSTEM TIME STANDARD USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo ===========================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Change the system time"  userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ====================================================== >> output.txt
Echo 2.6.41. CREATE GLOBAL USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo ======================================================  >> output.txt
Echo. >> output.txt
FIND /i "Create global objects" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================================== >> output.txt
Echo 2.6.42. FORCE SHUTDOWN FROM A REMOTE SYSTEM USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo ===========================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Force shutdown from a remote system" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ===============================================================================================================  >> output.txt
Echo 2.6.43. THE LOG ON AS A SERVICE ADVANCED USER RIGHT SHOULD BE RESTRICTED SO THAT USERS CANNOT ACT AS A SERVICE >> output.txt
Echo ===============================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Log on as a Service" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================  >> output.txt
Echo 2.6.44. MODIFY FIRMWARE ADVANCED USER RIGHT SHOULD BE RESTRICTED  >> output.txt
Echo ================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Modify firmware environment values" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================== >> output.txt
Echo 2.6.45.	FIREWALL SETTINGS SHOULD BE APPROPRIATELY CONFIGURED >> output.txt 
Echo =========================================================== >> output.txt
Echo. >> output.txt
netsh advfirewall show domainprofile >>output.txt
Echo. >> output.txt
netsh advfirewall show privateprofile >>output.txt
Echo. >> output.txt
netsh advfirewall show publicprofile >>output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================================================ >> output.txt
Echo 2.6.46. NULL CREDENTIALS LOGON TO RETRIEVE INFORMATION FROM THE SYSTEM SHOULD BE RESTRICTED  >> output.txt
Echo ==============================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Network access: Do not allow anonymous enumeration of SAM accounts"	securityoptions.txt >> output.txt
Echo. >> output.txt
FIND /i "Network access: Do not allow anonymous enumeration of SAM accounts and shares"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ===================================================================== >> output.txt
Echo 2.6.47. RESTORE FILES AND DIRECTORIES USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo ====================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Restore files and directories"  userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ================================================================ >> output.txt
Echo 2.6.48. SHUTDOWN THE SYSTEM USER RIGHT SHOULD BE RESTRICTED      >> output.txt
Echo ==================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Shut down the system"  userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.6.49. TELNET SERVICE SHOULD BE REMOVED FROM THE SERVER     >> output.txt
Echo ================================================================  >> output.txt
Echo. >> output.txt
Echo THE KEYS SHOULD NOT EXIST >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\TlntSvr"  >> output.txt
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Microsoft\TelnetServer"  >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ======================================================= >> output.txt
Echo 2.6.50. UNNECESARRY NETWORK PROTOCOL SHOULD BE REMOVED  >> output.txt
Echo =====================================================   >> output.txt
Echo. >> output.txt
Echo Manual Check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================ >> output.txt
Echo 2.6.51. MESSAGING SETTINGS SHOULD BE APPROPRIATELY CONFIGURED>> output.txt 
Echo ============================================================ >> output.txt
Echo. >> output.txt
Echo Searching for Messaging settings in Security Options >> output.txt
FIND /i "MSS"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================== >> output.txt
Echo 2.6.52. USER SESSION THAT ARE INACTIVE FOR A SET AMOUNT OF TIME SHOULD BE DISABLED >> output.txt
Echo ================================================================================== >> output.txt
Echo. >> output.txt
FIND /i "Microsoft network server: Amount of idle time required before suspending session"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ================================ >> output.txt
Echo 2.7.  USER ACCOUNT MANAGEMENT >> output.txt
Echo ================================ >> output.txt
Echo ================================================================================== >> output.txt
Echo 2.7.1	ADMIN APPROVAL MODE SHOULD BE ENABLED FOR THE BUILT-IN ADMINISTRATOR ACCOUNT.>> output.txt
Echo =================================================================================== >> output.txt
find /i "Admin Approval Mode" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo ========================================================================================= >> output.txt
Echo 2.7.2 Allow UIAccess applications to prompt for elevation without using the secure desktop >> output.txt
Echo ========================================================================================= >> output.txt
find /i "elevate UIAccess" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo =============================================================== >> output.txt
Echo 2.7.3 Switch to the secure desktop when prompting for elevation>> output.txt
Echo =============================================================== >> output.txt
find /i "Switch to the secure desktop" securityoptions.txt >> output.txt
Echo. >> output.txt


Echo =============================================================== >> output.txt
Echo 2.7.4.	ACCOUNTS WITH BLANK PASSWORDS SHOULD NOT BE ACCESSIBLE VIA THE NETWORK.  >> output.txt 
Echo =============================================================== >> output.txt
find /i " Limit local account use of blank password" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo ======================================================================================== >> output.txt 
Echo 2.7.5.	ADVANCED USER RIGHTS SHOULD EITHER BE GRANTED TO NO ONE, OR TO ADMINISTRATORS ONLY>> output.txt
Echo ======================================================================================== >> output.txt
Echo. >> output.txt
copy output.txt + userrights.txt output.txt
Echo. >> output.txt

Echo ========================================================================================================================================== >> output.txt
Echo 2.7.6. ACCOUNT LOCKOUT FEATURE SHOULD BE ENABLED AND RELATED PARAMETERS SHOULD BE SET UP AS PER CORPORATE SECURITY STANDARDS AND GUIDELINES >> output.txt
Echo ========================================================================================================================================== >> output.txt
Echo. >> output.txt
copy output.txt + accountlockoutpolicy.txt output.txt
Echo. >> output.txt

Echo ============================================= >> output.txt
Echo 2.7.7. Default admin account should be Rename  >> output.txt 
Echo ============================================= >> output.txt
find /i "rename" securityoptions.txt >> output.txt
Echo. >> output.txt



Echo ================================================================================================= >> output.txt
Echo 2.7.8 Configure 'Routing and Remote Access' >> output.txt
Echo =================================================================================================  >> output.txt
Echo. >> output.txt
reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\RemoteAccess:Start >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================================= >> output.txt
Echo 2.7.9 Configure 'CNG Key Isolation' >> output.txt
Echo =================================================================================================  >> output.txt
Echo. >> output.txt
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\KeyIso:Start" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================================= >> output.txt
Echo 2.7.10 Enable TLS 1.2 and above protocol >> output.txt
Echo =================================================================================================  >> output.txt
Echo. >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols">> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS1.2\Server\Enabled">> output.txt
Echo TLS 1.2 is enabled if value of the key ENABLED is returned 1, disabled if 0 >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================================= >> output.txt
Echo 2.7.11 Ensure 'Debug programs' is set to 'Administrators' >> output.txt
Echo =================================================================================================  >> output.txt
Echo. >> output.txt
find /I "Debug programs" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================ >> output.txt
Echo 2.8.  Encryption >> output.txt
Echo ================================ >> output.txt

Echo ===================================== >> output.txt
Echo  2.8.1 Disable weak Encryption protocol >> output.txt
Echo ===================================== >> output.txt
Echo. >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\">> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL2\Server\Enabled">> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\SSL3\Server\Enabled">> output.txt
Echo Checking for TLS1.2 >> output.txt
REG QUERY "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols">> output.txt
REG QUERY "HKLM\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS1.2\Server\Enabled">> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================>> output.txt
Echo 2.8.2 Disable weak SMB Protcol >> output.txt
Echo ============================ >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\SMB1" >> output.txt
Echo SMB1 can be considered as disabled if output is 0 or output is blank as the key does not exist. >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ************************************************** End of Script *********************************************************** >> output.txt