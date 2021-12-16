# RHEL 8 script

#!/bin/sh
echo "######################################################################################" 		>>output.txt
echo "# Deloitte India RHEL8 Secure Configuration Review Script#" 			>> output.txt
echo "# Property of Deloitte Touche Tohmatsu India LLP 				       #"		 >> output.txt
echo "# Copyright (c) 2020 Deloitte Touche Tohmatsu India LLP           		       #" 			>> output.txt
echo "######################################################################################" 		>> output.txt
echo 										>>output.txt

echo "###########################Server Information###########################" 		>>output.txt
echo										>>output.txt
echo "Hostname"									>>output.txt
echo "--------"									>>output.txt
hostname										>>output.txt
echo										>>output.txt

echo "Timestamp"									>>output.txt
echo "---------"									>>output.txt
date										>>output.txt
echo										>>output.txt

#Banner										>>output.txt
echo "Operating System"								>>output.txt
echo "----------------"									>>output.txt
cat /etc/motd									>>output.txt
echo										>>output.txt
cat /etc/issue									>>output.txt
echo										>>output.txt

#IP Configuration									>>output.txt
echo "IP Address"									>>output.txt
echo "----------"									>>output.txt
/sbin/ifconfig -a|grep "inet addr"							>>output.txt
echo 										>>output.txt


echo "1. Install Updates, Patches and Additional Security Software" >>output.txt
echo 							 >>output.txt

echo "1.1 Ensure updates, patches, and additional security software are installed" >>output.txt
dnf check-update --security	 >>output.txt
echo 							 >>output.txt

echo "1.2 Ensure Red Hat Subscription Manager connection is configured" >>output.txt
subscription-manager identity	 >>output.txt
echo 							 >>output.txt

echo "1.3 Disable the rhnsd Daemon" >>output.txt
systemctl is-enabled rhnsd			 >>output.txt
echo 							 >>output.txt

echo "1.4 Ensure GPG keys are configured" >>output.txt
rpm -q gpg-pubkey --qf '%{name}-%{version}-%{release} --> %{summary}\n'			 >>output.txt
echo 							 >>output.txt

echo "1.5 Ensure gpgcheck is globally activated" >>output.txt
grep ^gpgcheck /etc/yum.conf		 >>output.txt
grep ^gpgcheck /etc/yum.repos.d/*		 >>output.txt
echo 							 >>output.txt

echo "1.6 Ensure package manager repositories are configured" >>output.txt
dnf repolist	 >>output.txt
echo 							 >>output.txt

echo "1.7 Ensure AIDE is installed" >>output.txt
rpm -q aide 							 >>output.txt
echo 							 >>output.txt

echo "1.8 Ensure filesystem integrity is regularly checked" >>output.txt
crontab -u root -l | grep aide	>>output.txt
grep -r aide /etc/cron.* /etc/crontab	>>output.txt
echo 							 >>output.txt

echo "2. inetd Services" >>output.txt
echo 							 >>output.txt

echo "2.1 Ensure xinetd is not installed" >>output.txt
rpm -q xinetd		 >>output.txt
echo 							 >>output.txt

echo "3. Process Hardening" >>output.txt
echo 							 >>output.txt

echo "3.1 Ensure core dumps are restricted" >>output.txt
grep "hard core" /etc/security/limits.conf /etc/security/limits.d/*	 >>output.txt
sysctl fs.suid_dumpable	 >>output.txt
grep "fs\.suid_dumpable" /etc/sysctl.conf /etc/sysctl.d/*	 >>output.txt
echo 							 >>output.txt

echo "3.2 Ensure address space layout randomization (ASLR) is enabled" >>output.txt
sysctl kernel.randomize_va_space 	>>output.txt
grep "kernel\.randomize_va_space" /etc/sysctl.conf /etc/sysctl.d/*	 >>output.txt
echo 							 >>output.txt

echo "4. Time synchronization" >>output.txt
echo 							 >>output.txt

echo "4.1 Ensure time synchronization is in use" >>output.txt
rpm -q chrony		>>output.txt
echo 							 >>output.txt

echo "4.2 Ensure chrony is configured" >>output.txt
grep -E "^(server|pool)" /etc/chrony.conf		>>output.txt
ps -ef | grep chronyd		>>output.txt
echo 							 >>output.txt

echo "5. OS Services" >>output.txt
echo 							 >>output.txt

echo "5.1 Remove Legacy Services" >>output.txt
systemctl is-enabled telnet.socket disabled >>output.txt
rpm -q telnet >>output.txt
systemctl is-enabled rlogin.socket >>output.txt
systemctl is-enabled rexec.socket >>output.txt
 systemctl is-enabled rsh.socket >>output.txt
rpm -q ypbind >>output.txt
systemctl is-enabled ypserv >>output.txt
systemctl is-enabled tftp.socket >>output.txt
chkconfig --list >>output.txt
rpm -q talk >>output.txt
systemctl is-enabled ntalk >>output.txt
systemctl is-enabled xinetd >>output.txt
rpm -qa xorg-x11* >>output.txt
systemctl is-enabled avahi-daemon >>output.txt
systemctl is-enabled cups >>output.txt
systemctl is-enabled dhcpd >>output.txt
systemctl is-enabled slapd >>output.txt
systemctl is-enabled nfs >>output.txt
systemctl is-enabled rpcbind >>output.txt
systemctl is-enabled named >>output.txt
systemctl is-enabled vsftpd >>output.txt
systemctl is-enabled httpd >>output.txt
systemctl is-enabled dovecot >>output.txt
systemctl is-enabled smb >>output.txt
systemctl is-enabled squid >>output.txt
systemctl is-enabled snmpd >>output.txt
echo 							 >>output.txt

echo "6. Password Settings" >>output.txt
echo 							 >>output.txt

echo "6.1 Configure PAM" >>output.txt
grep pam_pwquality.so /etc/pam.d/password-auth 	 >>output.txt
grep pam_pwquality.so /etc/pam.d/system-auth 	 >>output.txt
grep ^minlen /etc/security/pwquality.conf 	 >>output.txt
grep ^dcredit /etc/security/pwquality.conf 	 >>output.txt
grep ^lcredit /etc/security/pwquality.conf 	 >>output.txt
grep ^ocredit /etc/security/pwquality.conf 	 >>output.txt
grep ^ucredit /etc/security/pwquality.conf 	 >>output.txt
#auth required pam_faillock.so 	 >>output.txt
#auth [default=die] pam_faillock.so 	 >>output.txt
#auth sufficient pam_faillock.so 	 >>output.txt
echo 							 >>output.txt

echo "7. Warning Banners" >>output.txt
echo 							 >>output.txt

echo "7.1 Set Warning Banner for Standard Login Services" >>output.txt
cat /etc/motd  >>output.txt
egrep '(\\v|\\r|\\m|\\s)' /etc/motd >>output.txt
stat /etc/motd  >>output.txt
echo 							 >>output.txt

echo "7.2 Remove OS Information from Login Warning Banners" >>output.txt
cat /etc/issue.net  >>output.txt
egrep '(\\v|\\r|\\m|\\s)' /etc/issue.net >>output.txt
echo 							 >>output.txt

echo "7.3 Set GNOME Warning Banner" >>output.txt
echo "Manual Check"	>>output.txt
echo 							 >>output.txt

echo "8. Network Configuration and Firewalls" >>output.txt
echo 							 >>output.txt

echo "8.1 Modify Network Parameters" >>output.txt
sysctl net.ipv4.ip_forward>>output.txt
sysctl net.ipv4.conf.all.send_redirects	>>output.txt 
sysctl net.ipv4.conf.default.send_redirects >>output.txt
sysctl net.ipv4.conf.all.accept_source_route	>>output.txt
sysctl net.ipv4.conf.default.accept_source_route	>>output.txt
sysctl net.ipv4.conf.all.accept_redirects	>>output.txt 
sysctl net.ipv4.conf.default.accept_redirects	>>output.txt 
sysctl net.ipv4.conf.all.secure_redirects	>>output.txt
sysctl net.ipv4.conf.default.secure_redirects	>>output.txt
sysctl net.ipv4.conf.all.log_martians	>>output.txt 
sysctl net.ipv4.conf.default.log_martians	>>output.txt
sysctl net.ipv4.icmp_echo_ignore_broadcasts	>>output.txt
sysctl net.ipv4.icmp_ignore_bogus_error_responses	>>output.txt
sysctl net.ipv4.conf.all.rp_filter	>>output.txt 
sysctl net.ipv4.conf.default.rp_filter	>>output.txt
sysctl net.ipv4.tcp_syncookies	>>output.txt
echo 							 >>output.txt

echo "8.2 Ensure IPv6 router advertisements are not accepted" >>output.txt
sysctl net.ipv6.conf.all.accept_ra	>>output.txt
sysctl net.ipv6.conf.default.accept_ra	>>output.txt
grep "net\.ipv6\.conf\.all\.accept_ra" /etc/sysctl.conf /etc/sysctl.d/*	>>output.txt
grep "net\.ipv6\.conf\.default\.accept_ra" /etc/sysctl.conf /etc/sysctl.d/*	>>output.txt
echo 							 >>output.txt

echo "8.3 Install TCP Wrappers" >>output.txt
rpm -q tcp_wrappers  >>output.txt
rpm -q tcp_wrappers-libs  >>output.txt
echo 							 >>output.txt

echo "8.4 Enable Server firewall" >>output.txt
echo "Manual Check" >>output.txt
echo 							 >>output.txt

echo "9. Uncommon Protocols" >>output.txt
echo 							 >>output.txt

echo "9.1 Disable Uncommon Network Protocols" >>output.txt
modprobe -n -v dccp	>>output.txt
modprobe -n -v sctp	>>output.txt
modprobe -n -v rds	>>output.txt
modprobe -n -v tipc	>>output.txt
lsmod | grep dccp	>>output.txt
lsmod | grep sctp	>>output.txt
lsmod | grep rds	>>output.txt
lsmod | grep tipc	>>output.txt
echo 							 >>output.txt

echo "10. Special Purpose Services" >>output.txt
echo 							 >>output.txt

echo "10.1 Configure Mail Transfer Agent for Local-Only Mode" >>output.txt
netstat -an | grep LIST | grep ":25[[:space:]]" tcp 0 0 127.0.0.1:25 0.0.0.0:* LISTEN	>>output.txt
echo 							 >>output.txt

echo "10.2 Check for Unconfined Daemons" >>output.txt
ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ':' ' ' | awk '{ print $NF }'	>>output.txt
echo 							 >>output.txt

echo "11. Logging and Auditing" >>output.txt
echo 							 >>output.txt

echo "11.1 Configure rsyslog" >>output.txt
systemctl is-enabled rsyslog  >>output.txt
echo 							 >>output.txt

echo "11.2 Configure System Accounting" >>output.txt
grep max_log_file /etc/audit/auditd.conf 	 >>output.txt
grep space_left_action /etc/audit/auditd.conf 	 >>output.txt
grep action_mail_acct /etc/audit/auditd.conf 	 >>output.txt
grep max_log_file_action /etc/audit/auditd.conf 	 >>output.txt
grep time-change /etc/audit/audit.rules 	 >>output.txt
grep identity /etc/audit/audit.rules 	 >>output.txt
grep system-locale /etc/audit/audit.rules 	 >>output.txt
grep MAC-policy /etc/audit/audit.rules 	 >>output.txt
grep logins /etc/audit/audit.rules 	 >>output.txt
grep session /etc/audit/audit.rules 	 >>output.txt
grep access /etc/audit/audit.rules 	 >>output.txt
grep mounts /etc/audit/audit.rules 	 >>output.txt
grep scope /etc/audit/audit.rules 	 >>output.txt
grep actions /etc/audit/audit.rules 	 >>output.txt
echo 							 >>output.txt

echo "12. SSH Parameters" >>output.txt
echo 							 >>output.txt

echo "12.1 Ensure that the necessary SSH Parameters are configured" >>output.txt
grep "^Protocol" /etc/ssh/sshd_config 	 >>output.txt
grep "^LogLevel" /etc/ssh/sshd_config  >>output.txt
stat /etc/ssh/sshd_config  >>output.txt
grep "^X11Forwarding" /etc/ssh/sshd_config  >>output.txt
grep "^MaxAuthTries" /etc/ssh/sshd_config  >>output.txt
grep "^IgnoreRhosts" /etc/ssh/sshd_config  >>output.txt
grep "^HostbasedAuthentication" /etc/ssh/sshd_config  >>output.txt
grep "^PermitEmptyPasswords" /etc/ssh/sshd_config 
grep "MACs" /etc/ssh/sshd_config  >>output.txt
grep "^ClientAliveInterval" /etc/ssh/sshd_config  >>output.txt
grep "^ClientAliveCountMax" /etc/ssh/sshd_config  >>output.txt
grep "^AllowGroups" /etc/ssh/sshd_config  >>output.txt
grep "^DenyUsers" /etc/ssh/sshd_config  >>output.txt
grep "^DenyGroups" /etc/ssh/sshd_config  >>output.txt
grep "^Banner" /etc/ssh/sshd_config  >>output.txt
echo 							 >>output.txt

echo "13. System Access, Authentication and Authorization" >>output.txt
echo 							 >>output.txt

echo "13.1 Restrict Access to the su Command" >>output.txt
grep pam_wheel.so /etc/pam.d/su  >>output.txt
echo 							 >>output.txt

echo "13.2 Ensure permissions on bootloader config are configured" >>output.txt
stat /boot/grub2/grub.cfg 	 >>output.txt
stat /boot/grub2/user.cfg 	 >>output.txt
echo 							 >>output.txt

echo "13.3 Disable Automounting" >>output.txt
systemctl is-enabled autofs 	 >>output.txt
echo 							 >>output.txt

echo "13.4 Ensure audit logs are not automatically deleted" >>output.txt
grep max_log_file_action /etc/audit/auditd.conf	 >>output.txt
echo 							 >>output.txt

echo "13.5 Ensure no world writable files exist" >>output.txt
df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 >>output.txt
echo 							 >>output.txt

echo "14. User Accounts and Environment" >>output.txt
echo 							 >>output.txt

echo "14.1 Set Shadow Password Suite Parameters" >>output.txt
grep PASS_MAX_DAYS /etc/login.defs >>output.txt
grep PASS_MIN_DAYS /etc/login.defs >>output.txt 
grep PASS_WARN_AGE /etc/login.defs  >>output.txt
grep PASS_MIN_LEN /etc/login.defs  >>output.txt
echo 							 >>output.txt

echo "14.2 Disable System Accounts" >>output.txt
echo "Manual Check" >>output.txt
echo 							 >>output.txt

echo "14.3 Set Default Group for root Account" >>output.txt
grep "^root:" /etc/passwd | cut -f4 -d: >>output.txt
echo 							 >>output.txt

echo "14.4 Set Default umask for Users" >>output.txt
grep "^umask" /etc/bashrc  >>output.txt
grep "^umask" /etc/profile  >>output.txt
echo 							 >>output.txt

echo "14.5 Lock Inactive User Accounts" >>output.txt
useradd -D | grep INACTIVE >>output.txt
echo 							 >>output.txt

echo "15. File System Settings" >>output.txt
echo 							 >>output.txt

echo "15.1 File system Configuration" >>output.txt
mount | grep /tmp  >>output.txt
modprobe -n -v cramfs  >>output.txt
lsmod | grep cramfs  >>output.txt
modprobe -n -v freevxfs  >>output.txt
lsmod | grep freevxfs  >>output.txt
modprobe -n -v jffs2  >>output.txt
lsmod | grep jffs2  >>output.txt
modprobe -n -v hfs  >>output.txt
lsmod | grep hfs  >>output.txt
modprobe -n -v hfsplus  >>output.txt
lsmod | grep hfsplus  >>output.txt
modprobe -n -v squashfs  >>output.txt
lsmod | grep squashfs  >>output.txt
echo 							 >>output.txt

echo "15.2 Verify System File Permissions" >>output.txt
ls -l /etc/passwd	 >>output.txt
ls -l /etc/shadow	 >>output.txt
ls -l /etc/gshadow	 >>output.txt
ls -l /etc/group	 >>output.txt
stat /etc/passwd	 >>output.txt
stat /etc/shadow	 >>output.txt
stat /etc/gshadow	 >>output.txt
stat /etc/group	 >>output.txt
echo 							 >>output.txt

echo "16. Encryption" >>output.txt
echo 							 >>output.txt

echo "16.1 Restrict Cipher list" >>output.txt
grep "^Ciphers [[:blank:]]" /etc/ssh/sshd_config >>output.txt
echo 							 >>output.txt

echo "16.2 Enable TLS 1.2 & Above protocol" >>output.txt
grep -E "TLSv|SSLv" /etc/httpd/conf.d/ssl.conf >>output.txt
echo 							 >>output.txt

echo "16.3 Disable weak encryption protocol" >>output.txt
grep -i "SSL" /etc/httpd/conf.d/ssl.conf >>output.txt
echo 							 >>output.txt

echo "------------------------End of Script------------------------------------------"