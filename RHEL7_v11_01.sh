#!/bin/bash
clear
echo "Redhat 7.x Audit Script" >>`hostname`_Compliance.txt
echo -e "=============================\n\n" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "2.1 File System Configuration" >>`hostname`_Compliance.txt
ls -ld /tmp >>`hostname`_Compliance.txt
ls -ld /var/tmp >>`hostname`_Compliance.txt
ls -ld /dev/shm >>`hostname`_Compliance.txt
echo "=============================" >>`hostname`_Compliance.txt
cat /etc/fstab | grep nodev >>`hostname`_Compliance.txt
echo "=============================" >>`hostname`_Compliance.txt
modprobe -n -v cramfs >>`hostname`_Compliance.txt
modprobe -n -v freevxfs  >>`hostname`_Compliance.txt
modprobe -n -v jffs2 >>`hostname`_Compliance.txt
modprobe -n -v hfs >>`hostname`_Compliance.txt
modprobe -n -v hfsplus >>`hostname`_Compliance.txt
modprobe -n -v squashfs >>`hostname`_Compliance.txt
echo "=============================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "2.2. Configure Software Updates" >>`hostname`_Compliance.txt
echo "=============================" >>`hostname`_Compliance.txt
grep ^gpgcheck /etc/yum.conf >>`hostname`_Compliance.txt
echo "=============================" >>`hostname`_Compliance.txt

echo "2.3. Advanced Intrusion Detection Environment (AIDE)" >>`hostname`_Compliance.txt
echo "======================================================" >>`hostname`_Compliance.txt
rpm -q aide >>`hostname`_Compliance.txt
echo "======================================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "3.1. Remove Legacy Services" >>`hostname`_Compliance.txt
echo "=============================" >>`hostname`_Compliance.txt
echo "telnet-server" >>`hostname`_Compliance.txt
systemctl is-enabled telnet.socket >>`hostname`_Compliance.txt
rpm -q telnet  >>`hostname`_Compliance.txt
echo "rsh-server" >>`hostname`_Compliance.txt
echo "rsh.socket is" >>`hostname`_Compliance.txt
systemctl is-enabled rsh.socket >>`hostname`_Compliance.txt
echo "rlogin.socket is" >>`hostname`_Compliance.txt
systemctl is-enabled rlogin.socket >>`hostname`_Compliance.txt
echo "rexec.socket is" >>`hostname`_Compliance.txt
systemctl is-enabled rexec.socket >>`hostname`_Compliance.txt
rpm -q rsh  >>`hostname`_Compliance.txt
echo "NIS Client" >>`hostname`_Compliance.txt
rpm -q ypbind >>`hostname`_Compliance.txt
echo "tftp" >>`hostname`_Compliance.txt
chkconfig --list >>`hostname`_Compliance.txt
rpm -q tftp | grep "tftp" >>`hostname`_Compliance.txt
echo "tftp.socket is" >>`hostname`_Compliance.txt
systemctl is-enabled tftp.socket >>`hostname`_Compliance.txt
rpm -q tftp-server >>`hostname`_Compliance.txt
echo "talk is" >>`hostname`_Compliance.txt
systemctl is-enabled talk >>`hostname`_Compliance.txt
rpm -q talk >>`hostname`_Compliance.txt
echo "talk-server is" >>`hostname`_Compliance.txt
systemctl is-enabled ntalk >>`hostname`_Compliance.txt
echo "xinetd is" >>`hostname`_Compliance.txt
systemctl is-enabled xinetd >>`hostname`_Compliance.txt
echo "chargen services" >>`hostname`_Compliance.txt
chkconfig --list | grep "chargen-dgram" >>`hostname`_Compliance.txt
chkconfig --list | grep "chargen-stream" >>`hostname`_Compliance.txt
echo "daytime-dgram" >>`hostname`_Compliance.txt
chkconfig --list | grep "daytime-dgram"  >>`hostname`_Compliance.txt
chkconfig --list | grep "daytime-stream"  >>`hostname`_Compliance.txt
echo "echo" >>`hostname`_Compliance.txt
chkconfig --list | grep "echo-dgram"  >>`hostname`_Compliance.txt
chkconfig --list | grep "echo-stream" >>`hostname`_Compliance.txt
echo "if output is available then xorg is non-compliant" >>`hostname`_Compliance.txt
rpm -qa xorg-x11* >>`hostname`_Compliance.txt
echo "avahi is" >>`hostname`_Compliance.txt
systemctl is-enabled avahi-demon >>`hostname`_Compliance.txt
echo "CPUS" >>`hostname`_Compliance.txt
systemctl is-enabled CUPS >>`hostname`_Compliance.txt
echo "DHCP" >>`hostname`_Compliance.txt
systemctl is-enabled dhcpd >>`hostname`_Compliance.txt
echo "LDAP" >>`hostname`_Compliance.txt
systemctl is-enabled sldap >>`hostname`_Compliance.txt
echo "NFS" >>`hostname`_Compliance.txt
systemctl is-enabled nfs >>`hostname`_Compliance.txt
echo "NFS" >>`hostname`_Compliance.txt
systemctl is-enabled nfs-server >>`hostname`_Compliance.txt
echo "rpcbind" >>`hostname`_Compliance.txt
systemctl is-enabled rpcbind >>`hostname`_Compliance.txt
echo "DNS" >>`hostname`_Compliance.txt
systemctl is-enabled named >>`hostname`_Compliance.txt
echo "ftp" >>`hostname`_Compliance.txt
systemctl is-enabled vsftpd >>`hostname`_Compliance.txt
echo "http" >>`hostname`_Compliance.txt
systemctl is-enabled httpd >>`hostname`_Compliance.txt
echo "dovecot" >>`hostname`_Compliance.txt
systemctl is-enabled dovecot >>`hostname`_Compliance.txt
echo "samba" >>`hostname`_Compliance.txt
systemctl is-enabled smb >>`hostname`_Compliance.txt
echo "Http proxy server" >>`hostname`_Compliance.txt
systemctl is-enabled squid >>`hostname`_Compliance.txt
echo "snmp" >>`hostname`_Compliance.txt
systemctl is-enabled snmpd >>`hostname`_Compliance.txt


echo "4.1. Configure Network Time Protocol" >>`hostname`_Compliance.txt
echo "=====================================" >>`hostname`_Compliance.txt
grep "^restrict" /etc/ntp.conf >>`hostname`_Compliance.txt
echo "=====================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "4.2. Configure Mail Transfer Agent for Local-Only Mode" >>`hostname`_Compliance.txt
echo "=======================================================" >>`hostname`_Compliance.txt
netstat -an | grep LIST | grep ":25[[:space:]]" >>`hostname`_Compliance.txt
echo "=======================================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "4.3. Check for Unconfined Daemons" >>`hostname`_Compliance.txt
echo "==================================" >>`hostname`_Compliance.txt
ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{ print $NF }' >>`hostname`_Compliance.txt
echo "==================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "5.1 Modify Network Parameters" >>`hostname`_Compliance.txt
echo -e "================================" >>`hostname`_Compliance.txt
sysctl net.ipv4.ip_forward >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.all.send_redirects  >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.default.send_redirects  >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.all.accept_source_route >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.default.accept_source_route >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.all.accept_redirects >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.default.accept_redirects >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.all.secure_redirects >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.all.log_martians >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.default.log_martians  >>`hostname`_Compliance.txt
sysctl net.ipv4.icmp_echo_ignore_broadcasts >>`hostname`_Compliance.txt
sysctl net.ipv4.icmp_ignore_bogus_error_responses >>`hostname`_Compliance.txt
sysctl net.ipv4.conf.all.rp_filter >>`hostname`_Compliance.txt
echo "==================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "5.2 IPv6" >>`hostname`_Compliance.txt
echo "============" >>`hostname`_Compliance.txt
sysctl net.ipv6.conf.all.accept_ra >>`hostname`_Compliance.txt
sysctl net.ipv6.conf.default.accept_ra >>`hostname`_Compliance.txt
echo "================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt


echo "5.3 Install TCP Wrappers" >>`hostname`_Compliance.txt
echo "=========================" >>`hostname`_Compliance.txt
rpm -q tcp_wrappers >>`hostname`_Compliance.txt
echo "=========================" >>`hostname`_Compliance.txt
cat /etc/hosts.allow >>`hostname`_Compliance.txt
echo "=========================" >>`hostname`_Compliance.txt
cat /etc/hosts.deny >>`hostname`_Compliance.txt
echo "=========================" >>`hostname`_Compliance.txt
stat /etc/hosts.allow >>`hostname`_Compliance.txt
echo "=========================" >>`hostname`_Compliance.txt
stat /etc/hosts.deny >>`hostname`_Compliance.txt
echo "=========================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "5.4 Uncommon Network Protocols" >>`hostname`_Compliance.txt
echo "==============================" >>`hostname`_Compliance.txt
cat /etc/modprobe.d/CIS.conf >>`hostname`_Compliance.txt
echo "==============================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "5.5 Enable Server Firewall" >>`hostname`_Compliance.txt
echo "==================" >>`hostname`_Compliance.txt
systemctl status firewalldn >>`hostname`_Compliance.txt
echo "==================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "6.1 Configure rsyslog" >>`hostname`_Compliance.txt
echo "======================" >>`hostname`_Compliance.txt
rpm -q rsyslog >>`hostname`_Compliance.txt
rpm -q syslog-ng >>`hostname`_Compliance.txt
echo "rsyslog enable/disable" >>`hostname`_Compliance.txt
systemctl is-enabled rsyslog >>`hostname`_Compliance.txt
ls -l /var/log/ >>`hostname`_Compliance.txt
echo "=====================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "6.2. Configure System Accounting" >>`hostname`_Compliance.txt
echo "=================================" >>`hostname`_Compliance.txt
systemctl status auditd >>`hostname`_Compliance.txt
echo "=================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "7.1. Restrict access to Cron" >>`hostname`_Compliance.txt
echo "==============================" >>`hostname`_Compliance.txt
stat /etc/crontab >>`hostname`_Compliance.txt
echo "==============================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "7.2. Configure SSH" >>`hostname`_Compliance.txt
echo "==============================" >>`hostname`_Compliance.txt
echo "Protocol 2" >>`hostname`_Compliance.txt
grep "^Protocol" /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "LogLevel INFO" >>`hostname`_Compliance.txt
grep "^LogLevel" /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "chown root:root /etc/ssh/sshd_config and chmod 600 /etc/ssh/sshd_config" >>`hostname`_Compliance.txt
stat /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "grep "^X11Forwarding" /etc/ssh/sshd_config" >>`hostname`_Compliance.txt
echo "MaxAuthTries 3" >>`hostname`_Compliance.txt
grep "^MaxAuthTries" /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "IgnoreRhosts yes" >>`hostname`_Compliance.txt
grep "^IgnoreRhosts" /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "HostbasedAuthentication no" >>`hostname`_Compliance.txt
grep "^HostbasedAuthentication" /etc/ssh/sshd_config
echo "PermitEmptyPassword no" >>`hostname`_Compliance.txt
grep "^PermitEmptyPasswords" /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "PermitUserEnvironment no" >>`hostname`_Compliance.txt
grep PermitUserEnvironment /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "MACs hmac-sha2-512-etm@openssh.com,hmac-sha2-256-etm@openssh.com,umac-128-etm@openssh.com,hmac-sha2-512,hmac-sha2-256,umac-128@openssh.com" >>`hostname`_Compliance.txt
grep "MACs" /etc/ssh/sshd_config  >>`hostname`_Compliance.txt
echo "ClientAliveInterval 300" >>`hostname`_Compliance.txt
grep "^ClientAliveInterval" /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "ClientAliveCountMax 0" >>`hostname`_Compliance.txt
grep "^ClientAliveCountMax" /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "Set the banner as per SBI Banks policy" >>`hostname`_Compliance.txt
echo "-------------------------------" >>`hostname`_Compliance.txt
grep "^Banner" /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "-------------------------------" >>`hostname`_Compliance.txt
grep "^Banner" /etc/issue.net >>`hostname`_Compliance.txt
echo "-------------------------------" >>`hostname`_Compliance.txt
grep "^Banner" /etc/issue >>`hostname`_Compliance.txt
echo "====================================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "7.3. Configure PAM" >>`hostname`_Compliance.txt
echo "==================" >>`hostname`_Compliance.txt
echo "============IF THE SERVER IS INTEGRATED WITH PIM SOLUTION and all users password is vaulted then control will be not applicable==================" >>`hostname`_Compliance.txt
authconfig --test | grep hashing >>`hostname`_Compliance.txt
echo "--/etc/pam.d/password-auth--" >>`hostname`_Compliance.txt
cat /etc/pam.d/password-auth >>`hostname`_Compliance.txt
echo "--/etc/pam.d/system-auth--" >>`hostname`_Compliance.txt
cat /etc/pam.d/system-auth >>`hostname`_Compliance.txt
echo "--/etc/security/pwquality.conf--" >>`hostname`_Compliance.txt
cat /etc/security/pwquality.conf >>`hostname`_Compliance.txt
echo "--/etc/pam.d/password-auth--" >>`hostname`_Compliance.txt
cat /etc/pam.d/password-auth >>`hostname`_Compliance.txt
echo "--/etc/pam.d/system-auth--" >>`hostname`_Compliance.txt
cat /etc/pam.d/system-auth >>`hostname`_Compliance.txt
echo "=======================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "7.4. Restrict Access to the su Command" >>`hostname`_Compliance.txt
echo "======================================" >>`hostname`_Compliance.txt
echo "If server is integrated with PIM solution and all users password is n control will be not applicable." >>`hostname`_Compliance.txt
grep pam_wheel.so /etc/pam.d/su >>`hostname`_Compliance.txt
echo "=======================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "7.5.Ensure permissions on bootloader config are configured" >>`hostname`_Compliance.txt
echo "==========================================================" >>`hostname`_Compliance.txt
echo "Run the following commands and verify Uid and Gid are both 0/root and Access does not grant permissions to group or other:" >>`hostname`_Compliance.txt
stat /boot/grub2/grub.cfg  >>`hostname`_Compliance.txt
echo "Access: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)" >>`hostname`_Compliance.txt
stat /boot/grub2/user.cfg  >>`hostname`_Compliance.txt
echo "Access: (0600/-rw-------) Uid: ( 0/ root) Gid: ( 0/ root)" >>`hostname`_Compliance.txt

echo "7.6 Disable Automating" >>`hostname`_Compliance.txt
echo "Run the following command and verify result is not enabled:" >>`hostname`_Compliance.txt
systemctl is-enabled autofs  >>`hostname`_Compliance.txt
echo "disabled"	 >>`hostname`_Compliance.txt
echo "======================" >>`hostname`_Compliance.txt

echo "7.8 Ensure audit logs are not automatically deleted" >>`hostname`_Compliance.txt
echo "===================================================" >>`hostname`_Compliance.txt
echo "Run the following command and verify output matches:" >>`hostname`_Compliance.txt
grep max_log_file_action /etc/audit/auditd.conf  >>`hostname`_Compliance.txt
echo "max_log_file_action = keep_logs" >>`hostname`_Compliance.txt
echo "===============================" >>`hostname`_Compliance.txt

echo "7.9 Ensure no world writable files exist" >>`hostname`_Compliance.txt
echo "========================================" >>`hostname`_Compliance.txt
echo "Run the following command and verify no files are returned:" >>`hostname`_Compliance.txt
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 >>`hostname`_Compliance.txt
echo "The command above only searches local filesystems, there may still be compromised items on network mounted partitions." >>`hostname`_Compliance.txt
echo "The following command can be run manually for individual partitions if needed:" >>`hostname`_Compliance.txt
echo "# find <partition> -xdev -type f -perm -0002" >>`hostname`_Compliance.txt


echo "8.1. Set Shadow Password Suite Parameters" >>`hostname`_Compliance.txt
echo "==========================================" >>`hostname`_Compliance.txt
grep PASS_MAX_DAYS /etc/login.defs >>`hostname`_Compliance.txt
grep PASS_MIN_DAYS /etc/login.defs >>`hostname`_Compliance.txt
grep PASS_WARN_AGE /etc/login.defs >>`hostname`_Compliance.txt
echo "==========================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "8.2. Disable System Accounts" >>`hostname`_Compliance.txt
echo "==========================================" >>`hostname`_Compliance.txt
egrep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<1000 && $7!="/sbin/nologin" && $7!="/bin/false") {print}' >>`hostname`_Compliance.txt
echo "=========================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "8.3. Set Default Group for root Account" >>`hostname`_Compliance.txt
echo "========================================" >>`hostname`_Compliance.txt
echo "usermod -g 0 root" >>`hostname`_Compliance.txt
grep "^root:" /etc/passwd | cut -f4 -d: >>`hostname`_Compliance.txt
echo "========================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "8.4. Set Default umask for Users" >>`hostname`_Compliance.txt
echo "========================================" >>`hostname`_Compliance.txt
echo "umask 027" >>`hostname`_Compliance.txt
grep "umask" /etc/bashrc  >>`hostname`_Compliance.txt
echo "=========================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "8.5. Lock Inactive User Accounts" >>`hostname`_Compliance.txt
echo "================================" >>`hostname`_Compliance.txt
echo "The 7th field of /etc/shadow directory should be 35 for all users except “root” with a password." >>`hostname`_Compliance.txt
useradd -D | grep INACTIVE >>`hostname`_Compliance.txt
echo "===============================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "9.1. Set Warning Banner for Standard Login Services" >>`hostname`_Compliance.txt
echo "====================================================" >>`hostname`_Compliance.txt
stat /etc/motd >>`hostname`_Compliance.txt
echo "=====================================================" >>`hostname`_Compliance.txt
cat /etc/issue >>`hostname`_Compliance.txt
echo "=====================================================" >>`hostname`_Compliance.txt
cat /etc/issue.net >>`hostname`_Compliance.txt
echo "=====================================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "9.2. Remove OS Information from Login Warning Banners" >>`hostname`_Compliance.txt
echo "=====remove any lines containing \m, \r, \s or \v======" >>`hostname`_Compliance.txt
cat /etc/issue  >>`hostname`_Compliance.txt
echo "=======================================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "9.3. Set GNOME Warning Banner" >>`hostname`_Compliance.txt
echo "This control is only applicable, if the department is used GUI logging service enabled on the server." >>`hostname`_Compliance.txt
echo "======/etc/dconf/db/gdm.d/01-banner-message=======" >>`hostname`_Compliance.txt
cat /etc/dconf/db/gdm.d/01-banner-message >>`hostname`_Compliance.txt
echo "==================================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "10.1. Verify System File Permissions" >>`hostname`_Compliance.txt
echo "====================================" >>`hostname`_Compliance.txt
stat /etc/passwd >>`hostname`_Compliance.txt
echo "-------------------------------------" >>`hostname`_Compliance.txt
stat /etc/shadow >>`hostname`_Compliance.txt
echo "-------------------------------------" >>`hostname`_Compliance.txt
stat /etc/group >>`hostname`_Compliance.txt
echo "-------------------------------------" >>`hostname`_Compliance.txt
stat /etc/gshadow >>`hostname`_Compliance.txt
echo "-------------------------------------" >>`hostname`_Compliance.txt
stat /etc/passwd- >>`hostname`_Compliance.txt
echo "-------------------------------------" >>`hostname`_Compliance.txt
stat /etc/shadow- >>`hostname`_Compliance.txt
echo "-------------------------------------" >>`hostname`_Compliance.txt
stat /etc/group- >>`hostname`_Compliance.txt
echo "-------------------------------------" >>`hostname`_Compliance.txt
stat /etc/gshadow- >>`hostname`_Compliance.txt
echo "========================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "10.2. Review User and Group Settings" >>`hostname`_Compliance.txt
echo "====================================" >>`hostname`_Compliance.txt
echo "The 2th field of /etc/shadow directory should not by blank for any active users" >>`hostname`_Compliance.txt
cat /etc/shadow >>`hostname`_Compliance.txt
echo "====================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "11.1. Restrict Cipher list" >>`hostname`_Compliance.txt
echo "==========================" >>`hostname`_Compliance.txt
cat /etc/ssh/sshd_config >>`hostname`_Compliance.txt
echo "==========================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

echo "11.3. Disable weak encryption protocol" >>`hostname`_Compliance.txt
echo "========================================" >>`hostname`_Compliance.txt
echo "Weak encrypted protocol such as SSL v1, v2 and v3 must be disabled on the server" >>`hostname`_Compliance.txt
echo "If the web service is disabled on the server then control will be not applicable." >>`hostname`_Compliance.txt
/etc/httpd/conf.d/ssl.conf >>`hostname`_Compliance.txt
echo "========================================" >>`hostname`_Compliance.txt
echo -e "\n\n" >>`hostname`_Compliance.txt

