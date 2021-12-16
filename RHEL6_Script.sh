## Type - Configuration Audit Script
## Application Name - RHEL6
## Company - Refreshed by Deloitte Touche Tohmatsu India LLP
exec >> `hostname`_Compliance.txt
echo "Audit script for Linux is running. Kindly wait for the script to terminate."  >>`hostname`_Compliance.txt
echo "LIN6_00 - System Information" >>`hostname`_Compliance.txt
echo "LIN6_00_STARTS" >>`hostname`_Compliance.txt
hostname >>`hostname`_Compliance.txt
ifconfig >>`hostname`_Compliance.txt
echo "LIN6_00_ENDS" >>`hostname`_Compliance.txt
echo				 >>`hostname`_Compliance.txt
echo "LIN6_01 - Set nodev option" >>`hostname`_Compliance.txt
echo "LIN6_01_STARTS" >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then do manual check-------------">>`hostname`_Compliance.txt
echo "LIN6_01  /temp" >>`hostname`_Compliance.txt
cat  /etc/fstab | grep /tmp | grep -v "#" >>`hostname`_Compliance.txt
echo "mount /tmp" >>`hostname`_Compliance.txt
mount | grep /tmp | grep nodev >>`hostname`_Compliance.txt
echo "LIN6_01  /home" >>`hostname`_Compliance.txt
cat  /etc/fstab | grep /home | grep -v "#" >>`hostname`_Compliance.txt
echo "mount /home" >>`hostname`_Compliance.txt
mount | grep /home | grep nodev >>`hostname`_Compliance.txt
echo "LIN6_01  /shm" >>`hostname`_Compliance.txt
cat  /etc/fstab | grep /dev/shm | grep -v "#" >>`hostname`_Compliance.txt
echo "mount /shm" >>`hostname`_Compliance.txt
mount | grep /dev/shm | grep nodev >>`hostname`_Compliance.txt
echo "LIN6_01  /cdrom"
cat  /etc/fstab | grep /cdrom | grep -v "#" >>`hostname`_Compliance.txt
echo "mount /cdrom" >>`hostname`_Compliance.txt
mount | grep /cdrom | grep nodev >>`hostname`_Compliance.txt
echo "LIN6_01  /floppy"
cat  /etc/fstab | grep /floppy | grep -v "#" >>`hostname`_Compliance.txt
echo "mount /floppy" >>`hostname`_Compliance.txt
mount | grep /floppy | grep nodev >>`hostname`_Compliance.txt
echo "LIN6_01_ENDS" >>`hostname`_Compliance.txt
echo		    >>`hostname`_Compliance.txt

echo "LIN6_02 - set noexec option" >>`hostname`_Compliance.txt
echo "LIN6_02_STARTS"              >>`hostname`_Compliance.txt
echo "LIN6_02  /tmp"               >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then do manual check-------------">>`hostname`_Compliance.txt
cat  /etc/fstab | grep /tmp | grep -v "#" >>`hostname`_Compliance.txt
echo "mount  /tmp" >>`hostname`_Compliance.txt
mount | grep /tmp | grep noexec >>`hostname`_Compliance.txt
echo "LIN6_02  /shm" >>`hostname`_Compliance.txt
cat  /etc/fstab | grep /dev/shm | grep -v "#" >>`hostname`_Compliance.txt
echo "mount  /shm" >>`hostname`_Compliance.txt
mount | grep /dev/shm | grep noexec >>`hostname`_Compliance.txt
echo "LIN6_02  /cdrom" >>`hostname`_Compliance.txt
cat  /etc/fstab | grep /cdrom | grep -v "#" >>`hostname`_Compliance.txt
echo "mount  /cdrom" >>`hostname`_Compliance.txt
mount | grep /cdrom | grep noexec >>`hostname`_Compliance.txt
echo "LIN6_02  /floppy" >>`hostname`_Compliance.txt
cat  /etc/fstab | grep /floppy | grep -v "#" >>`hostname`_Compliance.txt
echo "mount  /floppy" >>`hostname`_Compliance.txt
mount | grep /floppy | grep noexec >>`hostname`_Compliance.txt
echo "LIN6_02_ENDS" >>`hostname`_Compliance.txt
echo                >>`hostname`_Compliance.txt

echo "LIN6_03 - set nosuid option" >>`hostname`_Compliance.txt
echo "LIN6_03_STARTS" >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then do manual check-------------">>`hostname`_Compliance.txt
echo " " >>`hostname`_Compliance.txt
echo "LIN6_03 /cdrom" >>`hostname`_Compliance.txt
cat  /etc/fstab | grep /cdrom | grep -v "#" >>`hostname`_Compliance.txt
echo "mount  /cdrom" >>`hostname`_Compliance.txt
mount | grep /cdrom | grep nosuid >>`hostname`_Compliance.txt
echo "LIN6_03 /floppy" >>`hostname`_Compliance.txt
cat  /etc/fstab | grep /floppy | grep -v "#" >>`hostname`_Compliance.txt
echo "mount  /floppy" >>`hostname`_Compliance.txt
mount | grep /floppy | grep nosuid >>`hostname`_Compliance.txt
echo "LIN6_03_ENDS" >>`hostname`_Compliance.txt
echo		    >>`hostname`_Compliance.txt

echo "LIN6_04 - Bind Mount the /var/tmp directory to /tmp" >>`hostname`_Compliance.txt
echo "LIN6_04_STARTS" >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then do manual check-------------">>`hostname`_Compliance.txt
echo "LIN6_04 /tmp"   >>`hostname`_Compliance.txt
cat /etc/fstab | grep -e "^/tmp" | grep /var/tmp >>`hostname`_Compliance.txt
echo "mount /tmp" >>`hostname`_Compliance.txt
mount | grep -e "^/tmp" | grep /var/tmp >>`hostname`_Compliance.txt
echo "LIN6_04_ENDS" >>`hostname`_Compliance.txt
echo		    >>`hostname`_Compliance.txt

echo "LIN6_05 - Sticky bit on temporary folders" >>`hostname`_Compliance.txt
echo "LIN6_05_STARTS"				 >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then do manual check-------------">>`hostname`_Compliance.txt
echo "Sticky bit on /tmp"			 >>`hostname`_Compliance.txt
ls -l / | grep 'tmp'				 >>`hostname`_Compliance.txt
echo "Sticky bit on /var/tmp"			 >>`hostname`_Compliance.txt
ls -ld  '/var/tmp'				 >>`hostname`_Compliance.txt
echo "LIN6_05_ENDS"				 >>`hostname`_Compliance.txt
echo						 >>`hostname`_Compliance.txt

echo "LIN6_06 - Check for Duplicate UIDs and GIDs" >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then control will be Safe-----------------" >>`hostname`_Compliance.txt
echo "LIN6_06_STARTS"				   >>`hostname`_Compliance.txt
cat /etc/group | cut -d: -f3 | sort | uniq -d	 >>`hostname`_Compliance.txt
echo "LIN6_06_ENDS"				 >>`hostname`_Compliance.txt
echo						 >>`hostname`_Compliance.txt

echo "LIN6_07 - Check That Reserved UIDs Are Assigned to System Accounts" >>`hostname`_Compliance.txt
echo "LIN6_07_STARTS"							  >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then do manual check-------------">>`hostname`_Compliance.txt
cat /etc/passwd | grep -v "#"	  >>`hostname`_Compliance.txt
echo "LIN6_07_ENDS"							  >>`hostname`_Compliance.txt
echo									  >>`hostname`_Compliance.txt
echo "Patches, Os Releases and SELinux"					 >>`hostname`_Compliance.txt
echo "LIN6_08_STARTS"							 >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then control will be safe-------------">>`hostname`_Compliance.txt
echo "LIN6_08 - Os Releases"						 >>`hostname`_Compliance.txt
cat /etc/redhat-release							 >>`hostname`_Compliance.txt
uname -r								 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo "LIN6_08 - Latest Security Patches are Installed"			 >>`hostname`_Compliance.txt
echo "RED-HAT Product Version"					 >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then do manual check-------------">>`hostname`_Compliance.txt
cat /etc/redhat-release							 >>`hostname`_Compliance.txt
echo "Kernel release"						 >>`hostname`_Compliance.txt
uname -a								 >>`hostname`_Compliance.txt
echo "List Of Installed patches"					 >>`hostname`_Compliance.txt
yum list installed 								 >>`hostname`_Compliance.txt
echo "LIN6_08_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo "LIN6_09 - GPG Settings"						 >>`hostname`_Compliance.txt
echo "LIN6_09_STARTS"							 >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then control will be unsafe-------------">>`hostname`_Compliance.txt
echo "GPG Key Installer"						 >>`hostname`_Compliance.txt
rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey				 >>`hostname`_Compliance.txt
echo "GPG globally activated"						 >>`hostname`_Compliance.txt
cat /etc/yum.conf | grep gpgcheck | grep -v "#"				 >>`hostname`_Compliance.txt
echo "LIN6_09_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo									 >>`hostname`_Compliance.txt
echo "LIN6_10 - Check for Unconfined Daemons"				 >>`hostname`_Compliance.txt
echo "LIN6_10_STARTS"							 >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then manual check-------------">>`hostname`_Compliance.txt
ps -eZ | grep "#" >>`hostname`_Compliance.txt
echo "LIN6_10_ENDS"                                                      >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo									 >>`hostname`_Compliance.txt
echo "System Access and Authentication"					 >>`hostname`_Compliance.txt
echo "LIN6_11 - Ensure Password Fields are Not Empty"			 >>`hostname`_Compliance.txt
echo "LIN6_11_STARTS"							 >>`hostname`_Compliance.txt
echo "-------------If 2nd field of /etc/shadow directory is blank for any active users then check is unsafe ----------------"  >>`hostname`_LIN07.txt
cat /etc/shadow  >>`hostname`_Compliance.txt
echo "LIN6_11_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo "LIN6_12 - Set Warning Banner for Standard Login Services"		 >>`hostname`_Compliance.txt
echo "LIN6_12_STARTS"							 >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then check is unsafe ----------------"  >>`hostname`_LIN07.txt
echo "Permission on /etc/motd"						 >>`hostname`_Compliance.txt
/bin/ls -l /etc/motd							 >>`hostname`_Compliance.txt
echo "Permission on /etc/issue"						 >>`hostname`_Compliance.txt
/bin/ls -l /etc/issue							 >>`hostname`_Compliance.txt
echo "Permission on /etc/issue.net"					 >>`hostname`_Compliance.txt
/bin/ls -l /etc/issue.net						 >>`hostname`_Compliance.txt
echo "Contents of /etc/motd"						 >>`hostname`_Compliance.txt
cat /etc/motd								 >>`hostname`_Compliance.txt
echo "Contents of /etc/issue"						 >>`hostname`_Compliance.txt
cat /etc/issue								 >>`hostname`_Compliance.txt
echo "Contents of /etc/issue.net"					 >>`hostname`_Compliance.txt
cat /etc/issue.net							 >>`hostname`_Compliance.txt
echo "LIN6_12_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo "LIN6_13 - Enable strong password policy"				 >>`hostname`_Compliance.txt
echo "LIN6_13_STARTS"							 >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then check is unsafe ----------------"  >>`hostname`_LIN07.txt
echo "Password Maximum Days"						 >>`hostname`_Compliance.txt
cat /etc/login.defs | grep PASS_MAX_DAYS | grep -v "#"			 >>`hostname`_Compliance.txt
echo "Password Minimum Days"						 >>`hostname`_Compliance.txt
cat /etc/login.defs | grep PASS_MIN_DAYS | grep -v "#"			 >>`hostname`_Compliance.txt
echo "Password Warnage Age"						 >>`hostname`_Compliance.txt
cat /etc/login.defs | grep PASS_WARN_AGE | grep -v "#"			 >>`hostname`_Compliance.txt
echo "Password Minimum length"						 >>`hostname`_Compliance.txt
cat /etc/login.defs | grep PASS_MIN_LEN | grep -v "#"			 >>`hostname`_Compliance.txt
echo "LIN6_13_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo									 >>`hostname`_Compliance.txt
echo "LIN6_14 - Require Authentication for Single-User Mode"		 >>`hostname`_Compliance.txt
echo "LIN6_14_STARTS"							 >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then check is unsafe ----------------"  >>`hostname`_LIN07.txt
cat /etc/sysconfig/init | grep SINGLE | grep -v "#"			 >>`hostname`_Compliance.txt
echo "Check PROMPT in /etc/sysconfig/init"				 >>`hostname`_Compliance.txt
echo "LIN6_14_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo "LIN6_15 - Set User/Group Owner and Permission"			 >>`hostname`_Compliance.txt
echo "LIN6_15_STARTS"							 >>`hostname`_Compliance.txt
echo "-------------If the control output is empty then check is unsafe ----------------"  >>`hostname`_LIN07.txt
echo "User Group Owner and Permission on /etc/ directory"		 >>`hostname`_Compliance.txt
ls -ld /etc/ >>`hostname`_Compliance.txt
echo " " >>`hostname`_Compliance.txt
echo "LIN6_15_ENDS"							 >>`hostname`_Compliance.txt
echo			 >>`hostname`_Compliance.txt

echo "LIN6_16 - Restrict at Daemon and at/cron to Authorized Users"	 >>`hostname`_Compliance.txt
echo "LIN6_16	CRON ALLOW"						 >>`hostname`_Compliance.txt
cat /etc/cron.allow						 >>`hostname`_Compliance.txt
echo "PERMISSION ON CRON ALLOW"						 >>`hostname`_Compliance.txt
ls -l /etc/cron.allow							 >>`hostname`_Compliance.txt
echo "CRON DENY"						 >>`hostname`_Compliance.txt
cat /etc/cron.deny 						 >>`hostname`_Compliance.txt
echo "PERMISSION ON CRON DENY"						 >>`hostname`_Compliance.txt
ls -l /etc/cron.deny							 >>`hostname`_Compliance.txt
echo "AT ALLOW"						 >>`hostname`_Compliance.txt
cat /etc/at.allow 						 >>`hostname`_Compliance.txt
echo "PERMISSION ON AT ALLOW"						 >>`hostname`_Compliance.txt
ls -l /etc/at.allow							 >>`hostname`_Compliance.txt
echo "AT DENY"						 >>`hostname`_Compliance.txt
cat /etc/at.deny 						 >>`hostname`_Compliance.txt
echo "PERMISSION ON AT DENY"						 >>`hostname`_Compliance.txt
ls -l /etc/at.deny							 >>`hostname`_Compliance.txt
echo "LIN6_16_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo "LIN6_17 - Upgrade Password Hashing Algorithm to SHA-512"		 >>`hostname`_Compliance.txt
echo "LIN6_17_STARTS"							 >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
authconfig --test | grep hashing | grep sha512				 >>`hostname`_Compliance.txt
echo " "	>>`hostname`_Compliance.txt
echo "LIN6_17_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo "LIN6_18 - Limit Password Reuse"					 >>`hostname`_Compliance.txt
echo "LIN6_18_STARTS"							 >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
grep "remember" /etc/pam.d/system-auth					 >>`hostname`_Compliance.txt
echo "LIN6_18_ENDS"							 >>`hostname`_Compliance.txt
echo 											>>`hostname`_Compliance.txt

echo "LIN6_19 - Restrict Access to the su Command"			 >>`hostname`_Compliance.txt
echo "LIN6_19_STARTS"							 >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
echo "Contents in /etc/pam.d/su"					 >>`hostname`_Compliance.txt
grep pam_wheel.so /etc/pam.d/su						 >>`hostname`_Compliance.txt
echo "User List in /etc/group"						 >>`hostname`_Compliance.txt
grep wheel /etc/group							 >>`hostname`_Compliance.txt
echo "LIN6_19_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo "LIN6_20 - Password Creation Requirement Parameters Using pam_cracklib" >>`hostname`_Compliance.txt
echo "LIN6_20_STARTS_STARTS"							     >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
grep pam_cracklib.so /etc/pam.d/system-auth				     >>`hostname`_Compliance.txt
echo "LIN6_20_ENDS"							     >>`hostname`_Compliance.txt
echo									      >>`hostname`_Compliance.txt
echo "LIN6_21 - Lockout for Failed Password Attempts"			      >>`hostname`_Compliance.txt
echo "LIN6_21_STARTS"							      >>`hostname`_Compliance.txt
echo "If the control output is empty then SCD note for further information"			              >>`hostname`_Compliance.txt
grep "pam_faillock" /etc/pam.d/password-auth				      >>`hostname`_Compliance.txt
echo "pam_unix.so in password-auth file"				      >>`hostname`_Compliance.txt
grep "pam_unix.so" /etc/pam.d/password-auth | grep success		      >>`hostname`_Compliance.txt
echo "pam_faillock in system-auth file"					      >>`hostname`_Compliance.txt
grep "pam_faillock" /etc/pam.d/system-auth				      >>`hostname`_Compliance.txt
echo "pam_unix.so in system-auth file"					      >>`hostname`_Compliance.txt
grep "pam_unix.so" /etc/pam.d/system-auth | grep success		      >>`hostname`_Compliance.txt
echo "LIN6_21_ENDS"							      >>`hostname`_Compliance.txt
echo									      >>`hostname`_Compliance.txt

echo "LIN6_22 - Set SSH Parameters"					      >>`hostname`_Compliance.txt
echo "LIN6_22_STARTS"							      >>`hostname`_Compliance.txt
echo "SSH Protocol"							      >>`hostname`_Compliance.txt
grep "^Protocol" /etc/ssh/sshd_config					      >>`hostname`_Compliance.txt
echo "LogLevel"							              >>`hostname`_Compliance.txt
grep "^LogLevel" /etc/ssh/sshd_config					      >>`hostname`_Compliance.txt
echo "Permission on /etc/ssh/sshd_config"				      >>`hostname`_Compliance.txt
/bin/ls -l /etc/ssh/sshd_config						      >>`hostname`_Compliance.txt
echo "SSH X11Forwarding"						      >>`hostname`_Compliance.txt
grep "^X11Forwarding" /etc/ssh/sshd_config				      >>`hostname`_Compliance.txt
echo "SSH MaxAuthTries" >>`hostname`_Compliance.txt
grep "^MaxAuthTries" /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "SSH IgnoreRhosts"                     >>`hostname`_Compliance.txt
grep "^IgnoreRhosts" /etc/ssh/sshd_config   >>`hostname`_Compliance.txt
echo "SSH HostbasedAuthentication"          >>`hostname`_Compliance.txt
grep "^HostbasedAuthentication" /etc/ssh/sshd_config   >>`hostname`_Compliance.txt
echo "SSH PermitEmptyPasswords"   >>`hostname`_Compliance.txt
grep "^PermitEmptyPasswords" /etc/ssh/sshd_config  >>`hostname`_Compliance.txt
echo "Environment Options"   >>`hostname`_Compliance.txt
grep PermitUserEnvironment /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "Idle Timeout Interval for User Login" >>`hostname`_Compliance.txt
grep "^ClientAliveInterval" /etc/ssh/sshd_config  >>`hostname`_Compliance.txt
grep "^ClientAliveCountMax" /etc/ssh/sshd_config  >>`hostname`_Compliance.txt
echo "SSH Banner"  >>`hostname`_Compliance.txt
grep "^Banner" /etc/ssh/sshd_config  >>`hostname`_Compliance.txt
echo "LIN6_22_ENDS"   >>`hostname`_Compliance.txt
echo                >>`hostname`_Compliance.txt

echo "LIN6_23 - Configure /etc/rsyslog.conf"  >>`hostname`_Compliance.txt
echo "LIN6_23_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
echo "Contents of rsyslog.conf file"  >>`hostname`_Compliance.txt
cat /etc/rsyslog.conf  >>`hostname`_Compliance.txt
echo "Checking for log files"  >>`hostname`_Compliance.txt
ls -l /var/log/  >>`hostname`_Compliance.txt
echo "LIN6_23_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt

echo "LIN6_24 - Configure rsyslog to Send Logs to a Remote Log Host"  >>`hostname`_Compliance.txt
echo "LIN6_24_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
grep "^*.*[^I][^I]*@" /etc/rsyslog.conf  >>`hostname`_Compliance.txt
echo "LIN6_24_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt

echo "LIN6_25 - Accept Remote rsyslog Messages Only on Designated Log Hosts"  >>`hostname`_Compliance.txt
echo "LIN6_25_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
echo "ModLoad imtcp.so value"  >>`hostname`_Compliance.txt
grep "$ModLoad imtcp.so" /etc/rsyslog.conf  >>`hostname`_Compliance.txt
echo "InputTCPServerRun value"  >>`hostname`_Compliance.txt
grep "$InputTCPServerRun" /etc/rsyslog.conf  >>`hostname`_Compliance.txt
echo "LIN6_25_ENDS" >>`hostname`_Compliance.txt
echo >>`hostname`_Compliance.txt

echo "LIN6_26 - Configure logrotate"  >>`hostname`_Compliance.txt
echo "LIN6_26_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
cat /etc/logrotate.d/syslog | grep -v "#"  >>`hostname`_Compliance.txt
echo "LIN6_26_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt

echo "LIN6_27 - Disable System Accounts"  >>`hostname`_Compliance.txt
echo "LIN6_27_STARTS"  >>`hostname`_Compliance.txt
echo " If the default system active users are found then control will be unsafe " >>`hostname`_Compliance.txt
cat /etc/passwd  >>`hostname`_Compliance.txt
echo "LIN6_27_ENDS"  >>`hostname`_Compliance.txt
echo   >>`hostname`_Compliance.txt

echo "LIN6_28 - Set Default Group for root Account"  >>`hostname`_Compliance.txt
echo "LIN6_28_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then control will be safe " >>`hostname`_Compliance.txt
grep root /etc/passwd | cut -d: -f 1,4  >>`hostname`_Compliance.txt
echo "LIN6_28_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt

echo "LIN6_29 - Lock Inactive User Accounts"  >>`hostname`_Compliance.txt
echo "LIN6_29_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output 7th field is empty or more than 35 then control will be unsafe " >>`hostname`_Compliance.txt
cat /etc/shadow >>`hostname`_Compliance.txt
echo "LIN6_29_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt

echo "LIN6_30 - Configure Audit Log"  >>`hostname`_Compliance.txt
echo "LIN6_30_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
echo "Audit Log Storage Size"  >>`hostname`_Compliance.txt
grep max_log_file /etc/audit/auditd.conf  >>`hostname`_Compliance.txt
echo "System on Audit Log Full - space_left_action"  >>`hostname`_Compliance.txt
grep space_left_action /etc/audit/auditd.conf  >>`hostname`_Compliance.txt
echo "System on Audit Log Full - action_mail_acct"  >>`hostname`_Compliance.txt
grep action_mail_acct /etc/audit/auditd.conf  >>`hostname`_Compliance.txt
echo "System on Audit Log Full - admin_space_left_action"  >>`hostname`_Compliance.txt
grep admin_space_left_action /etc/audit/auditd.conf  >>`hostname`_Compliance.txt
echo "Keep All Auditing Information"  >>`hostname`_Compliance.txt
grep max_log_file_action /etc/audit/auditd.conf  >>`hostname`_Compliance.txt
echo "LIN6_30_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt

echo "LIN6_31 - Enable Auditing for Processes That Start Prior to auditd"  >>`hostname`_Compliance.txt
echo "LIN6_31_STARTS"  >>`hostname`_Compliance.txt
grep "kernel" /etc/grub.conf  >>`hostname`_Compliance.txt
echo "LIN6_31_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt

echo "LIN6_32 - Collect Login and Logout Events"  >>`hostname`_Compliance.txt >>`hostname`_Compliance.txt
echo "LIN6_32_STARTS"  >>`hostname`_Compliance.txt
grep logins /etc/audit/audit.rules  >>`hostname`_Compliance.txt
echo "LIN6_32_ENDS"  >>`hostname`_Compliance.txt
echo >>`hostname`_Compliance.txt

echo "LIN6_33 - Collect Session Initiation Information"  >>`hostname`_Compliance.txt
echo "LIN6_33_STARTS"  >>`hostname`_Compliance.txt
grep session /etc/audit/audit.rules  >>`hostname`_Compliance.txt
echo "LIN6_33_ENDS"  >>`hostname`_Compliance.txt
echo >>`hostname`_Compliance.txt


echo "LIN6_34 - Make the Audit Configuration Immutable"  >>`hostname`_Compliance.txt
echo "LIN6_34_STARTS"  >>`hostname`_Compliance.txt
grep "^-e 2" /etc/audit/audit.rules  >>`hostname`_Compliance.txt
echo "LIN6_34_ENDS"  >>`hostname`_Compliance.txt
echo >>`hostname`_Compliance.txt


echo "LIN6_35 - TCP Wrappers"  >>`hostname`_Compliance.txt
echo "LIN6_35_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
echo "file hosts.allow"  >>`hostname`_Compliance.txt
echo "If the control output is empty then check manually" >>`hostname`_Compliance.txt
cat /etc/hosts.allow  >>`hostname`_Compliance.txt
echo "permission on hosts.allow"  >>`hostname`_Compliance.txt
/bin/ls -l /etc/hosts.allow  >>`hostname`_Compliance.txt
echo "file hosts.deny"  >>`hostname`_Compliance.txt
grep "ALL: ALL" /etc/hosts.deny  >>`hostname`_Compliance.txt
echo "permission on hosts.deny"  >>`hostname`_Compliance.txt
/bin/ls -l /etc/hosts.deny  >>`hostname`_Compliance.txt
echo "LIN6_35_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_36 - Non-Essential Services"  >>`hostname`_Compliance.txt
echo "LIN6_36_STARTS"  >>`hostname`_Compliance.txt
echo "Services to Remove"  >>`hostname`_Compliance.txt
yum list  >>`hostname`_Compliance.txt
echo "Services to Disable"  >>`hostname`_Compliance.txt
chkconfig --list  >>`hostname`_Compliance.txt
echo "LIN6_36_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_37 - Modify Network Parameters"  >>`hostname`_Compliance.txt
echo "LIN6_37_STARTS"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.ip_forward  >>`hostname`_Compliance.txt
echo "conf.all.send_redirects"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.all.send_redirects  >>`hostname`_Compliance.txt
echo "conf.default.send_redirects"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.default.send_redirects  >>`hostname`_Compliance.txt
echo "conf.all.accept_source_route"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.all.accept_source_route  >>`hostname`_Compliance.txt
echo "conf.default.accept_source_route"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.default.accept_source_route  >>`hostname`_Compliance.txt
echo "conf.all.accept_redirects"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.all.accept_redirects  >>`hostname`_Compliance.txt
echo "conf.default.accept_redirects"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.default.accept_redirects  >>`hostname`_Compliance.txt
echo "conf.all.secure_redirects"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.all.secure_redirects  >>`hostname`_Compliance.txt
echo "conf.default.secure_redirects"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.default.secure_redirects  >>`hostname`_Compliance.txt
echo "conf.all.log_martians"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.all.log_martians  >>`hostname`_Compliance.txt
echo "conf.default.log_martians"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.default.log_martians  >>`hostname`_Compliance.txt
echo "icmp_echo_ignore_broadcasts"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.icmp_echo_ignore_broadcasts  >>`hostname`_Compliance.txt
echo "icmp_ignore_bogus_error_responses"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.icmp_ignore_bogus_error_responses  >>`hostname`_Compliance.txt
echo "conf.all.rp_filter"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.all.rp_filter  >>`hostname`_Compliance.txt
echo "conf.default.rp_filter"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.conf.default.rp_filter  >>`hostname`_Compliance.txt
echo "tcp_syncookies"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.tcp_syncookies  >>`hostname`_Compliance.txt
echo "tcp_max_syn_backlog"  >>`hostname`_Compliance.txt
/sbin/sysctl net.ipv4.tcp_max_syn_backlog  >>`hostname`_Compliance.txt
echo "LIN6_37_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_38 - Find SUID and GUID System Executables"  >>`hostname`_Compliance.txt
echo "LIN6_38_STARTS"  >>`hostname`_Compliance.txt
echo "SUID & GUID System Executables"  >>`hostname`_Compliance.txt
echo " check manualy"  >>`hostname`_Compliance.txt
echo "LIN6_38_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_39 - Legacy Entries"  >>`hostname`_Compliance.txt
echo "LIN6_39_STARTS"  >>`hostname`_Compliance.txt
echo "Legacy Entries in /etc/passwd"  >>`hostname`_Compliance.txt
/bin/grep '^+:' /etc/passwd  >>`hostname`_Compliance.txt
echo "Legacy Entries in /etc/shadow"  >>`hostname`_Compliance.txt
/bin/grep '^+:' /etc/shadow  >>`hostname`_Compliance.txt
echo "Legacy Entries in /etc/group"  >>`hostname`_Compliance.txt
/bin/grep '^+:' /etc/group  >>`hostname`_Compliance.txt
echo "LIN6_39_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_40 - Modify UID's of users with duplicate root UID"  >>`hostname`_Compliance.txt
echo "LIN6_40_STARTS"  >>`hostname`_Compliance.txt
cat /etc/passwd | grep ':x:0'  >>`hostname`_Compliance.txt
echo "LIN6_40_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_41 - Verify system file permission"  >>`hostname`_Compliance.txt
echo "LIN6_41_STARTS"  >>`hostname`_Compliance.txt
echo "World Writable Files"  >>`hostname`_Compliance.txt
echo " If the control output is empty then control will be manual check" >>`hostname`_Compliance.txt
echo "Permission and Ownership on /etc/passwd"  >>`hostname`_Compliance.txt
/bin/ls -l /etc/passwd  >>`hostname`_Compliance.txt
echo "Permission and Ownership on /etc/shadow"  >>`hostname`_Compliance.txt
/bin/ls -l /etc/shadow  >>`hostname`_Compliance.txt
echo "Permission and Ownership on /etc/gshadow"  >>`hostname`_Compliance.txt
/bin/ls -l /etc/gshadow  >>`hostname`_Compliance.txt
echo "Permission and Ownership on /etc/group"  >>`hostname`_Compliance.txt
/bin/ls -l /etc/group  >>`hostname`_Compliance.txt
echo "LIN6_41_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt

echo "LIN6_42- Collect System Administrator Actions"  >>`hostname`_Compliance.txt
echo "LIN6_42-STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
grep actions /etc/audit/audit.rules  >>`hostname`_Compliance.txt
echo "LIN6_42_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_43 - Set Default umask for Users"  >>`hostname`_Compliance.txt
echo "LIN6_43_STARTS"  >>`hostname`_Compliance.txt
echo "UMASK in /etc/bashrc"  >>`hostname`_Compliance.txt
cat /etc/bashrc | grep umask | grep -v "#"  >>`hostname`_Compliance.txt
echo "UMASK in /etc/profile"  >>`hostname`_Compliance.txt
cat /etc/profile | grep umask | grep -v "#"  >>`hostname`_Compliance.txt
echo "LIN6_43_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_44 - User home directory permission is not secured"  >>`hostname`_Compliance.txt
echo "LIN6_44_STARTS"  >>`hostname`_Compliance.txt
echo "-------------If the controls output is empty then do manual check-------------">>`hostname`_Compliance.txt
ls -ld /home >>`hostname`_Compliance.txt
echo "LIN6_44_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_45 - Check Groups in /etc/passwd"  >>`hostname`_Compliance.txt
echo "LIN6_45_STARTS"  >>`hostname`_Compliance.txt
echo "Contents in /etc/passwd file"  >>`hostname`_Compliance.txt
cat /etc/passwd | grep -v "#"  >>`hostname`_Compliance.txt
echo "Contents in /etc/group file"  >>`hostname`_Compliance.txt
cat /etc/group | grep -v "#"  >>`hostname`_Compliance.txt
echo "LIN6_45_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_46 - Check for Presence and permission of User .netrc Files"  >>`hostname`_Compliance.txt
echo "LIN6_46_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then control will be safe " >>`hostname`_Compliance.txt
find / -name .netrc -ls  >>`hostname`_Compliance.txt
echo "LIN6_46_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_47 - Check for Presence of User .forward Files"  >>`hostname`_Compliance.txt
echo "LIN6_47_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then control will be safe " >>`hostname`_Compliance.txt
find / -name .forward -ls  >>`hostname`_Compliance.txt
echo "LIN6_47_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_48 - Check for Presence of User .rhosts Files"  >>`hostname`_Compliance.txt
echo "LIN6_48_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then control will be safe " >>`hostname`_Compliance.txt
find / -name .rhosts -ls  >>`hostname`_Compliance.txt
echo "LIN6_48_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_49 - Check User Dot File Permissions"  >>`hostname`_Compliance.txt
echo "LIN6_49_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then control will be safe " >>`hostname`_Compliance.txt
find / -name .[A-Za-z0-9]* -ls  >>`hostname`_Compliance.txt
echo "LIN6_49_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt

echo "LIN6_50 - Disable Remote login by unauthenticated users" >>`hostname`_Compliance.txt
echo "LIN6_50_STARTS"  >>`hostname`_Compliance.txt
cat /etc/hosts.equiv   >>`hostname`_Compliance.txt
echo "LIN6_50_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_51 - Disable CTRL-ALT-DEL functionality" >>`hostname`_Compliance.txt
echo "LIN6_51_STARTS" >>`hostname`_Compliance.txt
echo "upstart version" >>`hostname`_Compliance.txt
rpm -q upstart >>`hostname`_Compliance.txt
echo "Contents of control-alt-delete.conf" >>`hostname`_Compliance.txt
cat /etc/init/control-alt-delete.conf | grep -v "#" >>`hostname`_Compliance.txt
echo "Contents of control-alt-delete.override" >>`hostname`_Compliance.txt
cat /etc/init/control-alt-delete.override | grep -v "#" >>`hostname`_Compliance.txt
echo "LIN6_51_ENDS"  >>`hostname`_Compliance.txt
echo   >>`hostname`_Compliance.txt


echo "LIN6_52 - Set FTP and Telnet banners" >>`hostname`_Compliance.txt
echo "LIN6_52_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
echo "ISSUE.NET"  >>`hostname`_Compliance.txt
cat /etc/issue.net   >>`hostname`_Compliance.txt
echo "FTPD_BANNER"  >>`hostname`_Compliance.txt
cat /etc/vsftpd/vsftpd.conf | grep 'ftpd_banner'   >>`hostname`_Compliance.txt
echo "LIN6_52_ENDS"  >>`hostname`_Compliance.txt
echo     >>`hostname`_Compliance.txt


echo "LIN6_53 - Configure secure FTP settings"				  >>`hostname`_Compliance.txt
echo "LIN6_53_STARTS"							  >>`hostname`_Compliance.txt
chkconfig --list | grep ftpd
echo "USERLISTENABLE"						  >>`hostname`_Compliance.txt
cat /etc/vsftpd/vsftpd.conf | grep -i userlist_enable | grep -v "#"	  >>`hostname`_Compliance.txt
echo "USERLISTDENY"						  >>`hostname`_Compliance.txt
cat /etc/vsftpd/vsftpd.conf | grep -i userlist_deny | grep -v "#"	  >>`hostname`_Compliance.txt
echo "FTPUSERS"						  >>`hostname`_Compliance.txt
cat /etc/ftpusers							  >>`hostname`_Compliance.txt
echo "VSFTPD"							 >>`hostname`_Compliance.txt
echo "Users present in /etc/vsftpd.ftpusers"				 >>`hostname`_Compliance.txt
cat /etc/vsftpd/ftpusers						 >>`hostname`_Compliance.txt
echo "Users present in /etc/vsftpd/user_list"				 >>`hostname`_Compliance.txt
cat /etc/vsftpd/user_list | awk -F: ' { print $1 } ' | grep -v "#"	 >>`hostname`_Compliance.txt
echo "LIN6_53_ENDS"							 >>`hostname`_Compliance.txt
echo									 >>`hostname`_Compliance.txt


echo "LIN6_54 - strong permission on log files"  >>`hostname`_Compliance.txt
echo "LIN6_54_STARTS"  >>`hostname`_Compliance.txt
echo "MESSAGES"  >>`hostname`_Compliance.txt
ls -l /var/log/messages   >>`hostname`_Compliance.txt
echo "WTMP"  >>`hostname`_Compliance.txt
ls -l /var/log/wtmp   >>`hostname`_Compliance.txt
echo "XFERLOG"  >>`hostname`_Compliance.txt
ls -l /var/log/xferlog   >>`hostname`_Compliance.txt
echo "CRON"  >>`hostname`_Compliance.txt
ls -l /var/log/cron   >>`hostname`_Compliance.txt
echo "LASTLOG"  >>`hostname`_Compliance.txt
ls -l /var/log/lastlog   >>`hostname`_Compliance.txt
echo "LIN6_54_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_55 - Disable All shares"					 >>`hostname`_Compliance.txt
echo "LIN6_55_STARTS"							 >>`hostname`_Compliance.txt
cat /etc/exports						         >>`hostname`_Compliance.txt
echo "LIN6_55_ENDS"							 >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_56 - Authentication & authorization of users against PAM"  >>`hostname`_Compliance.txt
echo "LIN6_56_STARTS"  >>`hostname`_Compliance.txt
echo " If the control output is empty then refer SCD note for further information " >>`hostname`_Compliance.txt
rpm -qa | egrep -i 'pam'  >>`hostname`_Compliance.txt
echo "LIN6_56_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_57 - NTP Setting"  >>`hostname`_Compliance.txt
echo "LIN6_57_STARTS"  >>`hostname`_Compliance.txt
echo "NTP Service Status"  >>`hostname`_Compliance.txt
chkconfig --list | grep ntp  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt
echo "NTPD proccess status"  >>`hostname`_Compliance.txt
cat /etc/sysconfig/ntpd | grep ntp:ntp | grep -v "#"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt
echo "NTPD configuration details"  >>`hostname`_Compliance.txt
cat /etc/ntp.conf | grep ^server | grep -v "#"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt
cat /etc/ntp.conf | grep ^restrict | grep -v "#"  >>`hostname`_Compliance.txt
echo "LIN6_57_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo "LIN6_58 - USB Disabled"  >>`hostname`_Compliance.txt
echo "LIN6_58_STARTS"  >>`hostname`_Compliance.txt
echo "Rule 1"  >>`hostname`_Compliance.txt
cat /etc/modprobe.d/blacklist | grep "blacklist usb_storage"  >>`hostname`_Compliance.txt
echo "Rule 2"  >>`hostname`_Compliance.txt
ls -l /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko  >>`hostname`_Compliance.txt
echo "Rule 3"  >>`hostname`_Compliance.txt
cat /etc/udev/rules.d/ignore_usb_storage.rule | grep "ACTION" | grep "bus" | grep "DRIVER" | grep "OPTIONS"  >>`hostname`_Compliance.txt
echo "LIN6_58_ENDS"  >>`hostname`_Compliance.txt
echo  >>`hostname`_Compliance.txt


echo " LIN6_59 - Restrict Cipher list"	>> `hostname`_Compliance.txt
echo "LIN6_59_STARTS"  >>`hostname`_Compliance.txt
echo "If the control output is blank then do manual check" >>`hostname`_Compliance.txt
cat /etc/ssh/sshd_config  >>`hostname`_Compliance.txt
echo "LIN6_59_ENDS"	>> `hostname`_Compliance.txt


echo "LIN6_60 - Enable TLS 1.0 & Above protocol"	>> `hostname`_Compliance.txt
echo "LIN6_60_STARTS"  >>`hostname`_Compliance.txt
echo "If the web server/service is disabled on the server then control will be not applicable" >>`hostname`_Compliance.txt
cat /etc/httpd/conf.d/ssl.conf  >>`hostname`_Compliance.txt
echo "LIN6_60_ENDS"	>> `hostname`_Compliance.txt

echo "LIN6_61 -  Ensure permissions on bootloader config are configured"	>> `hostname`_Compliance.txt
echo "LIN6_61_STARTS"  >>`hostname`_Compliance.txt
stat /boot/grub/grub.conf >>`hostname`_Compliance.txt
echo "LIN6_61_ENDS"	>> `hostname`_Compliance.txt

echo "LIN6_62 -   Ensure audit logs are not automatically deleted"	>> `hostname`_Compliance.txt
echo "LIN6_62_STARTS"  >>`hostname`_Compliance.txt
grep max_log_file_action /etc/audit/auditd.conf >>`hostname`_Compliance.txt
echo "LIN6_62_ENDS"	>> `hostname`_Compliance.txt

echo "LIN6_63 - Ensure no world writable files exist"	>> `hostname`_Compliance.txt
echo "LIN6_63_STARTS"  >>`hostname`_Compliance.txt
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 >>`hostname`_Compliance.txt
echo "LIN6_63_ENDS"	>> `hostname`_Compliance.txt

echo "--------------END OF OUTPUT--------------" >>`hostname`_Compliance.txt
