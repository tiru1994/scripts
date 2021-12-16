#!/bin/bash
clear
echo "CentOS 7.x Audit Script"
echo -e "=============================\n\n"
echo -e "\n\n"
echo "2.1 File System Configuration"
ls -ld /tmp
ls -ld /var/tmp
ls -ld /dev/shm
echo "============================="
cat /etc/fstab | grep nodev
echo "============================="
modprobe -n -v cramfs
modprobe -n -v freevxfs 
modprobe -n -v jffs2 
modprobe -n -v hfs 
modprobe -n -v hfsplus 
modprobe -n -v squashfs 
echo "============================="
echo -e "\n\n"
echo "2.2. Configure Software Updates"
echo "============================="
grep ^gpgcheck /etc/yum.conf
yum list installed
echo "============================="
echo "2.3. Advanced Intrusion Detection Environment (AIDE)"
echo "======================================================"
rpm -q aide
echo "======================================================"
echo -e "\n\n"
echo "3.1. Remove Legacy Services"
echo "============================="
echo "telnet-server"
systemctl is-enabled telnet.socket
rpm -q telnet 
echo "rsh-server"
echo "rsh.socket is"
systemctl is-enabled rsh.socket
echo "rlogin.socket is"
systemctl is-enabled rlogin.socket
echo "rexec.socket is"
systemctl is-enabled rexec.socket
rpm -q rsh 
echo "NIS Client"
rpm -q ypbind 
echo "tftp"
chkconfig --list
rpm -q tftp | grep "tftp"
echo "tftp.socket is"
systemctl is-enabled tftp.socket 
rpm -q tftp-server
echo "talk is"
systemctl is-enabled talk 
rpm -q talk 
echo "talk-server is"
systemctl is-enabled ntalk
echo "xinetd is"
systemctl is-enabled xinetd
echo "chargen services"
chkconfig --list | grep "chargen-dgram"
chkconfig --list | grep "chargen-stream"
echo "daytime-dgram"
chkconfig --list | grep "daytime-dgram" 
chkconfig --list | grep "daytime-stream" 
echo "echo"
chkconfig --list | grep "echo-dgram" 
chkconfig --list | grep "echo-stream" 
echo "if output is available then xorg is non-compliant"
rpm -qa xorg-x11*
echo "avahi is"
systemctl is-enabled avahi-demon
echo "CPUS"
systemctl is-enabled CUPS 
echo "DHCP"
systemctl is-enabled dhcpd
echo "LDAP"
systemctl is-enabled sldap
echo "NFS"
systemctl is-enabled nfs
echo "NFS"
systemctl is-enabled nfs-server
echo "rpcbind"
systemctl is-enabled rpcbind
echo "DNS"
systemctl is-enabled named
echo "ftp"
systemctl is-enabled vsftpd
echo "http"
systemctl is-enabled httpd
echo "dovecot"
systemctl is-enabled dovecot 
echo "samba"
systemctl is-enabled smb
echo "Http proxy server"
systemctl is-enabled squid
echo "snmp"
systemctl is-enabled snmpd
echo "======================================="
echo "3.2. Ensure core dumps are restricted"
echo "====================================="
grep "hard core" /etc/security/limits.conf
sysctl fs.suid_dumpable 
grep "fs\.suid_dumpable" /etc/sysctl.conf 
echo "======================================="
echo "3.3. Ensure prelink is disabled"
echo "====================================="
rpm -q prelink
echo "======================================="
echo "4.1. Configure Network Time Protocol"
echo "====================================="
grep "^restrict" /etc/ntp.conf
echo "====================================="
echo -e "\n\n"
echo "4.2. Configure Mail Transfer Agent for Local-Only Mode"
echo "======================================================="
netstat -an | grep LIST | grep ":25[[:space:]]"
echo "======================================================="
echo -e "\n\n"
echo "4.3. Check for Unconfined Daemons"
echo "=================================="
ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{ print $NF }'
echo "=================================="
echo -e "\n\n"
echo "5.1 Modify Network Parameters"
echo -e "================================"
sysctl net.ipv4.ip_forward 
sysctl net.ipv4.conf.all.send_redirects 
sysctl net.ipv4.conf.default.send_redirects 
sysctl net.ipv4.conf.all.accept_source_route 
sysctl net.ipv4.conf.default.accept_source_route 
sysctl net.ipv4.conf.all.accept_redirects 
sysctl net.ipv4.conf.default.accept_redirects 
sysctl net.ipv4.conf.all.secure_redirects
sysctl net.ipv4.conf.all.log_martians
sysctl net.ipv4.conf.default.log_martians 
sysctl net.ipv4.icmp_echo_ignore_broadcasts
sysctl net.ipv4.icmp_ignore_bogus_error_responses 
sysctl net.ipv4.conf.all.rp_filter 
echo "=================================="
echo -e "\n\n"
echo "5.2 IPv6"
echo "============"
sysctl net.ipv6.conf.all.accept_ra
sysctl net.ipv6.conf.default.accept_ra
echo "================"
echo -e "\n\n"
echo "5.3 Install TCP Wrappers"
echo "========================="
rpm -q tcp_wrappers
echo "========================="
cat /etc/hosts.allow
echo "========================="
cat /etc/hosts.deny
echo "========================="
stat /etc/hosts.allow
echo "========================="
stat /etc/hosts.deny
echo "========================="
echo -e "\n\n"
echo "5.4 Uncommon Network Protocols"
echo "=============================="
cat /etc/modprobe.d/CIS.conf
echo "=============================="
echo -e "\n\n"
echo "5.5 Configure iptables"
echo "=================="
rpm -q iptables
echo "=================="
echo -e "\n\n"
echo "5.6. Ensure mounting of FAT filesystems is disabled"
echo "===================================================="
modprobe -n -v vfat
echo "===================="
echo "vfat"
lsmod |grep vfat
echo "output is empty = Compliant"
echo "======================================================"
echo -e "\n\n"
echo "6.1 Configure rsyslog"
echo "======================"
rpm -q rsyslog 
rpm -q syslog-ng 
echo "rsyslog enable/disable"
systemctl is-enabled rsyslog
ls -l /var/log/
echo "====================="
echo -e "\n\n"
echo "6.2. Configure System Accounting"
echo "================================="
systemctl status auditd
echo "================================="
echo -e "\n\n"
echo "7.1. Restrict access to Cron"
echo "=============================="
stat /etc/crontab
echo "=============================="
echo -e "\n\n"
echo "7.2. Configure SSH"
echo "=============================="
echo "Protocol 2"
grep "^Protocol" /etc/ssh/sshd_config
echo "LogLevel INFO"
grep "^LogLevel" /etc/ssh/sshd_config
echo "chown root:root /etc/ssh/sshd_config and chmod 600 /etc/ssh/sshd_config"
stat /etc/ssh/sshd_config
echo "grep "^X11Forwarding" /etc/ssh/sshd_config"
echo "MaxAuthTries 3"
grep "^MaxAuthTries" /etc/ssh/sshd_config
echo "IgnoreRhosts yes"
grep "^IgnoreRhosts" /etc/ssh/sshd_config
echo "HostbasedAuthentication no"
grep "^HostbasedAuthentication" /etc/ssh/sshd_config
echo "PermitEmptyPassword no"
grep "^PermitEmptyPasswords" /etc/ssh/sshd_config
echo "PermitUserEnvironment no"
grep PermitUserEnvironment /etc/ssh/sshd_config
echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com"
grep "MACs" /etc/ssh/sshd_config 
echo "ClientAliveInterval 300"
grep "^ClientAliveInterval" /etc/ssh/sshd_config
echo "ClientAliveCountMax 0"
grep "^ClientAliveCountMax" /etc/ssh/sshd_config
echo "Set the banner as per SBI Banks policy"
echo "-------------------------------"
grep "^Banner" /etc/ssh/sshd_config
echo "-------------------------------"
grep "^Banner" /etc/issue.net
echo "-------------------------------"
grep "^Banner" /etc/issue
echo "===================================================="
echo -e "\n\n"
echo "7.3. Configure PAM"
echo "=================="
echo "============IF THE SERVER IS INTEGRATED WITH PIM SOLUTION and all users password is vaulted then control will be not applicable=================="
authconfig --test | grep hashing
echo "--/etc/pam.d/password-auth--"
cat /etc/pam.d/password-auth
echo "--/etc/pam.d/system-auth--" 
cat /etc/pam.d/system-auth
echo "--/etc/security/pwquality.conf--"
cat /etc/security/pwquality.conf
echo "--/etc/pam.d/password-auth--"
cat /etc/pam.d/password-auth
echo "--/etc/pam.d/system-auth--"
cat /etc/pam.d/system-auth
echo "======================="
echo -e "\n\n"
echo "7.4. Restrict Access to the su Command"
echo "======================================"
echo "If server is integrated with PIM solution and all users password is n control will be not applicable."
grep pam_wheel.so /etc/pam.d/su
echo "======================================="
echo -e "\n\n"
echo "7.5. Ensure permissions on bootloader config are configured"
echo "==========================================================="
stat /boot/grub2/grub.cfg
stat /boot/grub2/user.cfg
echo "==================="
echo "7.6. Ensure bootloader password is set"
echo "======================================"
grep "^GRUB2_PASSWORD" /boot/grub2/grub.cfg
echo "======================================"
echo "7.7. Ensure local login warning banner is configured properly"
echo "============================================================="
cat /etc/issue
cat /etc/banner
cat /etc/motd
egrep '(\\v|\\r|\\m|\\s)' /etc/issue
echo "============================================================="
echo "7.8.Ensure login and logout events are collected"
echo "================================================"
grep logins /etc/audit/audit.rules
echo "================================================"
echo "7.9. Ensure session initiation information is collected"
echo "======================================================="
grep session /etc/audit/audit.rules
auditctl -l | grep session
echo "verify output for both matches"
grep logins /etc/audit/audit.rules
auditctl -l | grep logins
echo "Verify output of both matches:"
echo "=============================="
echo "7.10. Ensure system administrator actions (sudolog) are collected"
echo "================================================================="
grep actions /etc/audit/audit.rules
auditctl -l | grep actions
echo "============================="
echo "7.11. Ensure password expiration is 90 days or less"
echo "=================================================="
grep PASS_MAX_DAYS /etc/login.defs
egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1
chage --list 
echo "<user>"
echo "=================================================="
echo "7.12. Ensure minimum days between password changes is 7 or more"
echo "==============================================================="
grep PASS_MIN_DAYS /etc/login.defs
egrep ^[^:]+:[^\!*] /etc/shadow | cut -d: -f1
echo "<list of users>"
chage --list 
echo "<user>"
echo "Minimum number of days between password change "
echo "==============================================="
echo "7.13. Ensure users' dot files are not group or world writable"
echo "============================================================="
cat /etc/passwd | egrep -v '^(root|halt|sync|shutdown)' | awk -F: '($7 !="/sbin/nologin" && $7 != "/bin/false") { print $1 " " $6 }' | while read userdir; do
	if [ ! -d "$dir" ]; then
 		echo "The home directory ($dir) of user $user does not exist."
 	else
 		for file in $dir/.[A-Za-z0-9]*; do
 			if [ ! -h "$file" -a -f "$file" ]; then
 				fileperm=`ls -ld $file | cut -f1 -d" "`
 				if [ `echo $fileperm | cut -c6` != "-" ]; then
 					echo "Group Write permission set on file $file"
 				fi
 				if [ `echo $fileperm | cut -c9` != "-" ]; then
 					echo "Other Write permission set on file $file"
 				fi
 			fi
 		done
 	fi
done
echo "======================================================================="
echo "7.14. Ensure no duplicate group names exist"
echo "==========================================="

echo "Incomplete due to logic discrepancy"
cat /etc/group | cut -f1 -d":" | sort -n | uniq -c | while read x ; do 
	[ -z "${x}" ] && break 
	set - $x 
	if [ $1 -gt 1 ]; then 
		gids=`gawk -F: '($1 == n) { print $3 }' n=$2 /etc/group | xargs` 
		echo "Duplicate Group Name ($2): ${gids}"
	fi 
done
echo "======================================================================="
#cat /etc/passwd | cut -f3 -d":" | sort -n | uniq -c | while read x ; do 
#	[ -z "${x}" ] && break 
#	set - $x 
#	if [ $1 -gt 1 ]; then
#	 users=`awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | xargs` 
#	 echo "Duplicate UID ($2): ${users}" 
#	fi 
#done
echo "8.1. Set Shadow Password Suite Parameters"
echo "=========================================="
grep PASS_MAX_DAYS /etc/login.defs
grep PASS_MIN_DAYS /etc/login.defs
grep PASS_WARN_AGE /etc/login.defs
echo "=========================================="
echo -e "\n\n"
echo "8.2. Disable System Accounts"
echo "=========================================="
egrep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<1000 && $7!="/sbin/nologin" && $7!="/bin/false") {print}'
echo "========================================="
echo -e "\n\n"
echo "8.3. Set Default Group for root Account"
echo "========================================"
echo "usermod -g 0 root"
grep "^root:" /etc/passwd | cut -f4 -d:
echo "========================================"
echo -e "\n\n"
echo "8.4. Set Default umask for Users"
echo "========================================"
echo "umask 027"
grep "umask" /etc/bashrc 
echo "========================================="
echo -e "\n\n"
echo "8.5. Lock Inactive User Accounts"
echo "================================"
echo "The 7th field of /etc/shadow directory should be 35 for all users except “root” with a password."
useradd -D | grep INACTIVE
echo "==============================="
echo -e "\n\n"
echo "9.1. Set Warning Banner for Standard Login Services"
echo "===================================================="
stat /etc/motd
echo "====================================================="
cat /etc/issue
echo "====================================================="
cat /etc/issue.net
echo "====================================================="
echo -e "\n\n"
echo "9.2. Remove OS Information from Login Warning Banners"
echo "=====remove any lines containing \m, \r, \s or \v======"
cat /etc/issue 
echo "======================================================="
echo -e "\n\n"
echo "9.3. Set GNOME Warning Banner"
echo "This control is only applicable, if the department is used GUI logging service enabled on the server."
echo "======/etc/dconf/db/gdm.d/01-banner-message======="
cat /etc/dconf/db/gdm.d/01-banner-message
echo "=================================================="
echo -e "\n\n"
echo "10.1. Verify System File Permissions"
echo "===================================="
stat /etc/passwd
echo "-------------------------------------"
stat /etc/shadow
echo "-------------------------------------"
stat /etc/group
echo "-------------------------------------"
stat /etc/gshadow
echo "-------------------------------------"
stat /etc/passwd-
echo "-------------------------------------"
stat /etc/shadow-
echo "-------------------------------------"
stat /etc/group-
echo "-------------------------------------"
stat /etc/gshadow-
echo "========================================"
echo -e "\n\n"
echo "10.2. Review User and Group Settings"
echo "===================================="
echo "The 2th field of /etc/shadow directory should not by blank for any active users"
cat /etc/shadow
echo "===================================="
echo -e "\n\n"
echo "10.3. Ensure filesystem integrity is regularly checked"
echo "======================================================"
crontab -u root -l | grep aide 
grep -r aide /etc/cron.* /etc/crontab
echo "======================================================" 
echo "11.1. Restrict Cipher list"
echo "=========================="
cat /etc/ssh/sshd_config
echo "=========================="
echo -e "\n\n"
echo "11.3. Disable weak encryption protocol"
echo "========================================"
echo "Weak encrypted protocol such as SSL v1, v2 and v3 must be disabled on the server"
echo "If the web service is disabled on the server then control will be not applicable."
/etc/httpd/conf.d/ssl.conf
echo "========================================"
echo -e "\n\n"