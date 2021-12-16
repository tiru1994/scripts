#!/bin/sh
echo "#######################################################################################" >> `hostname`_Compliance.txt
echo "# Deloitte Oracle 19c on Unix Script  #" >> `hostname`_Compliance.txt
echo "# Property of Deloitte Touche Tohmatsu LLP 				       #" >> `hostname`_Compliance.txt
echo "# Copyright (c) 2020 Deloitte Touche Tohmatsu LLP          		       #" >> `hostname`_Compliance.txt
echo "#######################################################################################" >> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt
echo "2.1.2. Unlimited access to tkprof utility " >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
ls -ld $ORACLE_HOME/bin/tkprof>> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.1.4. Change default Oracle database listener port" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
lsnrctl status >> `hostname`_Compliance.txt
cat $ORACLE_HOME/network/admin/listener.ora >> `hostname`_Compliance.txt
cat $ORACLE_HOME/network/admin/tnsnames.ora >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.2.1. Weak permission on Oracle directories" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
ls -ld $ORACLE_HOME/bin >> `hostname`_Compliance.txt
ls -ld $ORACLE_HOME >> `hostname`_Compliance.txt
ls -ld $ORACLE_BASE/admin >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.2.2. Weak permission on critical Oracle files" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
ls -l $ORACLE_HOME/network/admin/listener.ora >> `hostname`_Compliance.txt
ls -l $ORACLE_BASE/dbs/init >> `hostname`_Compliance.txt
ls -l $ORACLE_BASE/dbs/spfile.ora >> `hostname`_Compliance.txt
echo "Manual check for Oracle Control file & Data file" >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.2.3. Weak UMASK value for Oracle account" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
grep -i "umask" /etc/profile >> `hostname`_Compliance.txt
grep -i "umask" /etc/bashrc >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.2.5 Authentication and Certification Parameters" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
grep -i "ADD_SSLV3_TO_DEFAULT" $ORACLE_HOME/network/admin/sqlnet.ora >> `hostname`_Compliance.txt
grep -i "ADG_ACCOUNT_INFO_TRACKING" $ORACLE_HOME/network/admin/sqlnet.ora >> `hostname`_Compliance.txt
grep -i "ACCEPT_MD5_CERTS" $ORACLE_HOME/network/admin/sqlnet.ora >> `hostname`_Compliance.txt
grep -i "ACCEPT_SHA1_CERTS" $ORACLE_HOME/network/admin/sqlnet.ora >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.3.5. Http and ftp access to the oracle database" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
grep -i "dispatcher" $ORACLE_HOME/dbs/spfiletest.ora >> `hostname`_Compliance.txt
lsnrctl status >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.6.2 Ensure extproc Is Not Present in listener.ora" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
grep -i "extproc" $ORACLE_HOME/network/admin/listener.ora >> `hostname`_Compliance.txt
lsnrctl status >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.8.1. Change standard ports" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
lsnrctl status >> `hostname`_Compliance.txt
cat $ORACLE_HOME/network/admin/listener.ora >> `hostname`_Compliance.txt
cat $ORACLE_HOME/network/admin/tnsnames.ora >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.8.4 Privilege Analysis" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
echo "Manual Check" >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "2.8.5 Support for Oracle Native Encryption and SSL Authentication for
Different Users Concurrently" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
grep -i "SQLNET.ENCRYPTION_SERVER" $ORACLE_HOME/network/admin/sqlnet.ora >> `hostname`_Compliance.txt
grep -i "SQLNET.IGNORE_ANO_ENCRYPTION_FOR_TCPS" $ORACLE_HOME/network/admin/sqlnet.ora >> `hostname`_Compliance.txt
echo >> `hostname`_Compliance.txt
echo "-------------------------------END OF SCRIPT----------------------------" >> `hostname`_Compliance.txt