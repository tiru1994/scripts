#!/bin/sh
echo "######################################################################################" 
echo "# Deloitte Oracle 12c on Unix Configuration Script for State Bank of India #"
echo "# Property of Deloitte Touche Tohmatsu LLP 				       #" 
echo "# Copyright (c) 2019 Deloitte Touche Tohmatsu LLP           		       #" 
echo "######################################################################################" 

echo "#######################################################################################" >> `hostname`_Compliance.txt
echo "# Deloitte Oracle 12c on Unix Script for State Bank of India  #" >> `hostname`_Compliance.txt
echo "# Property of Deloitte Touche Tohmatsu LLP 				       #" >> `hostname`_Compliance.txt
echo "# Copyright (c) 2019 Deloitte Touche Tohmatsu LLP          		       #" >> `hostname`_Compliance.txt
echo "#######################################################################################" >> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt


echo "2.6. Ensure 'ADMIN_RESTRICTIONS_' Is Set to 'ON'" >> `hostname`_Compliance.txt
echo "------------------------------------------------" >> `hostname`_Compliance.txt
grep -i admin_restrictions $ORACLE_HOME/network/admin/listener.ora
echo >> `hostname`_Compliance.txt

echo "2.6. Ensure 'SECURE_REGISTER_' Is Set to 'TCPS' or 'IPC'" >> `hostname`_Compliance.txt
echo "--------------------------------------------------------" >> `hostname`_Compliance.txt
grep -i SECURE_REGISTER $ORACLE_HOME/network/admin/listener.ora
echo >> `hostname`_Compliance.txt

echo "-------------------------------END OF SCRIPT----------------------------" >> `hostname`_Compliance.txt
echo 