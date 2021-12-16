# Ubuntu  script
#!/bin/bash
echo "Audit script for Linux is running. Kindly wait for the script to terminate."  >>`hostname`_Ubuntu.txt
exec > `hostname`_Ubuntu.txt >>`hostname`_Ubuntu.txt
echo "Ubuntu _00 - System Information" >>`hostname`_Ubuntu.txt
echo "Ubuntu _00_STARTS" >>`hostname`_Ubuntu.txt
hostname >>`hostname`_Ubuntu.txt
ifconfig -a|grep "inet addr" >>`hostname`_Ubuntu.txt
echo "SCRIPT VERSION - 1.0" >>`hostname`_Ubuntu.txt

echo "Ubuntu _00_ENDS" >>`hostname`_Ubuntu.txt
echo "File System Configuration" >>`hostname`_Ubuntu.txt
echo "Ubuntu _01 - Create separate partition for directories" >>`hostname`_Ubuntu.txt
echo "Ubuntu _01_STARTS" >>`hostname`_Ubuntu.txt
echo "Ubuntu _01  /tmp" >>`hostname`_Ubuntu.txt
cat /etc/fstab | grep /tmp >>`hostname`_Ubuntu.txt
echo "Ubuntu _01  /var" >>`hostname`_Ubuntu.txt
cat /etc/fstab | grep /var >>`hostname`_Ubuntu.txt

echo "Ubuntu _01  /var/log" >>`hostname`_Ubuntu.txt
cat /etc/fstab | grep /var/log >>`hostname`_Ubuntu.txt
echo "Ubuntu _01  /var/log/audit" >>`hostname`_Ubuntu.txt
cat /etc/fstab | grep /var/log/audit >>`hostname`_Ubuntu.txt
echo "Ubuntu _01  /home" >>`hostname`_Ubuntu.txt
cat /etc/fstab | grep /home >>`hostname`_Ubuntu.txt

echo "Ubuntu _02 - Set nodev option" >>`hostname`_Ubuntu.txt
echo "Ubuntu _02_STARTS" >>`hostname`_Ubuntu.txt
echo "Ubuntu _02  /temp" >>`hostname`_Ubuntu.txt
cat  /etc/fstab | grep /tmp | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount /tmp" >>`hostname`_Ubuntu.txt
mount | grep /tmp | grep nodev >>`hostname`_Ubuntu.txt
echo "Ubuntu _02  /home"
cat  /etc/fstab | grep /home | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount /home" >>`hostname`_Ubuntu.txt
mount | grep /home | grep nodev >>`hostname`_Ubuntu.txt
echo "Ubuntu _02  /shm" >>`hostname`_Ubuntu.txt
cat  /etc/fstab | grep /dev/shm | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount /shm" >>`hostname`_Ubuntu.txt
mount | grep /dev/shm | grep nodev >>`hostname`_Ubuntu.txt
echo "Ubuntu _02  /cdrom"
cat  /etc/fstab | grep /cdrom | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount /cdrom" >>`hostname`_Ubuntu.txt
mount | grep /cdrom | grep nodev >>`hostname`_Ubuntu.txt
echo "Ubuntu _02  /floppy"
cat  /etc/fstab | grep /floppy | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount /floppy" >>`hostname`_Ubuntu.txt
mount | grep /floppy | grep nodev >>`hostname`_Ubuntu.txt
echo "Ubuntu _02_ENDS" >>`hostname`_Ubuntu.txt

   
echo "Ubuntu _03 - set noexec option" >>`hostname`_Ubuntu.txt
echo "Ubuntu _03_STARTS" >>`hostname`_Ubuntu.txt
echo "Ubuntu _03  /tmp"  >>`hostname`_Ubuntu.txt
cat  /etc/fstab | grep /tmp | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount  /tmp" >>`hostname`_Ubuntu.txt
mount | grep /tmp | grep noexec >>`hostname`_Ubuntu.txt
echo "Ubuntu _03  /shm" >>`hostname`_Ubuntu.txt
cat  /etc/fstab | grep /dev/shm | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount  /shm" >>`hostname`_Ubuntu.txt
mount | grep /dev/shm | grep noexec >>`hostname`_Ubuntu.txt
echo "Ubuntu _03  /cdrom" >>`hostname`_Ubuntu.txt
cat  /etc/fstab | grep /cdrom | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount  /cdrom" >>`hostname`_Ubuntu.txt
mount | grep /cdrom | grep noexec >>`hostname`_Ubuntu.txt
echo "Ubuntu _03  /floppy" >>`hostname`_Ubuntu.txt
cat  /etc/fstab | grep /floppy | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount  /floppy" >>`hostname`_Ubuntu.txt
mount | grep /floppy | grep noexec >>`hostname`_Ubuntu.txt
 echo "Ubuntu _03_ENDS" >>`hostname`_Ubuntu.txt
 
echo "Ubuntu _04 - set nosuid option" >>`hostname`_Ubuntu.txt
echo "Ubuntu _04_STARTS" >>`hostname`_Ubuntu.txt
echo "Ubuntu _04  /tmp" >>`hostname`_Ubuntu.txt
cat  /etc/fstab | grep /tmp | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount  /tmp" >>`hostname`_Ubuntu.txt
mount | grep /tmp | grep nosuid >>`hostname`_Ubuntu.txt
echo "Ubuntu _04  /shm"
cat  /etc/fstab | grep /dev/shm | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount  /shm" >>`hostname`_Ubuntu.txt
mount | grep /dev/shm | grep nosuid >>`hostname`_Ubuntu.txt
echo "Ubuntu _04 /cdrom" >>`hostname`_Ubuntu.txt
cat  /etc/fstab | grep /cdrom | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount  /cdrom" >>`hostname`_Ubuntu.txt
mount | grep /cdrom | grep nosuid >>`hostname`_Ubuntu.txt
echo "Ubuntu _04 /floppy" >>`hostname`_Ubuntu.txt
cat  /etc/fstab | grep /floppy | grep -v "#" >>`hostname`_Ubuntu.txt
echo "mount  /floppy" >>`hostname`_Ubuntu.txt
mount | grep /floppy | grep nosuid >>`hostname`_Ubuntu.txt

echo "Ubuntu _04_ENDS" >>`hostname`_Ubuntu.txt
echo "Ubuntu _05 - Bind Mount the /var/tmp directory to /tmp" >>`hostname`_Ubuntu.txt
echo "Ubuntu _05_STARTS" >>`hostname`_Ubuntu.txt
echo "Ubuntu _05 /tmp"   >>`hostname`_Ubuntu.txt
cat /etc/fstab | grep -e "^/tmp" | grep /var/tmp >>`hostname`_Ubuntu.txt
echo "mount /tmp" >>`hostname`_Ubuntu.txt
mount | grep -e "^/tmp" | grep /var/tmp >>`hostname`_Ubuntu.txt 
echo "Ubuntu _05_ENDS" >>`hostname`_Ubuntu.txt

echo "Ubuntu _06 - Sticky bit on temporary folders" >>`hostname`_Ubuntu.txt
echo "Ubuntu _06_STARTS"				 >>`hostname`_Ubuntu.txt
echo "Sticky bit on /tmp"			 >>`hostname`_Ubuntu.txt
ls -l / | grep 'tmp'				 >>`hostname`_Ubuntu.txt
echo "Sticky bit on /var/tmp"			 >>`hostname`_Ubuntu.txt
ls -ld  '/var/tmp'				 >>`hostname`_Ubuntu.txt
echo "Ubuntu _06_ENDS"				 >>`hostname`_Ubuntu.txt
echo						 >>`hostname`_Ubuntu.txt
echo "Ubuntu _07 - Check for Duplicate UIDs and GIDs" >>`hostname`_Ubuntu.txt
echo "Ubuntu _07_STARTS"				   >>`hostname`_Ubuntu.txt
echo "Duplicate UIDs :"				   >>`hostname`_Ubuntu.txt
#/bin/cat /etc/passwd | /bin/cut -f3 -d":" | /bin/sort -n | /usr/bin/uniq -c|while read x ; do [ -z "${x}" ] && break; set - $x; if [ $1 -gt 1 ]; then users=`/bin/gawk -F: '($3 == n) { print $1 }' n=$2 \
cat /etc/passwd | cut -d: -f3 | sort | uniq -d >>`hostname`_Ubuntu.txt
#/etc/passwd | /usr/bin/xargs`; echo "Duplicate UID $2: ${users}"; fi; done
#cat /etc/passwd | grep -v "#"
echo "Duplicate GIDs:"				 >>`hostname`_Ubuntu.txt
# /bin/cat /etc/group | /bin/cut -f3 -d":" | /bin/sort -n | /usr/bin/uniq -c|while read x ; do [ -z "${x}" ] && break; set - $x; if [ $1 -gt 1 ]; then grps=`/bin/gawk -F: '($3 == n) { print $1 }' n=$2 \
# /etc/group | /usr/bin/xargs`; echo "Duplicate GID $2: ${grps}"; fi; done
cat /etc/group | cut -d: -f3 | sort | uniq -d	 >>`hostname`_Ubuntu.txt
#cat /etc/group | grep -v "#"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _07_ENDS"				 >>`hostname`_Ubuntu.txt
echo						 >>`hostname`_Ubuntu.txt
echo "Ubuntu _08 - Check That Reserved UIDs Are Assigned to System Accounts" >>`hostname`_Ubuntu.txt
echo "Ubuntu _08_STARTS"							  >>`hostname`_Ubuntu.txt
cat /etc/passwd | grep -v "#"						  >>`hostname`_Ubuntu.txt
echo "Ubuntu _08_ENDS"							  >>`hostname`_Ubuntu.txt
echo	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _67 - Configure secure FTP settings"				  >>`hostname`_Ubuntu.txt
echo "Ubuntu _67_STARTS"							  >>`hostname`_Ubuntu.txt
chkconfig --list | grep ftpd   >>`hostname`_Ubuntu.txt

echo "Ubuntu _67	USERLISTENABLE"						  >>`hostname`_Ubuntu.txt
cat /etc/vsftpd/vsftpd.conf | grep -i userlist_enable | grep -v "#"	  >>`hostname`_Ubuntu.txt
echo "Ubuntu _67	USERLISTDENY"						  >>`hostname`_Ubuntu.txt
cat /etc/vsftpd/vsftpd.conf | grep -i userlist_deny | grep -v "#"	  >>`hostname`_Ubuntu.txt
echo "Ubuntu _67	FTPUSERS"						  >>`hostname`_Ubuntu.txt
t="/etc/ftpusers"							  >>`hostname`_Ubuntu.txt

 >>`hostname`_Ubuntu.txt
cat /etc/ftpusers							  >>`hostname`_Ubuntu.txt
echo "Ubuntu _67	VSFTPD"							 >>`hostname`_Ubuntu.txt
echo "Users present in /etc/vsftpd.ftpusers"				 >>`hostname`_Ubuntu.txt
t="/etc/vsftpd.ftpusers"

 >>`hostname`_Ubuntu.txt
cat /etc/vsftpd/ftpusers						 >>`hostname`_Ubuntu.txt
echo "Users present in /etc/vsftpd/ftpusers"				 >>`hostname`_Ubuntu.txt
t="/etc/vsftpd/ftpusers"

 >>`hostname`_Ubuntu.txt
cat /etc/vsftpd/ftpusers						 >>`hostname`_Ubuntu.txt
echo "Users present in /etc/vsftpd/user_list"				 >>`hostname`_Ubuntu.txt
cat /etc/vsftpd/user_list | awk -F: ' { print $1 } ' | grep -v "#"	 >>`hostname`_Ubuntu.txt
 >>`hostname`_Ubuntu.txt
echo "Ubuntu _67_ENDS"							 >>`hostname`_Ubuntu.txt

echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _68 - Set system resource limit for users"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _68_STARTS"							 >>`hostname`_Ubuntu.txt
cat /etc/security/limits.conf						 >>`hostname`_Ubuntu.txt


 >>`hostname`_Ubuntu.txt
echo "Ubuntu _68_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _70 - Disable All shares"					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _70_STARTS"							 >>`hostname`_Ubuntu.txt
cat /etc/exports						         >>`hostname`_Ubuntu.txt


 >>`hostname`_Ubuntu.txt
echo "Ubuntu _70_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Patches, Os Releases and SELinux"					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _09_STARTS"							 >>`hostname`_Ubuntu.txt
echo "Ubuntu _09 - Os Releases"						 >>`hostname`_Ubuntu.txt
echo "RED-HAT Product Version - 09"					 >>`hostname`_Ubuntu.txt
cat /etc/redhat-release							 >>`hostname`_Ubuntu.txt
echo "Kernel release - 09"						 >>`hostname`_Ubuntu.txt
uname -r								 >>`hostname`_Ubuntu.txt
echo "Ubuntu _09_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _10 - Latest Security Patches are Installed"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _10_STARTS"							 >>`hostname`_Ubuntu.txt
echo "RED-HAT Product Version - 10"					 >>`hostname`_Ubuntu.txt
cat /etc/redhat-release							 >>`hostname`_Ubuntu.txt
echo "Kernel release - 10"						 >>`hostname`_Ubuntu.txt
uname -a								 >>`hostname`_Ubuntu.txt
echo "List Of Installed Packages"					 >>`hostname`_Ubuntu.txt
rpm -qa									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _10_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _11 - GPG Settings"						 >>`hostname`_Ubuntu.txt
echo "Ubuntu _11_STARTS"							 >>`hostname`_Ubuntu.txt
echo "GPG Key Installer"						 >>`hostname`_Ubuntu.txt
rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey				 >>`hostname`_Ubuntu.txt
echo "GPG globally activated"						 >>`hostname`_Ubuntu.txt
cat /etc/yum.conf | grep gpgcheck | grep -v "#"				 >>`hostname`_Ubuntu.txt
echo "Ubuntu _11_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _12 - Enable SELinux in /etc/grub.conf"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _12_STARTS"							 >>`hostname`_Ubuntu.txt
grep selinux=0 /etc/grub.conf						 >>`hostname`_Ubuntu.txt
grep enforcing=0 /etc/grub.conf						 >>`hostname`_Ubuntu.txt
echo "Ubuntu _12_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _13 - Set the SELinux Policy"					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _13_STARTS"							 >>`hostname`_Ubuntu.txt
grep SELINUXTYPE=targeted /etc/selinux/config				 >>`hostname`_Ubuntu.txt
echo "Ubuntu _13_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _14 - Remove SETroubleshoot"					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _14_STARTS"							 >>`hostname`_Ubuntu.txt
yum list setroubleshoot							 >>`hostname`_Ubuntu.txt
echo "Ubuntu _14_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _15 - Check for Unconfined Daemons"				 >>`hostname`_Ubuntu.txt
echo "Ubuntu _15_STARTS"							 >>`hostname`_Ubuntu.txt
ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{ print $NF }' >>`hostname`_Ubuntu.txt
echo "Ubuntu _15_ENDS"                                                      >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _ - Enable Randomized Virtual Memory Region Placement"	 >>`hostname`_Ubuntu.txt
echo "Ubuntu __STARTS"							 >>`hostname`_Ubuntu.txt
sysctl kernel.randomize_va_space					 >>`hostname`_Ubuntu.txt
echo "Ubuntu __ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "System Access and Authentication"					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _17 - Ensure Password Fields are Not Empty"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _17_STARTS"							 >>`hostname`_Ubuntu.txt
/bin/cat /etc/shadow | /bin/awk -F : '($2 == "" ) { print $1 " does not have a password "}' >>`hostname`_Ubuntu.txt
echo "Ubuntu _17_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt					
echo "Ubuntu _18 - Set Warning Banner for Standard Login Services"		 >>`hostname`_Ubuntu.txt
echo "Ubuntu _18_STARTS"							 >>`hostname`_Ubuntu.txt
echo "Permission on /etc/motd"						 >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/motd							 >>`hostname`_Ubuntu.txt
echo "Permission on /etc/issue"						 >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/issue							 >>`hostname`_Ubuntu.txt
echo "Permission on /etc/issue.net"					 >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/issue.net						 >>`hostname`_Ubuntu.txt
echo "Contents of /etc/motd"						 >>`hostname`_Ubuntu.txt
cat /etc/motd								 >>`hostname`_Ubuntu.txt
echo "Contents of /etc/issue"						 >>`hostname`_Ubuntu.txt
cat /etc/issue								 >>`hostname`_Ubuntu.txt
echo "Contents of /etc/issue.net"					 >>`hostname`_Ubuntu.txt
cat /etc/issue.net							 >>`hostname`_Ubuntu.txt
echo "Ubuntu _18_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _19 - Enable strong password policy"				 >>`hostname`_Ubuntu.txt
echo "Ubuntu _19_STARTS"							 >>`hostname`_Ubuntu.txt
echo "Password Maximum Days"						 >>`hostname`_Ubuntu.txt
cat /etc/login.defs | grep PASS_MAX_DAYS | grep -v "#"			 >>`hostname`_Ubuntu.txt
echo "Password Minimum Days"						 >>`hostname`_Ubuntu.txt
cat /etc/login.defs | grep PASS_MIN_DAYS | grep -v "#"			 >>`hostname`_Ubuntu.txt
echo "Password Warnage Age"						 >>`hostname`_Ubuntu.txt
cat /etc/login.defs | grep PASS_WARN_AGE | grep -v "#"			 >>`hostname`_Ubuntu.txt
echo "Password Minimum length"						 >>`hostname`_Ubuntu.txt
cat /etc/login.defs | grep PASS_MIN_LEN | grep -v "#"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _19_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _20 - Boot Loader Settings"					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _20_STARTS"							 >>`hostname`_Ubuntu.txt
ls -l /etc/grub.conf							 >>`hostname`_Ubuntu.txt
echo "Ubuntu _20_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _21 - Disable Interactive Boot"				 >>`hostname`_Ubuntu.txt
echo "Ubuntu _21_STARTS"							 >>`hostname`_Ubuntu.txt
grep "^PROMPT=" /etc/sysconfig/init					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _21_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _22 - Require Authentication for Single-User Mode"		 >>`hostname`_Ubuntu.txt
echo "Ubuntu _22_STARTS"							 >>`hostname`_Ubuntu.txt
cat /etc/sysconfig/init | grep SINGLE | grep -v "#"			 >>`hostname`_Ubuntu.txt
echo "Check PROMPT in /etc/sysconfig/init"				 >>`hostname`_Ubuntu.txt
cat /etc/sysconfig/init | grep PROMPT | grep -v "#"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _22_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _23 - Set User/Group Owner and Permission"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _23_STARTS"							 >>`hostname`_Ubuntu.txt
echo "User Group Owner and Permission on /etc/anacrontab"		 >>`hostname`_Ubuntu.txt
stat -c "%a %u %g" /etc/anacrontab | egrep ".00 0 0"			 >>`hostname`_Ubuntu.txt
echo "User Group Owner and Permission on /etc/crontab"			 >>`hostname`_Ubuntu.txt
stat -c "%a %u %g" /etc/crontab | egrep ".00 0 0"			 >>`hostname`_Ubuntu.txt
echo "User Group Owner and Permission on /etc/cron.hourly"		 >>`hostname`_Ubuntu.txt
stat -c "%a %u %g" /etc/cron.hourly | egrep ".00 0 0"			 >>`hostname`_Ubuntu.txt
echo "User Group Owner and Permission on /etc/cron.daily"		 >>`hostname`_Ubuntu.txt
stat -c "%a %u %g" /etc/cron.daily | egrep ".00 0 0"			 >>`hostname`_Ubuntu.txt
echo "User Group Owner and Permission on /etc/cron.weekly"		 >>`hostname`_Ubuntu.txt
stat -c "%a %u %g" /etc/cron.weekly | egrep ".00 0 0"			 >>`hostname`_Ubuntu.txt
echo "User Group Owner and Permission on /etc/cron.monthly"		 >>`hostname`_Ubuntu.txt
stat -c "%a %u %g" /etc/cron.monthly | egrep ".00 0 0"			 >>`hostname`_Ubuntu.txt
echo "User Group Owner and Permission on /etc/cron.d"			 >>`hostname`_Ubuntu.txt
stat -c "%a %u %g" /etc/cron.d | egrep ".00 0 0"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _23_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _24 - Restrict at Daemon and at/cron to Authorized Users"	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _24	CRON ALLOW"						 >>`hostname`_Ubuntu.txt
cat /etc/cron.allow						 >>`hostname`_Ubuntu.txt
t="/etc/cron.allow"
	
	 >>`hostname`_Ubuntu.txt
echo "PERMISSION ON CRON ALLOW"						 >>`hostname`_Ubuntu.txt
ls -l /etc/cron.allow							 >>`hostname`_Ubuntu.txt
t="/etc/cron.allow"
	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _24	CRON DENY"						 >>`hostname`_Ubuntu.txt
cat /etc/cron.deny 						 >>`hostname`_Ubuntu.txt
t="/etc/cron.deny"

 >>`hostname`_Ubuntu.txt
echo "PERMISSION ON CRON DENY"						 >>`hostname`_Ubuntu.txt
ls -l /etc/cron.deny							 >>`hostname`_Ubuntu.txt
t="/etc/cron.deny"
	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _24	AT ALLOW"						 >>`hostname`_Ubuntu.txt
cat /etc/at.allow 						 >>`hostname`_Ubuntu.txt
t="/etc/at.allow"
	
	 >>`hostname`_Ubuntu.txt
echo "PERMISSION ON AT ALLOW"						 >>`hostname`_Ubuntu.txt
ls -l /etc/at.allow							 >>`hostname`_Ubuntu.txt
t="/etc/at.allow"
	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _24	AT DENY"						 >>`hostname`_Ubuntu.txt
cat /etc/at.deny 						 >>`hostname`_Ubuntu.txt
t="/etc/at.deny"
	
	 >>`hostname`_Ubuntu.txt
echo "PERMISSION ON AT DENY"						 >>`hostname`_Ubuntu.txt
ls -l /etc/at.deny							 >>`hostname`_Ubuntu.txt
t="/etc/at.deny"
	
	 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _25 - Upgrade Password Hashing Algorithm to SHA-512"		 >>`hostname`_Ubuntu.txt
echo "Ubuntu _25_STARTS"							 >>`hostname`_Ubuntu.txt
authconfig --test | grep hashing | grep sha512				 >>`hostname`_Ubuntu.txt
echo "Ubuntu _25_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _26 - Limit Password Reuse"					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _26_STARTS"							 >>`hostname`_Ubuntu.txt
grep "remember" /etc/pam.d/system-auth					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _26_ENDS"							 >>`hostname`_Ubuntu.txt
echo >>`hostname`_Ubuntu.txt
echo "Ubuntu _27 - Restrict root Login to System Console"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _27_STARTS"							 >>`hostname`_Ubuntu.txt
cat /etc/securetty | grep -v "#"					 >>`hostname`_Ubuntu.txt
echo "Ubuntu _27_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _28 - Restrict Access to the su Command"			 >>`hostname`_Ubuntu.txt
echo "Ubuntu _28_STARTS"							 >>`hostname`_Ubuntu.txt
echo "Contents in /etc/pam.d/su"					 >>`hostname`_Ubuntu.txt
grep pam_wheel.so /etc/pam.d/su						 >>`hostname`_Ubuntu.txt
echo "User List in /etc/group"						 >>`hostname`_Ubuntu.txt
grep wheel /etc/group							 >>`hostname`_Ubuntu.txt
echo "Ubuntu _28_ENDS"							 >>`hostname`_Ubuntu.txt
echo									 >>`hostname`_Ubuntu.txt
echo "Ubuntu _29 - Password Creation Requirement Parameters Using pam_cracklib" >>`hostname`_Ubuntu.txt
echo "Ubuntu _29_STARTS"							     >>`hostname`_Ubuntu.txt
grep pam_cracklib.so /etc/pam.d/system-auth				     >>`hostname`_Ubuntu.txt
echo "Ubuntu _29_ENDS"							     >>`hostname`_Ubuntu.txt
echo									     >>`hostname`_Ubuntu.txt
echo "Ubuntu _30 - Strong Password Creation Policy Using pam_passwdqc"	      >>`hostname`_Ubuntu.txt
echo "Ubuntu _30_STARTS"							      >>`hostname`_Ubuntu.txt
grep pam_passwdqc.so /etc/pam.d/system-auth				      >>`hostname`_Ubuntu.txt
echo "Ubuntu _30_ENDS"							      >>`hostname`_Ubuntu.txt
echo									      >>`hostname`_Ubuntu.txt
echo "Ubuntu _31 - Lockout for Failed Password Attempts"			      >>`hostname`_Ubuntu.txt
echo "Ubuntu _31_STARTS"							      >>`hostname`_Ubuntu.txt
echo "pam_faillock in password-auth file"			              >>`hostname`_Ubuntu.txt
grep "pam_faillock" /etc/pam.d/password-auth				      >>`hostname`_Ubuntu.txt
echo "pam_unix.so in password-auth file"				      >>`hostname`_Ubuntu.txt
grep "pam_unix.so" /etc/pam.d/password-auth | grep success=1		      >>`hostname`_Ubuntu.txt
echo "pam_faillock in system-auth file"					      >>`hostname`_Ubuntu.txt
grep "pam_faillock" /etc/pam.d/system-auth				      >>`hostname`_Ubuntu.txt
echo "pam_unix.so in system-auth file"					      >>`hostname`_Ubuntu.txt
grep "pam_unix.so" /etc/pam.d/system-auth | grep success=1		      >>`hostname`_Ubuntu.txt
echo "Ubuntu _31_ENDS"							      >>`hostname`_Ubuntu.txt
echo									      >>`hostname`_Ubuntu.txt
echo "Ubuntu _32 - Set SSH Parameters"					      >>`hostname`_Ubuntu.txt
echo "Ubuntu _32_STARTS"							      >>`hostname`_Ubuntu.txt
echo "SSH Protocol"							      >>`hostname`_Ubuntu.txt
grep "^Protocol" /etc/ssh/sshd_config					      >>`hostname`_Ubuntu.txt
echo "LogLevel"							              >>`hostname`_Ubuntu.txt
grep "^LogLevel" /etc/ssh/sshd_config					      >>`hostname`_Ubuntu.txt
echo "Permission on /etc/ssh/sshd_config"				      >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/ssh/sshd_config						      >>`hostname`_Ubuntu.txt
echo "SSH X11Forwarding"						      >>`hostname`_Ubuntu.txt
grep "^X11Forwarding" /etc/ssh/sshd_config				      >>`hostname`_Ubuntu.txt
echo "SSH MaxAuthTries"
grep "^MaxAuthTries" /etc/ssh/sshd_config
echo "SSH IgnoreRhosts"                     >>`hostname`_Ubuntu.txt
grep "^IgnoreRhosts" /etc/ssh/sshd_config   >>`hostname`_Ubuntu.txt
echo "SSH HostbasedAuthentication"          >>`hostname`_Ubuntu.txt
grep "^HostbasedAuthentication" /etc/ssh/sshd_config   >>`hostname`_Ubuntu.txt
echo "SSH Root Login"     >>`hostname`_Ubuntu.txt
grep "^PermitRootLogin" /etc/ssh/sshd_config   >>`hostname`_Ubuntu.txt
echo "SSH PermitEmptyPasswords"   >>`hostname`_Ubuntu.txt
grep "^PermitEmptyPasswords" /etc/ssh/sshd_config  >>`hostname`_Ubuntu.txt
echo "Environment Options"   >>`hostname`_Ubuntu.txt
grep PermitUserEnvironment /etc/ssh/sshd_config >>`hostname`_Ubuntu.txt
echo "Ciphers"      >>`hostname`_Ubuntu.txt
grep "Ciphers" /etc/ssh/sshd_config  >>`hostname`_Ubuntu.txt
echo "Idle Timeout Interval for User Login" >>`hostname`_Ubuntu.txt
grep "^ClientAliveInterval" /etc/ssh/sshd_config  >>`hostname`_Ubuntu.txt
grep "^ClientAliveCountMax" /etc/ssh/sshd_config  >>`hostname`_Ubuntu.txt
echo "SSH Banner"  >>`hostname`_Ubuntu.txt
grep "^Banner" /etc/ssh/sshd_config  >>`hostname`_Ubuntu.txt
echo "Ubuntu _32_ENDS"   >>`hostname`_Ubuntu.txt
echo                >>`hostname`_Ubuntu.txt
echo "Ubuntu _64 - Disable Remote login by unauthenticated users" >>`hostname`_Ubuntu.txt
echo "Ubuntu _64_STARTS"  >>`hostname`_Ubuntu.txt
cat /etc/hosts.equiv   >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _64_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _65 - Disable CTRL-ALT-DEL functionality" >>`hostname`_Ubuntu.txt
echo "Ubuntu _65_STARTS" >>`hostname`_Ubuntu.txt
echo "upstart version" >>`hostname`_Ubuntu.txt
rpm -q upstart >>`hostname`_Ubuntu.txt
echo "Contents of control-alt-delete.conf" >>`hostname`_Ubuntu.txt
cat /etc/init/control-alt-delete.conf | grep -v "#" >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "Contents of control-alt-delete.override" >>`hostname`_Ubuntu.txt
cat /etc/init/control-alt-delete.override | grep -v "#" >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _65_ENDS"  >>`hostname`_Ubuntu.txt
echo   >>`hostname`_Ubuntu.txt
echo "Ubuntu _66  - Set FTP and Telnet banners" >>`hostname`_Ubuntu.txt
echo "Ubuntu _66_STARTS"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _66	ISSUE.NET"  >>`hostname`_Ubuntu.txt
cat /etc/issue.net   >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _66	FTPD_BANNER"  >>`hostname`_Ubuntu.txt
cat /etc/vsftpd/vsftpd.conf | grep 'ftpd_banner'   >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _66_ENDS"  >>`hostname`_Ubuntu.txt
echo     >>`hostname`_Ubuntu.txt
echo "Ubuntu _71 - Authentication & authorization of users against PAM"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _71_STARTS"  >>`hostname`_Ubuntu.txt
rpm -qa | egrep -i 'pam'  >>`hostname`_Ubuntu.txt
echo "Ubuntu _71_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _72 - Sudo Configuration file"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _72_STARTS"  >>`hostname`_Ubuntu.txt
cat /etc/sudoers   >>`hostname`_Ubuntu.txt

echo "Ubuntu _72_ENDS"  >>`hostname`_Ubuntu.txt
echo   >>`hostname`_Ubuntu.txt
echo "Ubuntu _33 - Configure /etc/rsyslog.conf"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _33_STARTS"  >>`hostname`_Ubuntu.txt
echo "Contents of rsyslog.conf file"  >>`hostname`_Ubuntu.txt
cat /etc/rsyslog.conf  >>`hostname`_Ubuntu.txt
echo "Checking for log files"  >>`hostname`_Ubuntu.txt
ls -l /var/log/  >>`hostname`_Ubuntu.txt
echo "Ubuntu _33_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _34 - Configure rsyslog to Send Logs to a Remote Log Host"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _34_STARTS"  >>`hostname`_Ubuntu.txt
grep "^*.*[^I][^I]*@" /etc/rsyslog.conf  >>`hostname`_Ubuntu.txt
echo "Ubuntu _34_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _35 - Accept Remote rsyslog Messages Only on Designated Log Hosts"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _35_STARTS"  >>`hostname`_Ubuntu.txt
echo "ModLoad imtcp.so value"  >>`hostname`_Ubuntu.txt
grep '$ModLoad imtcp.so' /etc/rsyslog.conf  >>`hostname`_Ubuntu.txt
echo "InputTCPServerRun value"  >>`hostname`_Ubuntu.txt
grep '$InputTCPServerRun' /etc/rsyslog.conf  >>`hostname`_Ubuntu.txt
echo "Ubuntu _35_ENDS" >>`hostname`_Ubuntu.txt
echo >>`hostname`_Ubuntu.txt
echo "Ubuntu _36 - Configure logrotate"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _36_STARTS"  >>`hostname`_Ubuntu.txt
cat /etc/logrotate.d/syslog | grep -v "#"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _36_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _37 - Disable System Accounts"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _37_STARTS"  >>`hostname`_Ubuntu.txt
cat /etc/passwd  >>`hostname`_Ubuntu.txt
echo "Ubuntu _37_ENDS"  >>`hostname`_Ubuntu.txt
echo   >>`hostname`_Ubuntu.txt
echo "Ubuntu _38 - Set Default Group for root Account"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _38_STARTS"  >>`hostname`_Ubuntu.txt
grep root /etc/passwd | cut -d: -f 1,4  >>`hostname`_Ubuntu.txt
echo "Ubuntu _38_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _39 - Lock Inactive User Accounts"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _39_STARTS"  >>`hostname`_Ubuntu.txt
useradd -D | grep INACTIVE  >>`hostname`_Ubuntu.txt
echo "Ubuntu _39_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _40 - Configure Audit Log"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _40_STARTS"  >>`hostname`_Ubuntu.txt
echo "Audit Log Storage Size"  >>`hostname`_Ubuntu.txt
grep max_log_file /etc/audit/auditd.conf  >>`hostname`_Ubuntu.txt
echo "System on Audit Log Full - space_left_action"  >>`hostname`_Ubuntu.txt
grep space_left_action /etc/audit/auditd.conf  >>`hostname`_Ubuntu.txt
echo "System on Audit Log Full - action_mail_acct"  >>`hostname`_Ubuntu.txt
grep action_mail_acct /etc/audit/auditd.conf  >>`hostname`_Ubuntu.txt
echo "System on Audit Log Full - admin_space_left_action"  >>`hostname`_Ubuntu.txt
grep admin_space_left_action /etc/audit/auditd.conf  >>`hostname`_Ubuntu.txt
echo "Keep All Auditing Information"  >>`hostname`_Ubuntu.txt
grep max_log_file_action /etc/audit/auditd.conf  >>`hostname`_Ubuntu.txt
echo "Ubuntu _40_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _41 - Enable Auditing for Processes That Start Prior to auditd"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _41_STARTS"  >>`hostname`_Ubuntu.txt
grep "kernel" /etc/grub.conf  >>`hostname`_Ubuntu.txt
echo "Ubuntu _41_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _42 - Collect Login and Logout Events"  >>`hostname`_Ubuntu.txt >>`hostname`_Ubuntu.txt
echo "Ubuntu _42_STARTS"  >>`hostname`_Ubuntu.txt
grep logins /etc/audit/audit.rules  >>`hostname`_Ubuntu.txt
echo "Ubuntu _42_ENDS"  >>`hostname`_Ubuntu.txt
echo >>`hostname`_Ubuntu.txt
echo "Ubuntu _43 - Collect Session Initiation Information"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _43_STARTS"  >>`hostname`_Ubuntu.txt
grep session /etc/audit/audit.rules  >>`hostname`_Ubuntu.txt
echo "Ubuntu _43_ENDS"  >>`hostname`_Ubuntu.txt
echo >>`hostname`_Ubuntu.txt
echo "Ubuntu _44 - Make the Audit Configuration Immutable"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _44_STARTS"  >>`hostname`_Ubuntu.txt
grep "^-e 2" /etc/audit/audit.rules  >>`hostname`_Ubuntu.txt
echo "Ubuntu _44_ENDS"  >>`hostname`_Ubuntu.txt
echo >>`hostname`_Ubuntu.txt
echo "Ubuntu _69 - strong permission on log files"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _69_STARTS"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _69	MESSAGES"  >>`hostname`_Ubuntu.txt
ls -l /var/log/messages   >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _69	WTMP"  >>`hostname`_Ubuntu.txt
ls -l /var/log/wtmp   >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _69	XFERLOG"  >>`hostname`_Ubuntu.txt
ls -l /var/log/xferlog   >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _69	CRON"  >>`hostname`_Ubuntu.txt
ls -l /var/log/cron   >>`hostname`_Ubuntu.txt


 >>`hostname`_Ubuntu.txt
echo "Ubuntu _69	LASTLOG"  >>`hostname`_Ubuntu.txt
ls -l /var/log/lastlog   >>`hostname`_Ubuntu.txt


 >>`hostname`_Ubuntu.txt
echo "Ubuntu _69_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _45 - Restrict Core Dumps"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _45_STARTS"  >>`hostname`_Ubuntu.txt
echo "hard core value"  >>`hostname`_Ubuntu.txt
cat /etc/security/limits.conf | grep 'hard' | grep 'core' | grep -v "#"  >>`hostname`_Ubuntu.txt
echo "dumpable value"  >>`hostname`_Ubuntu.txt
sysctl fs.suid_dumpable  >>`hostname`_Ubuntu.txt
echo "Ubuntu _45_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _46 - Enable IPtables"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _46_STARTS"  >>`hostname`_Ubuntu.txt
chkconfig --list iptables  >>`hostname`_Ubuntu.txt
echo "Ubuntu _46_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _47 - TCP Wrappers"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _47_STARTS"  >>`hostname`_Ubuntu.txt
echo "file hosts.allow"  >>`hostname`_Ubuntu.txt
cat /etc/hosts.allow  >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "permission on hosts.allow"  >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/hosts.allow  >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "file hosts.deny"  >>`hostname`_Ubuntu.txt
grep "ALL: ALL" /etc/hosts.deny  >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "permission on hosts.deny"  >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/hosts.deny  >>`hostname`_Ubuntu.txt

	
	 >>`hostname`_Ubuntu.txt
echo "Ubuntu _47_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _48 - Non-Essential Services"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _48_STARTS"  >>`hostname`_Ubuntu.txt
echo "Services to Remove"  >>`hostname`_Ubuntu.txt
yum list  >>`hostname`_Ubuntu.txt
echo "Services to Disable"  >>`hostname`_Ubuntu.txt
chkconfig --list  >>`hostname`_Ubuntu.txt
echo "Ubuntu _48_ENDS"  >>`hostname`_Ubuntu.txt 
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _49 - Modify Network Parameters"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _49_STARTS"  >>`hostname`_Ubuntu.txt
echo "ip_forward"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.ip_forward  >>`hostname`_Ubuntu.txt
echo "conf.all.send_redirects"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.all.send_redirects  >>`hostname`_Ubuntu.txt
echo "conf.default.send_redirects"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.default.send_redirects  >>`hostname`_Ubuntu.txt
echo "conf.all.accept_source_route"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.all.accept_source_route  >>`hostname`_Ubuntu.txt
echo "conf.default.accept_source_route"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.default.accept_source_route  >>`hostname`_Ubuntu.txt
echo "conf.all.accept_redirects"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.all.accept_redirects  >>`hostname`_Ubuntu.txt
echo "conf.default.accept_redirects"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.default.accept_redirects  >>`hostname`_Ubuntu.txt
echo "conf.all.secure_redirects"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.all.secure_redirects  >>`hostname`_Ubuntu.txt
echo "conf.default.secure_redirects"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.default.secure_redirects  >>`hostname`_Ubuntu.txt
echo "conf.all.log_martians"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.all.log_martians  >>`hostname`_Ubuntu.txt
echo "conf.default.log_martians"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.default.log_martians  >>`hostname`_Ubuntu.txt
echo "icmp_echo_ignore_broadcasts"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.icmp_echo_ignore_broadcasts  >>`hostname`_Ubuntu.txt
echo "icmp_ignore_bogus_error_responses"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.icmp_ignore_bogus_error_responses  >>`hostname`_Ubuntu.txt
echo "conf.all.rp_filter"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.all.rp_filter  >>`hostname`_Ubuntu.txt
echo "conf.default.rp_filter"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.conf.default.rp_filter  >>`hostname`_Ubuntu.txt
echo "tcp_syncookies"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.tcp_syncookies  >>`hostname`_Ubuntu.txt
echo "tcp_max_syn_backlog"  >>`hostname`_Ubuntu.txt
/sbin/sysctl net.ipv4.tcp_max_syn_backlog  >>`hostname`_Ubuntu.txt
echo "Ubuntu _49_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _50 - Find SUID and GUID System Executables"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _50_STARTS"  >>`hostname`_Ubuntu.txt
echo "SUID System Executables"  >>`hostname`_Ubuntu.txt
# for i in `/bin/egrep '(ext3|ext2)' /etc/fstab | /bin/awk '{print $2}'` 
# do 
# /usr/bin/find $i -xdev -type f -perm -4000 -print 
# done
find / -perm +4000  >>`hostname`_Ubuntu.txt
echo "GUID System Executables"  >>`hostname`_Ubuntu.txt
# for i in `/bin/egrep '(ext3|ext2)' /etc/fstab | /bin/awk '{print $2}'` 
# do 
# /usr/bin/find $i -xdev -type f -perm -2000 -print 
# done
find / -perm +2000  >>`hostname`_Ubuntu.txt
echo "Ubuntu _50_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _51 - Legacy Entries"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _51_STARTS"  >>`hostname`_Ubuntu.txt
echo "Legacy Entries in /etc/passwd"  >>`hostname`_Ubuntu.txt
/bin/grep '^+:' /etc/passwd  >>`hostname`_Ubuntu.txt
echo "Legacy Entries in /etc/shadow"  >>`hostname`_Ubuntu.txt
/bin/grep '^+:' /etc/shadow  >>`hostname`_Ubuntu.txt
echo "Legacy Entries in /etc/group"  >>`hostname`_Ubuntu.txt
/bin/grep '^+:' /etc/group  >>`hostname`_Ubuntu.txt
echo "Ubuntu _51_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _52 - Modify UID's of users with duplicate root UID"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _52_STARTS"  >>`hostname`_Ubuntu.txt
cat /etc/passwd | grep ':x:0'  >>`hostname`_Ubuntu.txt
echo "Ubuntu _52_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _53 - Find World Writable Files"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _53_STARTS"  >>`hostname`_Ubuntu.txt
echo "World Writable Files"  >>`hostname`_Ubuntu.txt
# for i in `/bin/egrep '(ext4|ext3|ext2)' /etc/fstab | /bin/awk '{print $2}'`
# do 
# /usr/bin/find $i -xdev -type f -perm -0002 -print 
# done
find / -xdev -type f -perm -0002 -print  >>`hostname`_Ubuntu.txt
echo "Ubuntu _53_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _54 - Find Un-owned and Un-grouped Files and Directories"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _54_STARTS"  >>`hostname`_Ubuntu.txt
echo "Un-owned Files and Directories"  >>`hostname`_Ubuntu.txt
# for i in `/bin/egrep '(ext3|ext2)' /etc/fstab | /bin/awk '{print $2}'` 
# do 
# /usr/bin/find $i -xdev -type f -o -type d -nouser -print 
# done
find / -xdev -type f -o -type d -nouser -print  >>`hostname`_Ubuntu.txt
echo "Un-grouped Files and Directories"  >>`hostname`_Ubuntu.txt
# for i in `/bin/egrep '(ext3|ext2)' /etc/fstab | /bin/awk '{print $2}'` 
# do 
# /usr/bin/find $i -xdev -type f -o -type d -nogroup -print 
# done
find / -xdev -type f -o -type d -nogroup -print  >>`hostname`_Ubuntu.txt
echo "Ubuntu _54_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _55 - Verify System File Permissions"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _55_STARTS"  >>`hostname`_Ubuntu.txt
echo "Permission and Ownership on /etc/passwd"  >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/passwd  >>`hostname`_Ubuntu.txt
echo "Permission and Ownership on /etc/shadow"  >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/shadow  >>`hostname`_Ubuntu.txt
echo "Permission and Ownership on /etc/gshadow"  >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/gshadow  >>`hostname`_Ubuntu.txt
echo "Permission and Ownership on /etc/group"  >>`hostname`_Ubuntu.txt
/bin/ls -l /etc/group  >>`hostname`_Ubuntu.txt
echo "Ubuntu _55_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _56 - Collect System Administrator Actions (sudolog)"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _56_STARTS"  >>`hostname`_Ubuntu.txt
grep actions /etc/audit/audit.rules  >>`hostname`_Ubuntu.txt
echo "Ubuntu _56_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _57 - Set Default umask for Users"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _57_STARTS"  >>`hostname`_Ubuntu.txt
echo "UMASK in /etc/bashrc"  >>`hostname`_Ubuntu.txt
cat /etc/bashrc | grep umask | grep -v "#"  >>`hostname`_Ubuntu.txt
echo "UMASK in /etc/profile"  >>`hostname`_Ubuntu.txt
cat /etc/profile | grep umask | grep -v "#"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _57_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _58 - User home directory permission is not secured"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _58_STARTS"  >>`hostname`_Ubuntu.txt
awk -F: '( $3 >= 500 ) { print $6 }' /etc/passwd > t.txt
for x in `cat t.txt`;do ls -ld $x ;done >>`hostname`_Ubuntu.txt
echo "Ubuntu _58_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
rm t.txt  >>`hostname`_Ubuntu.txt
echo "Ubuntu _59 - Check Groups in /etc/passwd"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _59_STARTS"  >>`hostname`_Ubuntu.txt
echo "Contents in /etc/passwd file"  >>`hostname`_Ubuntu.txt
cat /etc/passwd | grep -v "#"  >>`hostname`_Ubuntu.txt
echo "Contents in /etc/group file"  >>`hostname`_Ubuntu.txt
cat /etc/group | grep -v "#"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _59_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _60 - Check for Presence and permission of User .netrc Files"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _60_STARTS"  >>`hostname`_Ubuntu.txt
find / -name .netrc -ls  >>`hostname`_Ubuntu.txt
echo "Ubuntu _60_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _61 - Check for Presence of User .forward Files"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _61_STARTS"  >>`hostname`_Ubuntu.txt
find / -name .forward -ls  >>`hostname`_Ubuntu.txt
echo "Ubuntu _61_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _62 - Check for Presence of User .rhosts Files"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _62_STARTS"  >>`hostname`_Ubuntu.txt
find / -name .rhosts -ls  >>`hostname`_Ubuntu.txt
echo "Ubuntu _62_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _63 - Check User Dot File Permissions"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _63_STARTS"  >>`hostname`_Ubuntu.txt
find / -name .[A-Za-z0-9]* -ls  >>`hostname`_Ubuntu.txt
echo "Ubuntu _63_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _73 - Immutable bit"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _73_STARTS"  >>`hostname`_Ubuntu.txt
echo "Immutable bit for all the files and folders inside etc folder"  >>`hostname`_Ubuntu.txt
lsattr -R /etc/*  >>`hostname`_Ubuntu.txt
echo "Ubuntu _73_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _74 - NTP Setting"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _74_STARTS"  >>`hostname`_Ubuntu.txt
echo "NTP Service Status"  >>`hostname`_Ubuntu.txt
chkconfig --list | grep ntp  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "NTPD proccess status"  >>`hostname`_Ubuntu.txt
cat /etc/sysconfig/ntpd | grep ntp:ntp | grep -v "#"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "NTPD configuration details"  >>`hostname`_Ubuntu.txt
cat /etc/ntp.conf | grep ^server | grep -v "#"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
cat /etc/ntp.conf | grep ^restrict | grep -v "#"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _74_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt
echo "Ubuntu _75 - USB Disabled"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _75_STARTS"  >>`hostname`_Ubuntu.txt
echo "Rule 1"  >>`hostname`_Ubuntu.txt
cat /etc/modprobe.d/blacklist | grep "blacklist usb_storage"  >>`hostname`_Ubuntu.txt
echo "Rule 2"  >>`hostname`_Ubuntu.txt
ls -l /lib/modules/$(uname -r)/kernel/drivers/usb/storage/usb-storage.ko  >>`hostname`_Ubuntu.txt
echo "Rule 3"  >>`hostname`_Ubuntu.txt
cat /etc/udev/rules.d/ignore_usb_storage.rule | grep "ACTION" | grep "bus" | grep "DRIVER" | grep "OPTIONS"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _75_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt

echo "Ubuntu _76 - Ensure default deny firewall policy"  >>`hostname`_Ubuntu.txt
echo "Ubuntu _76_STARTS"  >>`hostname`_Ubuntu.txt
iptables -L  >>`hostname`_Ubuntu.txt
echo "Ubuntu _76_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt

echo "Ubuntu _77 -  Ensure loopback traffic is configured "  >>`hostname`_Ubuntu.txt
echo "Ubuntu _77_STARTS"  >>`hostname`_Ubuntu.txt
iptables -L INPUT -v -n  >>`hostname`_Ubuntu.txt
iptables -L OUTPUT -v -n  >>`hostname`_Ubuntu.txt
echo "Ubuntu _77_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt

echo "Ubuntu _78 -  Ensure events that modify the system's Mandatory Access Controls are collected "  >>`hostname`_Ubuntu.txt
echo "Ubuntu _78_STARTS"  >>`hostname`_Ubuntu.txt
grep MAC-policy /etc/audit/audit.rules  >>`hostname`_Ubuntu.txt
auditctl -l | grep MAC-policy  >>`hostname`_Ubuntu.txt
grep MAC-policy /etc/audit/audit.rules >>`hostname`_Ubuntu.txt
grep MAC-policy /etc/audit/audit.rules >>`hostname`_Ubuntu.txt
auditctl -l | grep MAC-policy >>`hostname`_Ubuntu.txt
echo "Ubuntu _78_ENDS"  >>`hostname`_Ubuntu.txt
echo  >>`hostname`_Ubuntu.txt


echo "--------------END OF OUTPUT--------------" >>`hostname`_Ubuntu.txt
