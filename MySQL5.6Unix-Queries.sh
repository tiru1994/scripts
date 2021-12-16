#!/bin/sh
echo "##################################################################" 
echo "# Deloitte MySQL 5.6 on Unix Script #"
echo "# Property of Deloitte Touche Tohmatsu LLP 				       #" 
echo "# Copyright (c) 2019 Deloitte Touche Tohmatsu LLP           		       #" 
echo "##################################################################" 

echo "################################################################" >> `hostname`_Compliance.txt
echo "# Deloitte MySQL 5.6 on Unix Script #" >> `hostname`_Compliance.txt
echo "# Property of Deloitte Touche Tohmatsu LLP 				       #" >> `hostname`_Compliance.txt
echo "# Copyright (c) 2019 Deloitte Touche Tohmatsu LLP          		       #" >> `hostname`_Compliance.txt
echo "################################################################" >> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt


echo "2.3.9 Verify That the MYSQL_PWD Environment Variables Is Not In Use" >> `hostname`_Compliance.txt
echo "-------------------------------------------------------------------" >> `hostname`_Compliance.txt
grep MYSQL_PWD /proc/*/environ				>> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt

echo "2.3.10  Backup policy in place " >> `hostname`_Compliance.txt
echo "------------------------------" >> `hostname`_Compliance.txt
crontab -l					>> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt

echo "2.4.7 Disable Interactive Login " >> `hostname`_Compliance.txt
echo "-------------------------------" >> `hostname`_Compliance.txt
getent passwd mysql | egrep "^.*[\/bin\/false|\/sbin\/nologin]$"					>> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt

echo "2.4.8  Ensure 'datadir' Has Appropriate Permissions" >> `hostname`_Compliance.txt
echo "---------------------------------------------------" >> `hostname`_Compliance.txt
ls -l <datadir>/.. | egrep "^d[r|w|x]{3}------\s*.\s*mysql\s*mysql\s*\d*.*mysql"			>> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt

echo "2.4.10 Ensure Plugin Directory Has Appropriate Permissions" >> `hostname`_Compliance.txt
echo "----------------------------------------------------------" >> `hostname`_Compliance.txt
ls -l <plugin_dir Value>/.. | egrep "^drwxr[-w]xr[-w]x[ \t]*[0-9][ \t]*mysql[\t]*mysql.*plugin.*$"					>> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt

echo "-------------------------------END OF SCRIPT----------------------------" >> `hostname`_Compliance.txt
echo 