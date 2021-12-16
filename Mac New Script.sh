#!/bin/bash

Echo " ##############################################################################################"  >> output.txt
Echo "      Deloitte Touche Tohmatsu LLP MAC OS Configuration Interrogation Script                   "  >> output.txt
Echo "      Property of Deloitte Touche Tohmatsu LLP                                                 "  >> output.txt
Echo "      Copyright  2021 Deloitte Touche Tohmatsu LLP                                             "   >> output.txt
Echo " ##############################################################################################"   >> output.txt

Echo >> output.txt
Echo >> output.txt

Echo ##############################################################################################     >> output.txt
Echo Executing the script............                                                           >> output.txt
Echo >> output.txt 

Echo >> output.txt
Echo >> output.txt

Echo ======================================================================= >> output.txt
Echo                            System INFORMATION                           >> output.txt
Echo ======================================================================= >> output.txt

Echo >> output.txt
Echo >> output.txt

echo The NtUser of the System >> output.txt
Echo ---------------------- >> output.txt

echo "ntUser"
echo "`(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')`" >> output.txt
Echo >> output.txt

Echo "Today's Date" >> output.txt
Echo ------------  >> output.txt
echo "`(python -c 'import datetime; print datetime.datetime.now()')`" >> output.txt
Echo >> output.txt

Echo ================================================================== >> output.txt
Echo 1 Verify all Apple provided software is current >> output.txt
Echo ================================================================== >> output.txt
Echo >> output.txt
echo "01) countAvailableSUS"
echo  "`softwareupdate -l`" >> output.txt

Echo >> output.txt


Echo ================================================================== >> output.txt
Echo 2 Enable Auto Update >> output.txt
Echo ================================================================== >> output.txt
Echo >> output.txt
echo "02) CP_automaticUpdates"
echo "`(defaults read /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled)`" >> output.txt

Echo >> output.txt

Echo ================================================================== >> output.txt
Echo 3 Enable app update installs >> output.txt
Echo ================================================================== >> output.txt
Echo >> output.txt
echo "03) automaticAppUpdates"
echo "`(defaults read /Library/Preferences/com.apple.SoftwareUpdate | egrep '(ConfigDataInstall|CriticalUpdateInstall)')`" >> output.txt

Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 4 Enable system data files and security update installs >> output.txt
Echo ================================================================== >> output.txt
Echo >> output.txt
echo "04) automaticsystemUpdates"
echo "`(defaults read /Library/Preferences/com.apple.SoftwareUpdate | egrep '(ConfigDataInstall|CriticalUpdateInstall)')`" >> output.txt

Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 5 Enable macOS update installs >> output.txt
Echo ================================================================== >> output.txt
Echo >> output.txt
echo "05) automaticmacosUpdates"
echo  "`(defaults read /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired)`" >> output.txt

Echo >> output.txt


Echo ================================================================== >> output.txt
Echo 6 Enable Firewall >> output.txt
Echo ================================================================== >> output.txt
Echo "06) firewall"
echo "`(defaults read /Library/Preferences/com.apple.alf globalstate)`" >> output.txt
Echo >> output.txt


Echo ================================================================== >> output.txt
Echo 7 Enable FileVault >> output.txt
Echo ================================================================== >> output.txt
Echo "07) filevault"
echo "`(fdesetup status)`" >> output.txt
Echo >> output.txt

Echo ================================================================== >> output.txt
Echo 8 Enable Firewall Stealth Mode >> output.txt
Echo ================================================================== >> output.txt
Echo "08) firewall stealth mode "
echo "`(/usr/libexec/ApplicationFirewall/socketfilterfw --getstealthmode)`" >> output.txt
Echo >> output.txt


Echo ================================================================== >> output.txt
Echo 9 iCloud configuration >> output.txt
Echo ================================================================== >> output.txt
Echo "09) iCloud CONFIG"
echo "`(defaults read ~/Library/Preferences/MobileMeAccounts.plist)`" >> output.txt
Echo >> output.txt


Echo ================================================================== >> output.txt
Echo 10 Time Machine Auto-Backup >> output.txt
Echo ================================================================== >> output.txt
Echo "10) TimeMachine"
echo "`(defaults read /Library/Preferences/com.apple.TimeMachine.plist AutoBackup)`" >> output.txt
Echo >> output.txt


Echo ================================================================== >> output.txt
Echo 11 Enable security auditing >> output.txt
Echo ================================================================== >> output.txt
Echo "11) secaudit"
echo "`(sudo launchctl list | grep -i auditd)`" >> output.txt
Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 12 Time Machine Volumes Are Encrypted >> output.txt
Echo ================================================================== >> output.txt
Echo >> output.txt
echo "12) volumeencrypt"
echo "`(tmutil destinationinfo | grep -i NAME)`" >> output.txt
echo "`(diskutil info TMbackup | grep -i Encrypted)`" >> output.txt
Echo >> output.txt

Echo ================================================================== >> output.txt
Echo 13 Configure Security Auditing Flags >> output.txt
Echo ================================================================== >> output.txt
Echo "13) auditflags"
echo "`(sudo egrep "^flags:" /etc/security/audit_control)`" >> output.txt
Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 14 Control access to audit records >> output.txt
Echo ================================================================== >> output.txt
Echo "14) auditrecord"
echo "`(ls -le /etc/security/audit_control ls -le /var/audit/)`" >> output.txt
Echo >> output.txt


cho ================================================================== >> output.txt
Echo 15 Ensure Firewall is configured to log >> output.txt
Echo ================================================================== >> output.txt
Echo "15) firewallog"
echo "`(/usr/libexec/ApplicationFirewall/socketfilterfw --getloggingmode)`" >> output.txt
Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 16 Ensure http server is not running >> output.txt
Echo ================================================================== >> output.txt
Echo  >> output.txt
echo "16) httpserver"
echo "`ps -ef | grep -i httpd`" >> output.txt

Echo ================================================================== >> output.txt
Echo 17 Ensure nfs server is not running  >> output.txt
Echo ================================================================== >> output.txt
Echo "17) nfsserver"
 echo "`(ps -ef | grep -i nfsd)`" >> output.txt
Echo >> output.txt

Echo ================================================================== >> output.txt
Echo 18 Secure Home Folders  >> output.txt
Echo ================================================================== >> output.txt
Echo "18) homefolder"
echo  "`(ls -l /Users/)`" >> output.txt
Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 19 Check System folder for world writable files  >> output.txt
Echo ================================================================== >> output.txt
Echo "19) systemfolder"
echo  "`(sudo find /System -type d -perm -2 -ls | grep -v "Public/Drop Box")`" >> output.txt
Echo >> output.txt


Echo ================================================================== >> output.txt
Echo 20 Configure account lockout threshold >> output.txt
Echo ================================================================== >> output.txt
Echo "20) threshold"
echo "`(pwpolicy -getaccountpolicies | grep -A 1 'policyAttributeMaximumFailedAuthentications' | tail -1 | cut -d'>' -f2 | cut -d '<' -f1)`" >> output.txt
Echo >> output.txt

Echo ================================================================== >> output.txt
Echo 21 Set a minimum password length >> output.txt
Echo ================================================================== >> output.txt
Echo "21) minlength"
echo "`(pwpolicy -getaccountpolicies | egrep "15 characters")`" >> output.txt
Echo >> output.txt




Echo ================================================================== >> output.txt
Echo 22 Complex passwords must contain an Alphabetic Character >> output.txt
Echo ================================================================== >> output.txt
Echo "22) compsw"
echo "`(pwpolicy -getaccountpolicies | egrep Alpha)`" output.txt
Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 23 Complex passwords must contain a Numeric Character >> output.txt
Echo ================================================================== >> output.txt
Echo "23) compnum"
echo  "`(pwpolicy -getaccountpolicies | egrep Numeric)`" >> output.txt
echo "`(pwpolicy -getaccountpolicies | egrep "1 number")`" >> output.txt
Echo >> output.txt

Echo ================================================================== >> output.txt
Echo 24 Complex passwords must uppercase and lowercase letters >> output.txt
Echo ================================================================== >> output.txt
Echo "24) upperlower"
echo "`(pwpolicy -getaccountpolicies | egrep com.apple.uppercaseAndLowercase)`" >> output.txt
Echo >> output.txt




Echo ================================================================== >> output.txt
Echo 25 Complex passwords must contain a Special Character >> output.txt
Echo ================================================================== >> output.txt
Echo "25) specialchar"
echo "`(pwpolicy -getaccountpolicies | egrep "1 special")`"  >> output.txt
Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 26 Password Age >> output.txt
Echo ================================================================== >> output.txt
Echo "26) pswage"
echo "`(pwpolicy -getaccountpolicies | egrep policyAttributeExpiresEveryNDays)`" >> output.txt
Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 27 Password History >> output.txt
Echo ================================================================== >> output.txt
Echo "27) pswhistory"
echo "`(pwpolicy -getaccountpolicies | egrep "differ from past")`" >> output.txt
Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 28 Reduce the sudo timeout period >> output.txt
Echo ================================================================== >> output.txt
Echo "28) timeoutperiod"
echo "`(sudo cat /etc/sudoers | grep timestamp)`" >> output.txt
Echo >> output.txt




Echo ================================================================== >> output.txt
Echo 29 Disable automatic login >> output.txt
Echo ================================================================== >> output.txt
Echo "29) disautologin"
echo "`(defaults read /Library/Preferences/com.apple.loginwindow | grep autoLoginUser)`" >> output.txt
Echo >> output.txt



Echo ================================================================== >> output.txt
Echo 30 Require an administrator password to access system-wide preferences >> output.txt
Echo ================================================================== >> output.txt
Echo "30) adminpsw"
echo  "`(security authorizationdb read system.preferences 2> /dev/null | grep -A1 shared | grep -E '(true|false)')`" >> output.txt
Echo >> output.txt




echo "************************************ End of Script ***********************************************************"

echo "************************************ End of Script ***********************************************************" >> output.txt



