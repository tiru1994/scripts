Echo ############################################################################################## 	>> output.txt
Echo       EY Windows Configuration Interrogation Script for State Bank of India			>> output.txt
Echo       Property of Ernst & Young LLP 					                 	>> output.txt
Echo       Copyright (c) 2013 SBI & Ernst & Young LLP				                >> output.txt
Echo ############################################################################################## 	>> output.txt
echo  Refreshed by Deloitte Touche Thomatsu India LLP                     			>> output.txt	
echo  Copyright (c) 2019 SBI & Deloitte Touche Thomatsu India LLP 							>> output.txt

Echo ############################################################################################## 	>> output.txt
Echo Executing the SBIWIN2008.bat file............								>> output.txt
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



FIND /i "Audit account logon events" policy.txt >> output.txt	
Echo. >> output.txt

FIND /i "Audit account management" policy.txt >> output.txt
Echo. >> output.txt

FIND /i  "Audit directory service access" policy.txt >> output.txt
Echo. >> output.txt

FIND /i "Audit logon events" policy.txt >>output.txt
Echo. >> output.txt

FIND /i "Audit object access" policy.txt >> output.txt
Echo. >> output.txt
	
FIND /i "Audit policy change" policy.txt >> output.txt
Echo. >> output.txt
	
FIND /i "Audit privilege use" policy.txt >> output.txt
Echo. >> output.txt
	
FIND /i "Audit process tracking" policy.txt >> output.txt
Echo. >> output.txt

FIND /i "Audit system events" policy.txt >> output.txt
Echo. >> output.txt	

Echo. >> output.txt
Echo. >> output.txt


Echo ======================>> output.txt
Echo 2.1.2. EVENT LOG SIZES >> output.txt
Echo ====================== >> output.txt

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

Echo ================================>> output.txt
Echo 2.1.3. PERMISSIONS ON EVENT LOGS >> output.txt
Echo ================================>> output.txt
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

rem Echo ================================================================== >> output.txt
rem Echo 2.1.4. AUDIT THE ACCESS OF GLOBAL SYSTEM OBJECTS SHOUD BE DISABLED>> output.txtrem 
rem Echo ================================================================== >> output.txt
rem Echo. >> output.txt
rem Echo "The recommended Value of following registry key should be set to 0" >> output.txt
rem Echo. >> output.txt


rem reg query "HKLM\System\CurrentControlSet\Control\Lsa\AuditBaseObjects" >>output.txt
rem Echo. >> output.txt

rem Echo. >> output.txt
rem Echo. >> output.txt


Echo ======================================================================================================= >> output.txt
Echo 2.1.4. AUDITING OF SENSITIVE SYSTEM ,APPLICATION FILES AND DIRECTORIES SHOULD BE ENABLED ON SERVERS.>> output.txt
Echo ======================================================================================================== >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\ >> output.txt
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
rem Echo 2.1.6. AUDITING OF SENSITIVE REGISTRY KEYS SHOULD BE ENABLED ON SERVERS>> output.txt
rem Echo ======================================================================= >> output.txt
rem Echo. >> output.txt

rem Echo The registry key access details are made available in the registry text file >> output.txt
rem Echo. >> output.txt

Echo ======================================================================= >> registry.txt
Echo 2.1.5. AUDITING OF SENSITIVE REGISTRY KEYS SHOULD BE ENABLED ON SERVERS>> registry.txt
Echo ======================================================================= >>registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SYSTEM"  >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\Software\Microsoft\Windows NT\Current Version\Perflib" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\Lsa">> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\KnownDLLs" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedPaths" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Shares" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SYSTEM\CurrentControlSet\Services\UPS" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKU\.DEFAULT" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\ValidCommunities" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SYSTEM\CurrentControlSet\Services\SNMP\Parameters\PermittedManagers" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SOFTWARE\Policies\SNMP\Parameters\ValidCommunities" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SOFTWARE\Policies\SNMP\Parameters\PermittedManagers" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnceEx" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SOFTWARE HKLM\SOFTWARE\MICROSOFT\RPC" >> registry.txt
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
accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Type 1 Installer" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\ProfileList" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\WOW" >> registry.txt
Echo. >> registry.txt
accesschk -k "HKCR" >> registry.txt
Echo. >> registry.txt
Echo. >> registry.txt
Echo. >> registry.txt

Echo ============================================================================================= >> output.txt
Echo 2.1.6. CONFIGURE 'MANAGE AUDITING AND SECURITY LOG'	>> output.txt
Echo ============================================================================================= >> output.txt
Echo. >> output.txt
FINDSTR /i /C:"Manage auditing and security log" userrights.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt


Echo ============================================================================================= >> output.txt
Echo 2.1.7. AUDITING SHOULD BE ENABLED FOR OBJECT ACCESS IF AN EVENT CORRELATION SYSTEM IS PRESENT>> output.txt
Echo ============================================================================================= >> output.txt
Echo. >> output.txt

FIND /i "Audit object access" policy.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt


Echo ===================================================================== >> output.txt
Echo 2.1.7. AUDITING SHOULD BE ENABLED FOR LOGON EVENT SUCCESS AND FAILURE>> output.txt
Echo =====================================================================>> output.txt
Echo. >> output.txt

FIND /i "Audit logon events" policy.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt
	

Echo ============================================================================  >> output.txt
Echo 2.1.8. AUDITING SHOULD BE ENABLED FOR ACCOUNT MANAGEMENT SUCCESS AND FAILURE>> output.txt
Echo ============================================================================ >> output.txt
Echo. >> output.txt

FIND /i "Audit account management" policy.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt
	
Echo ====================================== >> output.txt
Echo 2.2. FILE SYSTEM ACCESS AND MANAGEMENT >> output.txt
Echo ====================================== >> output.txt

Echo ================================================================== >> output.txt
Echo 2.2.1. SHARES THAT ARE ACCESSIBLE ANONYMOUSLY SHOULD BE RESTRICTED >> output.txt
Echo ================================================================== >> output.txt
Echo. >> output.txt
Echo  "The recommended Value of following registry key should be set to COMCFG,DFS$" >>output.txt
Echo. >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\NullSessionShares" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo =============================== >> output.txt
Echo 2.2.2. SYSTEM FOLDER PERMISSION      >> output.txt
Echo =============================== >> output.txt
Echo. >> output.txt

showacls.exe %systemroot%\system32 >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================= >> output.txt
Echo 2.2.3. DIRECTORIES THAT CONATAIN SENSITIVE WINDOWS SYSTEM FILES SHOULD BE SECURED>> output.txt
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

Echo ================================================================================>> output.txt
Echo 2.2.4 KEY EXECUTIBLE FILES SHOULD BE PROPERLY RESTRICTED FROM UNAUTHORISED USERS>> output.txt
Echo ================================================================================ >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\arp.exe" >> output.txt
Echo. >> output.txt

cacls "C:\Windows\system32\at.exe" >> output.txt
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

Echo ====================================================================================================================  >> output.txt
Echo 2.2.5.  KEYS SHOULD BE SECURED SO THAT UNAUTHORIZED USERS CANNOT MODIFY THE LIST OF PROGRAMS RUN ON START UP >> output.txt
Echo ==================================================================================================================== >> output.txt
Echo. >> output.txt
Echo The registry key access details are made available in the registry text file >> output.txt
Echo. >> output.txt


Echo ====================================================================================================================  >> registry.txt
Echo 2.2.5. REGISTRY KEYS SHOULD BE SECURED SO THAT UNAUTHORIZED USERS CANNOT MODIFY THE LIST OF PROGRAMS RUN ON START UP >> registry.txt
Echo ==================================================================================================================== >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" >> registry.txt
Echo. >> registry.txt
accesschk -k  "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" >> registry.txt
Echo. >> registry.txt

Echo. >> registry.txt
Echo. >> registry.txt

Echo ======================================================== >> output.txt
Echo 2.2.6. THE REGISTRY'S ALLOWED SUBPATHS SHOULD BE SECURED>> output.txt
Echo ======================================================== >> output.txt
Echo. >> output.txt
FIND/i "Network access: Remotely accessible registry paths" securityoptions.txt  >>output.txt
Echo. >> output.txt
FIND/i "Network access: Remotely accessible registry paths and sub-paths" securityoptions.txt  >>output.txt
Echo. >> output.txt  

Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================================= >> output.txt
Echo 2.2.7. UNAUTHORIZED USERS SHOULD NOT BE ALLOWED TO REMOTELY EDIT THE REGISTRY >> output.txt
Echo ============================================================================= >> output.txt
Echo. >> output.txt
Echo The registry key access details are made available in the registry text file >> output.txt
Echo. >> output.txt

Echo ============================================================================= >> registry.txt
Echo 2.2.7. UNAUTHORIZED USERS SHOULD NOT BE ALLOWED TO REMOTELY EDIT THE REGISTRY >> registry.txt
Echo ============================================================================= >> registry.txt
Echo. >> registry.txt

accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg" >>registry.txt
Echo. >> registry.txt 

Echo. >> registry.txt
Echo. >> registry.txt

Echo ============================================================================================ >> output.txt
Echo 2.2.8. UNAUTHORIZED USERS SHOULD NOT BE ALLOWED TO REMOTELY EDIT THE REGISTRY'S ALLOWED PATH >> output.txt
Echo ============================================================================================ >> output.txt
Echo. >> output.txt
Echo The registry key access details are made available in the registry text file >> output.txt
Echo. >> output.txt 

Echo ============================================================================================ >> registry.txt
Echo 2.2.8. UNAUTHORIZED USERS SHOULD NOT BE ALLOWED TO REMOTELY EDIT THE REGISTRY'S ALLOWED PATH >> registry.txt
Echo ============================================================================================ >> registry.txt
Echo. >> registry.txt
accesschk -k "HKLM\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg\AllowedPaths" >>registry.txt
Echo. >> registry.txt 

Echo. >> registry.txt
Echo. >> registry.txt

Echo ===================== >> output.txt
Echo 2.3. GROUP MANAGEMENT >> output.txt
Echo ===================== >> output.txt
Echo. >> output.txt

Echo ======================================== >> output.txt
Echo 2.3.1 BACKGROUND REFRESH OF GROUP POLICY >> output.txt
Echo ======================================== >> output.txt
Echo. >> output.txt
FIND /i "Turn off background refresh of Group Policy" ATGrouppolicy.txt >> output.txt
Echo. >> output.txt


Echo ================================= >> output.txt
Echo 2.3.2. REGISTRY POLICY PROCESSING  >> output.txt
Echo ================================= >> output.txt
Echo. >> output.txt
FIND /i "Registry policy processing" ATGrouppolicy.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ====================================================================================================== >> output.txt
Echo 2.3.3. THE BUILT IN LOCAL GROUPS SHOULD ONLY CONTAIN GLOBAL GROUPS THAT ARE AUTHORIZED FOR EACH PURPOSE >> output.txt
Echo ======================================================================================================= >> output.txt
Echo. >> output.txt
dumpsec /rpt=Groupscol /saveas=fixed /outfile=users.txt
copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================================== >> output.txt
Echo 2.3.4. NULL CREDENTIAL LOGON SHOULD NOT BE INCLUDED AS A MEMBER OF THE EVERYONE GROUP >> output.txt
Echo ==================================================================================== >> output.txt
Echo. >> output.txt
Echo  "The recommended Value of following registry key should be set to 0">> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\everyoneincludesanonymous" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ===================================================================================================== >> output.txt
Echo 2.3.5. RESTRICTED GROUP FEATURE SHOULD BE UTILIZED TO CONTROL ACCESS TO CRITICAL GROUPS ON THE SERVER >> output.txt
Echo ===================================================================================================== >> output.txt
Echo. >> output.txt
Echo Manual Check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================ >> output.txt
Echo 2.3.6. TELNET CLIENT GROUP SHOULD NOT BE CREATED >> output.txt
Echo ================================================ >> output.txt
Echo. >> output.txt
dumpsec /rpt=Groupscol /saveas=fixed /outfile=users.txt
copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ======================== >> output.txt
Echo 2.4.NETWORK CONFIGURATION >> output.txt
Echo ======================== >> output.txt
Echo. >> output.txt

Echo ================================= >> output.txt
Echo 2.4.1. REMOTE ASSISTANCE SETTINGS >> output.txt
Echo =================================>> output.txt
Echo. >> output.txt
Echo Manual Check >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ========================================== >> output.txt
Echo 2.4.2. TERMINAL SERVER SETTINGS >> output.txt
Echo ========================================== >> output.txt
Echo. >> output.txt
Echo Manual Check >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt
E
Echo ================================================== >> output.txt
Echo 2.4.3. DENIAL OF ACCESS TO THE SYSTEM FROM NETWORK >> output.txt
Echo ================================================== >> output.txt
Echo. >> output.txt

FIND /i "Access this computer from the network" userrights.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt



Echo ========================================================== >> output.txt
Echo 2.4.4. MINIMUM SESSION SECURITY FOR NTLM SSP BASED SERVERS >> output.txt
Echo ========================================================== >> output.txt
Echo. >> output.txt
Echo "The recommended Value of following registry key should be set to 0X20000000" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\MSV1_0\NTLMMinServerSec" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================================== >> output.txt
Echo 2.4.5. MICROSOFT NETWORK SERVER: DIGITALLY SIGN COMMUNICATIONS(Always) >> output.txt
Echo ============================================================== >> output.txt
Echo. >> output.txt
Echo "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters\RequireSecuritySignature" >> output.txt
Echo. >> output.txt  
reg query "HKLM\System\CurrentControlSet\Services\lanmanserver\Parameters\RequireSecuritySignature" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================== >> output.txt
Echo 2.4.6. DONOT ALLOW ANONYMOUS ENUMERATION OF SAM ACCOUNT AND SHARES>> output.txt
Echo ================================================================== >> output.txt
Echo. >> output.txt
Echo "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Control\Lsa\RestrictAnonymous" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.4.7. DONOT STORE LANMANAGER HASH VALUE ON NEXT PASSWORD CHANGE>> output.txt
Echo ================================================================ >> output.txt
Echo. >> output.txt
Echo  "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt
reg query "HKLM\System\CurrentControlSet\Control\Lsa\NoLMHash" >> output.txt
Echo. >> output.txt

Echo ======================================= >> output.txt
Echo 2.4.8. LAN MANAGER AUTHENTICATION LEVEL>> output.txt
Echo ======================================= >> output.txt
Echo. >> output.txt
Echo "For the Enterprise Member Server and Enterprise Domain Controller profile The recommended Value of following registry key should be set to 3.For the SSLF Member Server and SSLF Domain Controller profile The recommended Value of following registry key should be set to 5"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Control\Lsa\LmCompatibilityLevel" >> output.txt
Echo. >> output.txt

Echo ============================================= >> output.txt
Echo 2.4.9. SET CLIENT CONNECTION ENCRYPTION LEVEL >> output.txt
Echo ============================================= >> output.txt
Echo. >> output.txt
Echo "The recommended Value of following registry key should be set to 3" >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp\MinEncryptionLevel" >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ===================================== >> output.txt
Echo 2.4.10. DONOT ALLOW DRIVE REDIRECTION>> output.txt
Echo ===================================== >> output.txt		
Echo. >> output.txt
Echo For the Enterprise Member Server and Enterprise Domain Controller profile(s) The recommended value is Not Configured >> output.txt
Echo. >> output.txt
Echo For the SSLF Member Server and SSLF Domain Controller profile(s) The recommended value of following registry key should be set to 1 >> output.txt
Echo. >> output.txt

reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\fDisableCdm"
Echo. >> output.txt
Echo. >> output.txt

Echo ======================== >> output.txt
Echo 2.5. PASSWORD Management  >> output.txt
Echo ======================== >> output.txt
Echo. >> output.txt

Echo ======================== >> output.txt
Echo 2.5.1. PASSWORD POLICY  >> output.txt
Echo ======================== >> output.txt
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

Echo ========================================================================================== >> output.txt
Echo 2.5.2. DEFAULT PASSWORDS SUPPLIED WITH SOFTWARE PACKAGES SHOULD BE CHANGED ON INSTALLATION >> output.txt
Echo ========================================================================================== >> output.txt
Echo. >> output.txt
ECHO "Manual Check" >> output.txt
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
Echo 2.5.5. THE PASSWORD FOR THE RENAMED LOCAL ADMINISTRATOR ACCOUNT SHOULD BE CHANGED IN ACCORDANCE WITH CORPORATE STANDARD AND GUIDELINES  >> output.txt
Echo ===================================================================================================================================== >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =================================================================== >> output.txt
Echo 2.5.6. USER'S PRIVATE KEY SHOULD REQUIRE PASSWORD BEFORE BEING USED  >> output.txt
Echo =================================================================== >> output.txt
Echo. >> output.txt
Echo. "The recommended value of following registry key should be set to 2" >> output.txt
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Policies\Microsoft\Cryptography\ForceKeyProtection"  >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo =================================================================== >> output.txt
Echo 2.5.7. ENSURE 'ACCOUNTS: LIMIT LOCAL ACCOUNT USE OF BLANK PASSWORDS TO CONSOLE LOGON ONLY' IS SET TO 'ENABLED'  >> output.txt
Echo =================================================================== >> output.txt
Echo. >> output.txt
Echo. "The recommended value of following registry key should be set to Enabled" >> output.txt
Echo. >> output.txt
rem reg query " Computer Configuration\Policies\Windows Settings\Security Settings\Local Policies\Security Options\Accounts: Limit local account use of blank passwords to console logon only"  >> output.txt
FINDSTR /i /C:"Accounts: Limit local account use of blank passwords to console logon only" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt


Echo =========================== >> output.txt
Echo 2.6. SYSTEM CONFIGURATION   >> output.txt
Echo =========================== >> output.txt
Echo. >> output.txt

Echo ===============================>> output.txt
Echo 2.6.1. LATEST SECURITY PATCHES>> output.txt
Echo =============================== >> output.txt
Echo. >> output.txt
Echo Look into security patches text file for the latest patches >> output.txt
wmic qfe list  >> securitypatches.txt
Echo. >> securitypatches.txt

Echo. >> output.txt
Echo. >> output.txt



Echo ======================= >> output.txt
Echo 2.6.2. SECURITY OPTIONS >> output.txt
Echo ======================= >> output.txt
Echo. >> output.txt
copy output.txt + securityoptions.txt output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ===================================== >> output.txt
Echo 2.6.3. FILE SYSTEM OF DISK PARTITION   >> output.txt
Echo =====================================  >> output.txt
psinfo -d >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==============================>> output.txt
Echo 2.6.4. NON ESSENTIAL SERVICES    >> output.txt
Echo =============================  >> output.txt
net start >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo =========================>> output.txt
Echo 2.6.5. ANTIVIRUS SOFTWARE    >> output.txt
Echo =========================  >> output.txt
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

ECHO Services >> output.txt
Echo. >> output.txt

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

Echo. >> output.txt
Echo. >> output.txt


Echo ==============================>> output.txt
Echo 2.6.6. WINDOWS ERROR REPORTING    >> output.txt
Echo =============================  >> output.txt
Echo. "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt
reg query "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Disabled"  >> output.txt
Echo. >> output.txt 
reg query "HKCU\Software\Microsoft\Windows\Windows Error Reporting\Disabled"  >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ======================>> output.txt
Echo 2.6.7. CRASH DETECTION   >> output.txt
Echo ====================== >> output.txt
Echo Manual Check >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ================================ >> output.txt
Echo 2.6.8. PROXY SETTING PER MACHINE   >> output.txt
Echo ================================  >> output.txt
Echo Manual Check  >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt
Echo ================================ >> output.txt
Echo 2.6.9 WINDOWS MESSENGER SETTINGS  >> output.txt
Echo ================================ >> output.txt
Echo. >> output.txt
Echo. "The recommended Value of following registry key should be set to 1" >> output.txt
Echo. >> output.txt
reg query "HKLM\Software\Policies\Microsoft\Messenger\Client\{9b017612-c9f1-11d2-8d9f-0000f875c541}"  >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt


Echo ================================>> output.txt
Echo 2.6.10. NTP CLIENT CONFIGURATION  >> output.txt
Echo ================================>> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\Currentcontrolset\Services\W32time\Parameters\Ntpserver"  >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ===================================== >> output.txt
Echo 2.6.11. FIREWALL SHOULD BE CONFIGURED >> output.txt
Echo ====================================== >> output.txt
Echo. >> output.txt
netsh advfirewall show domainprofile >>output.txt
Echo. >> output.txt
netsh advfirewall show privateprofile >>output.txt
Echo. >> output.txt
netsh advfirewall show publicprofile >>output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ===================================================== >> output.txt
Echo 2.6.12. LEGAL NOTICE AND WARNING SHOULD BE IMPLEMENTED >> output.txt
Echo ====================================================== >> output.txt
Echo. >> output.txt 
FIND /i "Interactive Logon: Message title for users"  securityoptions.txt >> output.txt
Echo. >> output.txt
FIND /i "Interactive Logon: Message text for users" securityoptions.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt
Echo ====================================================================== >> output.txt
Echo 2.6.13. ANONYMOUS ACCESS TO NAMED PIPES AND SHARE SHOULD BE RESTRICTED >> output.txt
Echo ====================================================================== >> output.txt
Echo. >> output.txt
FIND /i "Network access: Restrict anonymous access to Named Pipes and Shares"  securityoptions.txt >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt


Echo ======================================================================================================= >> output.txt
Echo 2.6.14. CERTAIN REGISTRY KEYS SHOULD BE SECURED TO PREVENT UNAUTHORIZED ACCESS TO SERVERS CONFIGURATION  >> output.txt
Echo ======================================================================================================= >> output.txt
Echo. >> output.txt
Echo The registry key access details are made available in the registry text file >> output.txt
Echo. >> output.txt

Echo ======================================================================================================= >> registry.txt
Echo 2.6.14. CERTAIN REGISTRY KEYS SHOULD BE SECURED TO PREVENT UNAUTHORIZED ACCESS TO SERVERS CONFIGURATION  >> registry.txt
Echo ======================================================================================================= >> registry.txt
Echo. >> registry.txt

accesschk -k  HKCR   >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\PerfLib  >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Rpc >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\AeDebug >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Compatibility32 >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Drivers32 >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Font Drivers >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Fonts >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\FontMapper >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\FontSubstitutes >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\GRE_Initialize >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\MCI32 >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\MCI Extensions >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\Ports >> registry.txt
Echo. >> registry.txt
accesschk -k HKLM\SOFTWARE\MICROSOFT\Windows NT\CurrentVersion\ProfileList >> registry.txt
Echo. >> registry.txt
accesschk -k HKU\.default >> registry.txt
Echo. >> registry.txt
Echo. >> registry.txt
Echo. >> registry.txt

Echo ================================================================================================ >> output.txt
Echo 2.6.15. CLIENT CONNECTION SHOULD USE HIGH LEVEL OF ENCRYPTION WHEN CONNECTED VIA TERMINAL SERVICES  >> output.txt
Echo ================================================================================================ >> output.txt
Echo. Manual check   >> output.txt

Echo ===================================== >> output.txt
Echo 2.6.16. DISABLE AUTORUN FOR ALL DEVICES >> output.txt
Echo ====================================== >> output.txt
Echo. >> output.txt
Echo The recommended value of the following registry is 0xFF >> output.txt
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\NoDriveTypeAutoRun"  >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo =========================================================== >> output.txt
Echo 2.6.17. DOMAIN AUTHENTIFICATION REQUIRED TO UNLOCK SERVERS >> output.txt
Echo ============================================================ >> output.txt
Echo. >> output.txt
FIND /i "Interactive logon: Require Domain Controller authentication to unlock workstation"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo =========================================================== >> output.txt
Echo 2.6.18. ERROR REPORTING NOTIFICATION SHOULD BE DISPLAYED TO USERS >> output.txt
Echo ============================================================ >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================================== >> output.txt
Echo 2.6.19. MICROSOFT NETWORK SERVERS SHOULD DIGITALLY SIGN COMMUNICATIONS WITH CLIENT >> output.txt
Echo ==================================================================================== >> output.txt
Echo. >> output.txt
FIND /i "Microsoft network server: Digitally sign communications (if client agrees)"  securityoptions.txt >> output.txt
Echo. >> output.txt
FIND /i "Microsoft network server: Digitally sign communications (always)"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================== >> output.txt
Echo 2.6.20. NETWORK CONNECTION SETTINGS SHOULD BE CONFIGURED APPROPIATELY >> output.txt
Echo ===================================================================== >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================= >> output.txt
Echo 2.6.21. NTFS SHOUD BE USED ON ALL PARTITION, THERE SHOULD BE NO UNFORMATTED SPACE ON DRIVE>> output.txt
Echo ========================================================================================= >> output.txt
psinfo -d >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ========================================================================================================================================= >> output.txt
Echo 2.6.22. ONE INSTANCE OF WINDOWS 2008 SERVER SHOULD BE THE ONLY OPERATING SYSTEM ON THE PRODUCTION SERVER, NO DUAL BOOT PRODUCTION SERVER>> output.txt
Echo ========================================================================================================================================== >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ===================================================================================================================================== >> output.txt
Echo 2.6.23.  ONLY ADMINISTRATORS SHOULD BE ABLE TO REDEFINE CERTAIN BASE SYSTEM WIDE ATTRIBUTES SUCH AS COM-PORTS , SERIAL PORTS  PRINTERS >> output.txt
Echo =====================================================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ===================================================================================================================== >> output.txt
Echo 2.6.24.  ONLY USERS LOGGED ON LOCALLY SHOULD BE ABLE TO ACCESS DATA ON THE MEDIA IN THE CD-ROM DRIVE AND FLOPPY DRIVE >> output.txt
Echo =====================================================================================================================  >> output.txt
Echo. >> output.txt
Echo "The recomended value of the following registry key is 1" >> output.txt 
Echo. >> output.txt
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateFloppies" >> output.txt
Echo. >> output.txt
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AllocateCDRoms" >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt



Echo ========================================================================================================================= >> output.txt
Echo 2.6.25. REMOTE ASSISTANCE FUNCTIONALITY SHOULD BE DISABLED ON SERVERS. ACCESS TO SERVERS SHOULD BE REMOTE DESKTOP SESSION >> output.txt
Echo ==========================================================================================================================  >> output.txt
Echo. >> output.txt
Echo  Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================== >> output.txt
Echo 2.6.26. SECURE CHANNEL DATA SHOULD BE SET TO ALWAYS ENCRYPT >> output.txt
Echo ============================================================  >> output.txt
Echo. >> output.txt
FIND /i "Domain member: Digitally encrypt or sign secure channel data (always)"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ================================================================================================== >> output.txt
Echo 2.6.27. SECURE CHANNEL TRAFFIC SHOULD BE ENCRYPTED OR SIGNED IF THE DOMAIN CONTROLLER IS CAPABLE >> output.txt
Echo ================================================================================================== >> output.txt
Echo. >> output.txt
Echo The recommended value of the following registry is 1 " >> output.txt

reg query "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\SealSecureChannel"  >> output.txt
Echo. >> output.txt
reg query "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\SignSecureChannel"  >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================== >> output.txt
Echo 2.6.28. SECURITY CONFIGURTION WIZARD >> output.txt
Echo ====================================  >> output.txt
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

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpChargen"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpDaytime"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpDiscard"  >> output.txt
Echo. >> output.txt

reg query "HKLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpEcho"  >> output.txt
Echo. >> output.txt

reg query "KLM\System\CurrentControlSet\Services\SimpTcp\Parameters\EnableUdpQotd"  >> output.txt
Echo. >> output.txt

Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================= >> output.txt
Echo 2.6.30. SOFTWARE RESTRICTIONS SHOULD BE USED TO RESTRICT MALICIOUS CODE EXECUTIONS >> output.txt
Echo =================================================================================  >> output.txt
Echo. >> output.txt
Echo Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo =========================================================================================================== >> output.txt
Echo 2.6.31. ABILITY TO QUERY GROUP AND IDENTIFY RESULTANT SET OF POLICIES SHOULD BE RESTRICTED TO ADMINISTRATORS >> output.txt
Echo ===========================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Disallow Interactive Users from generating Resultant Set of Policy data" ATGrouppolicy.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================================= >> output.txt
Echo 2.6.32. USER RIGHTS SHOULD BE RESTRICTED TO ENSURE THE SERVER IS SECURED FROM NETWORK BASED ATTACKS >> output.txt
Echo =================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Access this computer from the network" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ================================================================================= >> output.txt
Echo 2.6.33. ALLOW LOGON THROUGH TERMINAL SERVICES STANDARD USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo =================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Allow log on through Terminal Services" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ================================================================================= >> output.txt
Echo 2.6.34. BACKUP FILES AND DIRECTORIES STANDARD USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo =================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Back up files and directories" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt



Echo =============================================================================================== >> output.txt
Echo 2.6.35. BYPASS TRAVERSE CHECKING ADVANCED USER RIGHT SHOUD BE ALLOWED TO AUTHENTICATED USER GROUP >> output.txt
Echo ===============================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Bypass traverse checking" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt




Echo ======================================================================= >> output.txt
Echo 2.6.36. CHANGE THE SYSTEM TIME STANDARD USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo =======================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Change the system time"  userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ====================================================== >> output.txt
Echo 2.6.37. CREATE GLOBAL OBJECT USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo ======================================================  >> output.txt
Echo. >> output.txt
FIND /i "Create global objects" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt



Echo ================================================================================================================================================= >> output.txt
Echo 2.6.38. DENY LOG ON THROUGH TERMINAL SERVICES USER RIGHT SHOULD BE USED SO THAT SPECIFIC USERS OF A GROUP CANNOT LOGON VIA TERMINAL SERVICES SESSION>> output.txt
Echo =================================================================================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Deny log on through Terminal Services" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt



Echo =========================================================================== >> output.txt
Echo 2.6.39. FORCE SHUTDOWN FROM A REMOTE SYSTEM USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo ===========================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Force shutdown from a remote system" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.6.40. MODIFY FIRMWARE ADVANCED USER RIGHT SHOULD BE RESTRICTED  >> output.txt
Echo ==================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Modify firmware environment values" userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt


Echo ============================================================================================ >> output.txt
Echo 2.6.41. NULL CREDENTIALS LOGON TO RETRIEVE INFORMATION FROM THE SYSTEM SHOULD BE RESTRICTED  >> output.txt
Echo ==============================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Network access: Do not allow anonymous enumeration of SAM accounts"	securityoptions.txt >> output.txt
Echo. >> output.txt
FIND /i "Network access: Do not allow anonymous enumeration of SAM accounts and shares security"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.6.42. RESTORE FILES AND DIRECTORIES USER RIGHT SHOULD BE RESTRICTED >> output.txt
Echo ==================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Restore files and directories"  userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.6.43. SHUTDOWN THE SYSTEM USER RIGHT SHOULD BE RESTRICTED      >> output.txt
Echo ==================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Shut down the system"  userrights.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.6.44. TELNET SERVICE SHOULD BE REMOVED FROM THE SERVER     >> output.txt
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

Echo ================================================================ >> output.txt
Echo 2.6.45. UNNECESARRY NETWORK PROTOCOL SHOULD BE REMOVED    >> output.txt
Echo ================================================================  >> output.txt
Echo. >> output.txt
Echo Manual Check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ==================================================================================== >> output.txt
Echo 2.6.46. USER SESSION THAT ARE INACTIVE FOR A SET AMOUNT OF TIME SHOULD BE DISABLED       >> output.txt
Echo ====================================================================================  >> output.txt
Echo. >> output.txt
FIND /i "Microsoft network server: Amount of idle time required before suspending session"  securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================================================ >> output.txt
Echo 2.6.47. MESSAGING SETTINGS SHOULD BE APPROPRIATELY CONFIGURED    >> output.txt
Echo ================================================================  >> output.txt
Echo. >> output.txt
Echo Manual Check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ================================ >> output.txt
Echo 2.7.  USER ACCOUNT CONFIGURATION>> output.txt
Echo ================================ >> output.txt

Echo ================================= >> output.txt
Echo 2.7.1.RENAME ADMINITRATOR   >> output.txt
Echo 2.7.3.GUEST ACCOUNT STATUS  >> output.txt
Echo 2.7.4.PASSWORD REQUIREMENT  >> output.txt
Echo 2.7.5.PASSWORD EXPIRATION   >> output.txt
Echo ================================= >> output.txt
dumpsec /rpt=users /saveas=fixed /outfile=users.txt
copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ============================================== >> output.txt
Echo 2.7.2 RESTRICTED ADMINITRATOR GROUP MEMBERSHIP >> output.txt
Echo ============================================== >> output.txt
dumpsec /rpt=users /saveas=fixed /outfile=users.txt
copy output.txt + users.txt output.txt
del users.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
Echo. >> output.txt
dumpsec /rpt=Groupscol /saveas=fixed /outfile=Groupscol.txt
copy output.txt + Groupscol.txt output.txt
del Groupscol.txt
Echo @VAEND:WIN:DUMPSEC1@ >> output.txt
Echo. >> output.txt


Echo ======================== >> output.txt
Echo 2.7.6 DORMANT ACCOUNTS  >> output.txt
Echo ======================= >> output.txt
Echo. >> output.txt
Echo. Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ======================== >> output.txt
Echo 2.7.7 USER RIGHTS POLICY >> output.txt
Echo ======================= >> output.txt
Echo. >> output.txt
copy  output.txt + userrights.txt output.txt 
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================================================================== >> output.txt
Echo 2.7.8 ACCOUNT LOCKOUT FEATURE SHOULD BE ENABLED AND RELATED PARAMETERS SHOULD BE SET UP AS PER CORPORATE SECURITY STANDARDS AND GUIDELINES >> output.txt
Echo =========================================================================================================================================== >> output.txt
Echo. >> output.txt
Echo. Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================================================================== >> output.txt
Echo 2.7.9 Set 'Allow unencrypted traffic' to 'Disabled' >> output.txt
Echo =========================================================================================================================================== >> output.txt
Echo. >> output.txt
reg query HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service\AllowUnencryptedTraffic >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================================================================== >> output.txt
Echo 2.7.10 Set 'Disallow WinRM from storing RunAs credentials' to 'Enabled' >> output.txt
Echo =========================================================================================================================================== >> output.txt
reg query HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\WinRM\Service\DisableRunAs>> output.txt
Echo. Manual check >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt

Echo ========================================================================================================================================== >> output.txt
Echo 2.7.11 Configure 'Accounts: Rename guest account' >> output.txt
Echo =========================================================================================================================================== >> output.txt
FINDSTR /i /C:"Accounts: Rename guest account" securityoptions.txt >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo. >> output.txt
Echo ====================================== >> output.txt
Echo  2.7.12 Enable TLS 1.2 and above protocol >> output.txt
Echo ====================================== >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols">> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols\TLS1.2\Server\Enabled">> output.txt
Echo TLS 1.2 is enabled if value of the key ENABLED is returned 1, disabled if 0 >> output.txt
Echo. >> output.txt
Echo ============================>> output.txt
Echo 2.7.13 Disable weak SMB Protcol >> output.txt
Echo ============================ >> output.txt
REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\SMB1" >> output.txt
Echo SMB1 can be considered as disabled if output is 0 or output is blank as the key does not exist. >> output.txt

Echo ************************************************** End of Script *********************************************************** >> output.txt