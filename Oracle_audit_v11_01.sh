#!/bin/sh
#-------------------------------------------------------------
# Oracle Database audit script - operating system side
# alewyn.muller@za.pwc.com
# 3 April 2007
# Copyright (c) Ernst & Young LLP 2007
# Copyright (c)  Refreshed by Deloitte Touche Tohmatsu India LLP (c) 2019
#-------------------------------------------------------------
#
# Operational instructions to the client:
#
# Please:
#
# a) Scrutinize the contents of the script to ensure that it does 
#    not contain any statements, commands or any other code that 
#    might negatively influence their environment(s) in either a 
#    security or operational way.
#
# b) Test the script on the test environment to ensure that it does 
#    not contain any statements, commands or any other code that 
#    might negatively influence their environment(s) in either a 
#    security or operational way.
#
# c) The final responsibility for executing this script lies with 
#    the client.  
#
# d) It is advised to execute the script during off-peak hours.
#
# e) The client must remove all copies of the script as it is the 
#    property of Ernst & Young LLP.  The client may retain 
#    the script results.
#
#---------------------------------------------------------------
# Upon termination, a tarball, called EY_<uname -n>.tar 
# will be created under /tmp/EY_oracle
#---------------------------------------------------------------

VERSION=0.1
ORACLE_PATH=$ORACLE_HOME/../..
TMP_PATH=/tmp/EY_oracle

print_usage() {
echo "usage: $0 [-path /lowest/path/to/oracle] [-tmppath /tmp/somewhere] [-v/--version] [-h/--help]"
echo "if no path is specified, \"${ORACLE_HOME}/../..\" will be assumed"
echo "if no tmppath is specified, \"/tmp/EY_oracle\" will be assumed" ; echo
}

while [ $# -ne 0 ] ; do
   case $1 in
       -path)           ORACLE_PATH=$2
                        shift ;;
       -tmppath)        TMP_PATH=$2
                        shift ;;
       -v|--version)    echo $VERSION ; exit 1 ;;
       -h|--help)       print_usage ; exit 1 ;;
        *)              print_usage ; exit 1 ;;
   esac
   shift
done

echo "1. Performing ls -lR on $ORACLE_PATH"
mkdir /tmp/PwC_oracle
ls -lR $ORACLE_PATH > $TMP_PATH/OSoracle_file_permissions.txt
echo "DONE." ; echo

echo "2.1 Obtaining cron information from /etc/crontab"
cat /etc/crontab > $TMP_PATH/OScrontab.txt
cat /etc/crontab | sed s/^#.*//g | awk '{if (NF > 6) {print $7};}' > $TMP_PATH/examine.txt

echo "2.2 Obtaining cron information from /etc/cron.*/"
ls -lRL /etc/cron.hourly/         > $TMP_PATH/OScron_hourly.txt
ls -lRL /etc/cron.daily/          > $TMP_PATH/OScron_daily.txt
ls -lRL /etc/cron.weekly/         > $TMP_PATH/OScron_weekly.txt
ls -lRL /etc/cron.monthly/        > $TMP_PATH/OScron_monthly.txt
ls -lRL /etc/cron.d/              > $TMP_PATH/OScron_d.txt
cat /etc/cron.d/* | sed s/^#.*//g > $TMP_PATH/OScron_d_contents.txt
for i in /etc/cron.d/* ; do
cat $i | sed s/^#.*//g | awk '{if (NF > 6) {print $7};}' >> $TMP_PATH/examine.txt
done

echo "2.3 Obtaining cron information from crontab -l"
crontab -l > $TMP_PATH/OSvar_spool_cron.txt
crontab -l | sed s/^#.*//g | awk '{if (NF > 5) {print $6};}' >> $TMP_PATH/examine.txt
echo "DONE." ; echo

echo "3. Obtaining file permissions of crontab jobs with ls -lL"
echo "" > $TMP_PATH/OScron_file_permissions.txt
cat $TMP_PATH/examine.txt | while read line; do ls -lL `which $line` >> $TMP_PATH/OScron_file_permissions.txt; done
echo "DONE." ; echo

echo "4. Obtaining patch information with 'OPatch listinventory'"
$ORACLE_HOME/OPatch/opatch lsinventory > $TMP_PATH/OSopatch.txt
echo "DONE." ; echo

echo "4. Obtaining listener.ora file(s)"
echo "" > $TMP_PATH/OSlistener_file.txt
for i in `find $ORACLE_HOME/network/admin -name listener.ora | grep -v -i sample`
do
echo "===================================" >> $TMP_PATH/OSlistener_file.txt
echo "Filename: $i" >> $TMP_PATH/OSlistener_file.txt
echo "===================================" >> $TMP_PATH/OSlistener_file.txt
cat $i >> $TMP_PATH/OSlistener_file.txt
echo "" >> $TMP_PATH/OSlistener_file.txt
echo "" >> $TMP_PATH/OSlistener_file.txt
done
echo "DONE." ; echo

echo "5. Obtaining $ORACLE_HOME/dbs/* files"
tar cvf $TMP_PATH/oracle_home_dbs.tar $ORACLE_HOME/dbs/*
echo "DONE." ; echo

echo "6. Copying /etc/passwd and /etc/group"
cp /etc/passwd $TMP_PATH/OSetc_passwd.txt
cp /etc/group $TMP_PATH/OSetc_group.txt
echo "DONE." ; echo

echo "7. Obtaining 'ps -ef' and 'uname -a' information"
ps -ef > $TMP_PATH/OSps_ef.txt
uname -a > $TMP_PATH/OSuname.txt
echo "DONE." ; echo

echo "8. Adding output files to tarball under $TMP_PATH"
tar cvf "$TMP_PATH/PwC_`uname -n`.tar" $TMP_PATH/*.txt \
$TMP_PATH/oracle_home_dbs.tar --exclude $TMP_PATH/examine.txt \
2&> /dev/null
echo "DONE." ; echo
