#!/bin/sh

clear
echo "# Deloitte PostgreSQL Secure Configuration Review Script#"		>> `hostname`_Compliance.txt
echo "# Property of Deloitte Touche Tohmatsu India LLP 	 		                      #" 		>> `hostname`_Compliance.txt
echo "# Copyright (c) 2019 Deloitte Touche Tohmatsu India LLP                         #" 		>> `hostname`_Compliance.txt

echo Deloitte PostgreSQL Script Started.......

echo "###########################System Information###########################" 				>> `hostname`_Compliance.txt

echo											>> `hostname`_Compliance.txt
echo "Hostname"									>> `hostname`_Compliance.txt
echo "--------"									>> `hostname`_Compliance.txt
hostname										>> `hostname`_Compliance.txt
echo											>> `hostname`_Compliance.txt

echo "Timestamp"								>> `hostname`_Compliance.txt
echo "---------"								>> `hostname`_Compliance.txt
date											>> `hostname`_Compliance.txt
echo											>> `hostname`_Compliance.txt

#Banner											>> `hostname`_Compliance.txt
echo "Operating System"							>> `hostname`_Compliance.txt
echo "----------------"							>> `hostname`_Compliance.txt
cat /etc/motd									>> `hostname`_Compliance.txt
echo											>> `hostname`_Compliance.txt

#IP Configuration								>> `hostname`_Compliance.txt
echo "IP Address"								>> `hostname`_Compliance.txt
echo "----------"								>> `hostname`_Compliance.txt
/sbin/ifconfig -a|grep "inet "					>> `hostname`_Compliance.txt
echo 											>> `hostname`_Compliance.txt



echo "2.3 System Configuration "																	>> `hostname`_Compliance.txt	
echo "2.3.3 Ensure packages are obtained from authorized repositories "								>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt
whoami																								>> `hostname`_Compliance.txt
yum repolist all | grep enabled																		>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt

echo "2.3 System Configuration "																	>> `hostname`_Compliance.txt	
echo "2.3.4 Ensure Installation of Binary Packages "												>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt
whoami																								>> `hostname`_Compliance.txt
yum info $(rpm -qa|grep postgres) | egrep															>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt

echo "2.3 System Configuration "																	>> `hostname`_Compliance.txt	
echo "2.3.5 Ensure systemd Service Files Are Enabled  "												>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt
whoami																								>> `hostname`_Compliance.txt
systemctl get-default																				>> `hostname`_Compliance.txt
systemctl list-dependencies multi-user.target | grep -i postgres									>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt

echo "2.3 System Configuration "																	>> `hostname`_Compliance.txt	
echo "2.3.6 Ensure Data Cluster Initialized Successfully "											>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt
whoami																								>> `hostname`_Compliance.txt
PGSETUP_INITDB_OPTIONS="-k" /usr/pgsql-11/bin/postgresql-11-setup initdb							>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt

echo "2.3 System Configuration "																	>> `hostname`_Compliance.txt	
echo "2.3.7 Ensure base backups are configured and functional "										>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt
whoami																								>> `hostname`_Compliance.txt
pg_basebackup -h name_or_IP_of_master \ -p 5432 \ -U replication_user \ -D ~postgres/11/data \ -P -v -R -Xs \					>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt

echo "2.4 User Rights and Security Options "														>> `hostname`_Compliance.txt	
echo "2.4.4 Ensure sudo is configured correctly "													>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt
whoami																								>> `hostname`_Compliance.txt
groups																								>> `hostname`_Compliance.txt
sudo su - postgres																					>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt

echo "2.5 Security Settings "																		>> `hostname`_Compliance.txt	
echo "2.5.3 Ensure FIPS 140-2 OpenSSL Cryptography Is Used "										>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt
cat /proc/sys/crypto/fips_enabled																	>> `hostname`_Compliance.txt
openssl version																						>> `hostname`_Compliance.txt
echo "=============================================================="								>> `hostname`_Compliance.txt
