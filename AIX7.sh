#!/bin/sh
echo "########################################################################" 		>> `hostname`_Compliance.txt
echo " Copyright (c) 2019 Deloitte Touche Thomastu India LLP 				"			>> `hostname`_Compliance.txt	
echo  AIX Script Started.......

echo "###########################Server Information###########################" 		>> `hostname`_Compliance.txt
echo										>> `hostname`_Compliance.txt
echo "Hostname"									>> `hostname`_Compliance.txt
echo "--------"									>> `hostname`_Compliance.txt
hostname										>> `hostname`_Compliance.txt
echo										>> `hostname`_Compliance.txt

echo "Timestamp"									>> `hostname`_Compliance.txt
echo "---------"									>> `hostname`_Compliance.txt
date										>> `hostname`_Compliance.txt
echo										>> `hostname`_Compliance.txt

#Banner										>> `hostname`_Compliance.txt
echo "Operating System"								>> `hostname`_Compliance.txt
echo "----------------"									>> `hostname`_Compliance.txt
cat /etc/motd									>> `hostname`_Compliance.txt
echo										>> `hostname`_Compliance.txt

#IP Configuration									>> `hostname`_Compliance.txt
echo "IP Address"									>> `hostname`_Compliance.txt
echo "----------"									>> `hostname`_Compliance.txt
/sbin/ifconfig -a|grep "inet "								>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1. Access Management"							>> `hostname`_Compliance.txt
echo "------------------------------------"							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1.1. Password Policy"			 					>> `hostname`_Compliance.txt
echo "--------------------------------" 							>> `hostname`_Compliance.txt
echo "##Ensure password policy is in accordance with banks policy .##" 				>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1.1.1 mindiff"	 							>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a mindiff						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"				>> `hostname`_Compliance.txt
echo "default mindiff=4"								>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt


echo "2.1.1.2 minage"	 							>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a minage						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "default minage=1"	 							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1.1.3 maxage"	 							>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a maxage		 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "default maxage=13 "	 							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1.1.4 minlen"	 							>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a minlen						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "default minlen=8"	 							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1.1.5 minalpha"	 							>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a minalpha	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "default minalpha=2"	 							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1.1.6 histexpire"	 							>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a histexpire	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "default histexpire=13"	 							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1.1.7 histsize"	 							>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a histsize						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"				>> `hostname`_Compliance.txt
echo "default histsize=20"	 							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1.1.8 maxexpired"	 							>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a maxexpired						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "default maxexpired=2"	 							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.1.1.9 minspecialchar"	 							>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a minspecialchar					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "default minspecialchar=1"	 						>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.2. System Controls"								>> `hostname`_Compliance.txt
echo "------------------------------------"							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.2.1. Login Policy"			 					>> `hostname`_Compliance.txt
echo "--------------------------------" 							>> `hostname`_Compliance.txt
echo "##Ensure Login Policy is in accordance with banks policy .##" 				>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.2.1.1 daemon"	 							>> `hostname`_Compliance.txt
lsuser -a login rlogin daemon	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "daemon login=false rlogin=false"	 						>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.2.1.2 bin"		 							>> `hostname`_Compliance.txt
lsuser -a login rlogin bin	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "bin login=false rlogin=false"	 						>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.2.1.3 sys"		 							>> `hostname`_Compliance.txt
lsuser -a login rlogin sys	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "sys login=false rlogin=false"	 						>> `hostname`_Compliance.txt
echo			 							>> `hostname`_Compliance.txt

echo "2.2.1.4 adm"		 							>> `hostname`_Compliance.txt
lsuser -a login rlogin adm	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"				>> `hostname`_Compliance.txt
echo "adm login=false rlogin=false"	 						>> `hostname`_Compliance.txt
echo 	 									>> `hostname`_Compliance.txt

echo "2.2.1.5 nobody"	 							>> `hostname`_Compliance.txt
lsuser -a login rlogin nobody	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "nobody login=false rlogin=false"	 						>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.2.1.6 uucp"		 							>> `hostname`_Compliance.txt
lsuser -a login rlogin uucp 								>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "uucp login=false rlogin=false"	 						>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.2.1.7 lpd"		 							>> `hostname`_Compliance.txt
lsuser -a login rlogin lpd	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "lpd login=false rlogin=false"	 						>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3. Services"									>> `hostname`_Compliance.txt
echo "------------------------------------"							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.3.1. System Services Management"			 			>> `hostname`_Compliance.txt
echo "--------------------------------" 							>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt

echo "2.3.1.1 qdaemon"	 							>> `hostname`_Compliance.txt
lsitab qdaemon		 							>> `hostname`_Compliance.txt
echo "The above command should not yield output"	 				>> `hostname`_Compliance.txt
echo		 	 							>> `hostname`_Compliance.txt

echo "2.3.1.2 lpd"		 							>> `hostname`_Compliance.txt
lsitab lpd	 									>> `hostname`_Compliance.txt
echo "The above command should not yield output"					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.3 piobe"	 								>> `hostname`_Compliance.txt
lsitab piobe	 								>> `hostname`_Compliance.txt
echo "The above command should not yield output"	 				>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.4 dt"		 							>> `hostname`_Compliance.txt
lsitab dt		 								>> `hostname`_Compliance.txt
echo "The above command should not yield output"					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.5 rcnfs "		 							>> `hostname`_Compliance.txt
lsitab rcnfs		 							>> `hostname`_Compliance.txt
echo "The above command should not yield output"					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.6 sendmail "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/lib/sendmail" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"				>> `hostname`_Compliance.txt
echo "#start /usr/lib/sendmail "$src_running" "-bd -q${qpi}""	 				>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.7 snmpd "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/snmpd" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "#start /usr/sbin/snmpd "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.8 dhcpcd "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/dhcpcd" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/dhcpcd "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.9 dhcprd "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/dhcprd" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/dhcprd "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.10 dhcpsd "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/dhcpsd" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/dhcpsd "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.11 autoconf "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/autoconf6" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/autoconf6 """	 						>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.12 gated "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/gated" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/gated "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.13 mrouted "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/mrouted" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/mrouted "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.14 named "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/named" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/named "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.15 routed "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/routed" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/routed "$src_running" -q"	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.16 rwhod "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/rwhod" /etc/rc.tcpip 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/rwhod "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.17 timed"	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/timed" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/timed "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt
 
echo "2.3.1.18 dpid "		 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/dpid2" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"				>> `hostname`_Compliance.txt
echo "#start /usr/sbin/dpid2 "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.19 hostmibd "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/hostmibd" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/hostmibd "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.20 snmpmibd "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/snmpmibd" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/snmpmibd "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.21 aixmibd "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/aixmibd" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/aixmibd "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.22 ndpd-host "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/ndpd-host" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/ndpd-host "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.23 ndpd-router "	 							>> `hostname`_Compliance.txt
grep "^#start[[:blank:]]/usr/sbin/ndpd-router" /etc/rc.tcpip	 				>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#start /usr/sbin/ndpd-router "$src_running""	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.24 telnet "	 							>> `hostname`_Compliance.txt
grep "^#telnet[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "				>> `hostname`_Compliance.txt
echo "#telnet stream tcp6 nowait root /usr/sbin/telnetd telnetd -a"	 			>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.25 exec "	 								>> `hostname`_Compliance.txt
grep "^#exec[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#exec stream tcp6 nowait root /usr/sbin/rexecd rexecd"	 			>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.26 daytime"	 							>> `hostname`_Compliance.txt
grep "^#daytime[[:blank:]]" /etc/inetd.conf	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#daytime stream tcp nowait root internal "	 					>> `hostname`_Compliance.txt
echo "#daytime dgram udp wait root internal"	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt
 
echo "2.3.1.27 shell "	 							>> `hostname`_Compliance.txt
grep "^#shell[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#shell stream tcp6 nowait root /usr/sbin/rshd rshd"	 				>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.28 cmsd "	 							>> `hostname`_Compliance.txt
grep "^#cmsd[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#cmsd sunrpc_udp udp wait root /usr/dt/bin/rpc.cmsd cmsd 100068 2-5"	 		>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.29 ttdbserver "	 							>> `hostname`_Compliance.txt
grep "^#ttdbserver[[:blank:]]" /etc/inetd.conf	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#ttdbserver sunrpc_tcp tcp wait root /usr/dt/bin/rpc.ttdbserver rpc.ttdbserver 100083 1"	>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.30 uucp "	 							>> `hostname`_Compliance.txt
grep "^#uucp[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#uucp stream tcp nowait root /usr/sbin/uucpd uucpd"	 				>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.31 time "		 							>> `hostname`_Compliance.txt
grep "^#time[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#time stream tcp nowait root internal "	 					>> `hostname`_Compliance.txt
echo "#time dgram udp wait root internal"	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.32 login"	 								>> `hostname`_Compliance.txt
grep "^#login[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#login stream tcp6 nowait root /usr/sbin/rlogind rlogind"	 			>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt
 
echo "2.3.1.33 talk "		 							>> `hostname`_Compliance.txt
grep "^#talk[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#talk dgram udp wait root /usr/sbin/talkd talkd"	 				>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.34 ntalk "	 							>> `hostname`_Compliance.txt
grep "^#ntalk[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#ntalk dgram udp wait root /usr/sbin/talkd talkd"	 				>> `hostname`_Compliance.txt
echo 	 									>> `hostname`_Compliance.txt

echo "2.3.1.35 ftp"	 								>> `hostname`_Compliance.txt
grep "^#ftp[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#ftp stream tcp6 nowait root /usr/sbin/ftpd ftpd"	 				>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.36 chargen "	 							>> `hostname`_Compliance.txt
grep "^#chargen[[:blank:]]" /etc/inetd.conf 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#chargen stream tcp nowait root internal "	 					>> `hostname`_Compliance.txt
echo "#chargen dgram udp wait root internal"	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.37 discard "	 							>> `hostname`_Compliance.txt
grep "^#discard[[:blank:]]" /etc/inetd.conf	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#discard stream tcp nowait root internal "	 					>> `hostname`_Compliance.txt
echo "#discard dgram udp wait root internal"	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.38 dtspc"	 							>> `hostname`_Compliance.txt
grep "^#dtspc[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#dtspc stream tcp nowait root /usr/dt/bin/dtspcd /usr/dt/bin/dtspcd"	 		>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.39 echo "	 							>> `hostname`_Compliance.txt
grep "^#echo[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#echo stream tcp nowait root internal "	 					>> `hostname`_Compliance.txt
echo "#echo dgram udp wait root internal"	 					>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.40 pcnfsd"	 							>> `hostname`_Compliance.txt
grep "^#pcnfsd[[:blank:]]" /etc/inetd.conf	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#pcnfsd sunrpc_udp udp wait root /usr/sbin/rpc.pcnfsd pcnfsd 150001 1-2"	 		>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.41 rstatd"	 							>> `hostname`_Compliance.txt
grep "^#rstatd[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#rstatd sunrpc_udp udp wait root /usr/sbin/rpc.rstatd rstatd 100001 1-3"	 		>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.42 rusersd "	 							>> `hostname`_Compliance.txt
grep "^#rusersd[[:blank:]]" /etc/inetd.conf	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#rusersd sunrpc_udp udp wait root /usr/lib/netsvc/rusers/rpc.rusersd rusersd 100002 1-2"	>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.43 rwalld "	 							>> `hostname`_Compliance.txt
grep "^#rwalld[[:blank:]]" /etc/inetd.conf	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#rwalld sunrpc_udp udp wait root /usr/lib/netsvc/rwall/rpc.rwalld rwalld 100008 1"	 	>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.44 sprayd "	 							>> `hostname`_Compliance.txt
grep "^#sprayd[[:blank:]]" /etc/inetd.conf	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 			>> `hostname`_Compliance.txt
echo "#sprayd sunrpc_udp udp wait root /usr/lib/netsvc/spray/rpc.sprayd sprayd 100012 1"	 	>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.45 klogin"	 							>> `hostname`_Compliance.txt
grep "^#klogin[[:blank:]]" /etc/inetd.conf 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#klogin stream tcp nowait root /usr/sbin/krlogind krlogind"	 			>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.46 kshell "	 							>> `hostname`_Compliance.txt
grep "^#kshell[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#kshell stream tcp nowait root /usr/sbin/krshd krshd"	 				>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.47 rquotad "	 							>> `hostname`_Compliance.txt
grep "^#rquotad[[:blank:]]" /etc/inetd.conf	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#rquotad sunrpc_udp udp wait root /usr/sbin/rpc.rquotad rquotad 100011 1"	 		>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.48 tftp "	 								>> `hostname`_Compliance.txt
grep "^#tftp[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#tftp dgram udp6 SRC nobody /usr/sbin/tftpd tftpd -n"	 				>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.49 imap"	 								>> `hostname`_Compliance.txt
grep "^#imap2[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 			>> `hostname`_Compliance.txt
echo "#imap2 stream tcp nowait root /usr/sbin/imapd imapd"	 				>> `hostname`_Compliance.txt
echo	 									>> `hostname`_Compliance.txt

echo "2.3.1.50 pop3"	 									>> `hostname`_Compliance.txt
grep "^#pop3[[:blank:]]" /etc/inetd.conf	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "#pop3 stream tcp nowait root /usr/sbin/pop3d pop3d"	 					>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.3.1.51 finger "	 								>> `hostname`_Compliance.txt
grep "^#finger[[:blank:]]" /etc/inetd.conf	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "#finger stream tcp nowait nobody /usr/sbin/fingerd fingerd"	 				>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.3.1.52 instsrv"	 								>> `hostname`_Compliance.txt
grep "^#instsrv[[:blank:]]" /etc/inetd.conf	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "#instsrv stream tcp nowait netinst /u/netinst/bin/instsrv instsrv -r /tmp/netinstalllog /u/netinst/scripts"	>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.3.1.53 Permissions and ownership "	 						>> `hostname`_Compliance.txt
ls -l /etc/inetd.conf | awk '{print $1 " " $3 " " $4 " " $9}'	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "-rw-r--r-- root system /etc/inetd.conf"	 						>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.4. Remote Access"									>> `hostname`_Compliance.txt
echo "------------------------------------"								>> `hostname`_Compliance.txt
echo 											>> `hostname`_Compliance.txt

echo "2.4.1. Disabling Remote Services"			 					>> `hostname`_Compliance.txt
echo "--------------------------------" 								>> `hostname`_Compliance.txt
echo 											>> `hostname`_Compliance.txt

echo "2.4.1.1 Remote command lockdown"							>> `hostname`_Compliance.txt
ls -l /usr/bin/rcp | awk '{print $1}' 	 							>> `hostname`_Compliance.txt
ls -l /usr/bin/rlogin | awk '{print $1}' 	 							>> `hostname`_Compliance.txt
ls -l /usr/bin/rsh | awk '{print $1}'	 							>> `hostname`_Compliance.txt
echo "Each of the above commands should return with the following permissions:"	 			>> `hostname`_Compliance.txt
echo "----------"	 									>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.4.1.2 Remote daemon lockdown"	 							>> `hostname`_Compliance.txt
ls -l /usr/sbin/rlogind | awk '{print $1}' 	 							>> `hostname`_Compliance.txt
ls -l /usr/sbin/rshd | awk '{print $1}' 	 							>> `hostname`_Compliance.txt
ls -l /usr/sbin/tftpd | awk '{print $1}'	 							>> `hostname`_Compliance.txt
echo "Each of the above commands should return with the following permissions:"	 			>> `hostname`_Compliance.txt
echo "----------"	 									>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt


echo "2.4.2 Configuring SSH set privilege separation"			>> `hostname`_Compliance.txt
grep "^UsePrivilegeSeparation[[:blank:]]" /etc/ssh/sshd_config			>> `hostname`_Compliance.txt
echo "The above must not yeild the following output:"			>> `hostname`_Compliance.txt
echo "UsePrivilegeSeparation no"			>> `hostname`_Compliance.txt
echo "-------------------------"			>> `hostname`_Compliance.txt


echo "2.4.3 Configuring SSH removal of .shosts files "			>> `hostname`_Compliance.txt
find / -name ".shosts" -print			>> `hostname`_Compliance.txt
echo "The above command should yield no output."			>> `hostname`_Compliance.txt
echo "-----------------------------------------"			>> `hostname`_Compliance.txt

echo "2.4.4 Configuring SSH removal of /etc/shosts.equiv "			>> `hostname`_Compliance.txt
ls /etc/shosts.equiv			>> `hostname`_Compliance.txt
echo "The above command should yield no output."			>> `hostname`_Compliance.txt
echo "-----------------------------------------"			>> `hostname`_Compliance.txt

echo "2.4.5 Configuring SSH limit access via SSH "			>> `hostname`_Compliance.txt
grep "^(AllowUsers|AllowGroups|DenyUsers|DenyGroups)[[:blank:]]" /etc/ssh/sshd_config			>> `hostname`_Compliance.txt
echo "The above command should yield one of the following output:"			>> `hostname`_Compliance.txt
echo "AllowUsers <userlist> AllowGroups <grouplist> DenyUsers <userlist> DenyGroups <grouplist>"			>> `hostname`_Compliance.txt
echo "-----------------------------------------------------------------------------------------"			>> `hostname`_Compliance.txt

echo "2.4.6 Configuring SSH sshd_config permissions lockdown "			>> `hostname`_Compliance.txt
echo "Ensure that the /etc/ssh/ssh_config permissions have been successfully changed:"			>> `hostname`_Compliance.txt
ls -l /etc/ssh/ssh_config | awk '{print $1 " " $3 " " $4 " " $9}'			>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"			>> `hostname`_Compliance.txt
echo "-rw-r--r-- root system /etc/ssh/ssh_config"			>> `hostname`_Compliance.txt
echo "------------------------------------------"			>> `hostname`_Compliance.txt

echo "2.5. Configurations"									>> `hostname`_Compliance.txt
echo "------------------------------------"								>> `hostname`_Compliance.txt
echo 											>> `hostname`_Compliance.txt

echo "2.5.1. Automated Authentication"			 					>> `hostname`_Compliance.txt
echo "--------------------------------" 								>> `hostname`_Compliance.txt
echo 											>> `hostname`_Compliance.txt

echo "2.5.1.1 Removal of .rhosts and .netrc files"	 						>> `hostname`_Compliance.txt
find / -name ".netrc" -print find / -name ".rhosts" -print	 					>> `hostname`_Compliance.txt
echo "The above commands should not yield output"	 					>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.5.1.2 Removal of entries from /etc/hosts.equiv"	 					>> `hostname`_Compliance.txt
grep -v "^\s*#" /etc/hosts.equiv	 							>> `hostname`_Compliance.txt
echo "The above command should not yield output"	 					>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6. Network Controls"									>> `hostname`_Compliance.txt
echo "------------------------------------"								>> `hostname`_Compliance.txt
echo 											>> `hostname`_Compliance.txt

echo "2.6.1. TCP/IP Hardening"			 						>> `hostname`_Compliance.txt
echo "--------------------------------" 								>> `hostname`_Compliance.txt
echo 											>> `hostname`_Compliance.txt

echo "2.6.1.1 ipsrcrouteforward"	 							>> `hostname`_Compliance.txt
no -a |grep "ipsrcrouteforward[[:blank:]]=[[:blank:]]0"	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "ipsrcrouteforward = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.2 ipignoreredirects"	 							>> `hostname`_Compliance.txt
no -a |grep "ipignoreredirects[[:blank:]]=[[:blank:]]1"	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "ipignoreredirects = 1"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.3 clean_partial_conns"	 							>> `hostname`_Compliance.txt
no -a |grep "clean_partial_conns[[:blank:]]=[[:blank:]]1"	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "clean_partial_conns = 1"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.4 ipsrcroutesend"	 								>> `hostname`_Compliance.txt
no -a |grep "ipsrcroutesend[[:blank:]]=[[:blank:]]0"	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "ipsrcroutesend = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.5 ipforwarding"	 								>> `hostname`_Compliance.txt
no -a |grep "ipforwarding[[:blank:]]=[[:blank:]]0"	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "ipforwarding = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.6 ipsendredirects"	 								>> `hostname`_Compliance.txt
no -a |grep "ipsendredirects[[:blank:]]=[[:blank:]]0" 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "ipsendredirects = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.7 ip6srcrouteforward"	 							>> `hostname`_Compliance.txt
no -a |grep "ip6srcrouteforward[[:blank:]]=[[:blank:]]0" 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "ip6srcrouteforward = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.8 directed_broadcast"	 							>> `hostname`_Compliance.txt
no -a |grep "directed_broadcast[[:blank:]]=[[:blank:]]0"	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "directed_broadcast = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.9 tcp_pmtu_discover"	 							>> `hostname`_Compliance.txt
no -a |grep "tcp_pmtu_discover[[:blank:]]=[[:blank:]]0"	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "tcp_pmtu_discover = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.10 bcastping"	 								>> `hostname`_Compliance.txt
no -a |grep "bcastping[[:blank:]]=[[:blank:]]0"	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "bcastping = 0"	 									>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.11 icmpaddressmask"	 							>> `hostname`_Compliance.txt
no -a |grep "icmpaddressmask[[:blank:]]=[[:blank:]]0"	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "icmpaddressmask = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.12 udp_pmtu_discover"	 							>> `hostname`_Compliance.txt
no -a |grep "udp_pmtu_discover[[:blank:]]=[[:blank:]]0"	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "udp_pmtu_discover = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.13 ipsrcrouterecv"	 								>> `hostname`_Compliance.txt
no -a |grep "ipsrcrouterecv[[:blank:]]=[[:blank:]]0"		 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "ipsrcrouterecv = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.14 nonlocsrcroute"	 								>> `hostname`_Compliance.txt
no -a |grep "nonlocsrcroute[[:blank:]]=[[:blank:]]0"	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "nonlocsrcroute = 0"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.15 tcp_tcpsecure"	 								>> `hostname`_Compliance.txt
no -a |grep "tcp_tcpsecure[[:blank:]]=[[:blank:]]7"	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "tcp_tcpsecure = 7"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.16 sockthresh"	 								>> `hostname`_Compliance.txt
no -a |grep "sockthresh[[:blank:]]=[[:blank:]]60"		 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: sockthresh = 60"	 			>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.17 rfc1323"	 								>> `hostname`_Compliance.txt
no -a |grep "rfc1323[[:blank:]]=[[:blank:]]1"	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "rfc1323 = 1"	 									>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.18 tcp_sendspace"	 								>> `hostname`_Compliance.txt
no -a |grep "tcp_sendspace[[:blank:]]=[[:blank:]]262144"	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "tcp_sendspace = 262144"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.19 tcp_recvspace"	 								>> `hostname`_Compliance.txt
no -a |grep "tcp_recvspace[[:blank:]]=[[:blank:]]262144"	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "tcp_recvspace = 262144"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.20 tcp_mssdflt"	 								>> `hostname`_Compliance.txt
no -a |grep "tcp_mssdflt[[:blank:]]=[[:blank:]]1448"	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "tcp_mssdflt = 1448"	 								>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.6.1.21 nfs_use_reserved_ports"	 							>> `hostname`_Compliance.txt
nfso -a |egrep "(portcheck|nfs_use_reserved_ports)[[:blank:]]=[[::blank::]]1"				>> `hostname`_Compliance.txt
echo "The above commands should yield the following output: "	 				>> `hostname`_Compliance.txt
echo "portcheck = 1 "	 								>> `hostname`_Compliance.txt
echo "nfs_use_reserved_ports = 1"	 							>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt

echo "2.7. Miscellaneous Enhancements"								>> `hostname`_Compliance.txt
echo "------------------------------------"								>> `hostname`_Compliance.txt
echo 											>> `hostname`_Compliance.txt

echo "2.7.1. Miscellaneous Enhancements"			 				>> `hostname`_Compliance.txt
echo "--------------------------------" 								>> `hostname`_Compliance.txt
echo 											>> `hostname`_Compliance.txt

echo "2.7.1.1 crontab access"	 								>> `hostname`_Compliance.txt
echo
grep "root|adm" /var/adm/cron/cron.allow	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 				>> `hostname`_Compliance.txt
echo "root "	 									>> `hostname`_Compliance.txt
echo "adm"	 									>> `hostname`_Compliance.txt
echo	 										>> `hostname`_Compliance.txt
echo "Please find the file /var/adm/cron/cron.allow"	>> `hostname`_Compliance.txt
echo "Start of file /var/adm/cron/cron.allow"		>> `hostname`_Compliance.txt
cat /var/adm/cron/cron.allow	>> `hostname`_Compliance.txt
echo "End of File /var/adm/cron/cron.allow"
echo	 										>> `hostname`_Compliance.txt
echo "Please find the file /var/adm/cron/cron.deny"	>> `hostname`_Compliance.txt
echo "Start of file /var/adm/cron/cron.deny"		>> `hostname`_Compliance.txt
cat /var/adm/cron/cron.deny	>> `hostname`_Compliance.txt
echo "End of File /var/adm/cron/cron.deny"
echo	 										>> `hostname`_Compliance.txt


echo "2.7.1.2 at access"	 									>> `hostname`_Compliance.txt
grep "root" /var/adm/cron/at.allow		 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 					>> `hostname`_Compliance.txt
echo "root"	 										>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.3 /etc/ftpusers"	 									>> `hostname`_Compliance.txt
grep "root" /etc/ftpusers		 								>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 					>> `hostname`_Compliance.txt
echo "root"	 										>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.4 login herald"	 									>> `hostname`_Compliance.txt
lssec -f /etc/security/login.cfg -s default -a herald |grep '^default[[:blank:]]herald="Unauthorized use of this system is prohibited.'	>> `hostname`_Compliance.txt

echo "The above command should yield the following output: "	 					>> `hostname`_Compliance.txt
echo "default herald="Unauthorized use of this system is prohibited.\nlogin:""	 				>> `hostname`_Compliance.txt
echo "Please find the output of file /etc/security/login.cfg"
cat /etc/security/login.cfg >> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.5 guest account removal"	 								>> `hostname`_Compliance.txt
lsuser guest	 										>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 					>> `hostname`_Compliance.txt
echo "3004-687 User "guest" does not exist."	 							>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.6 crontab permissions"	 								>> `hostname`_Compliance.txt
echo "From the command prompt, execute the following script: "	 					>> `hostname`_Compliance.txt
echo "crontab -l |egrep -v '^#' |awk '{print $6}' |grep "^/" |sort -u | while read"	 				>> `hostname`_Compliance.txt
#echo "DIR "	 										>> `hostname`_Compliance.txt
#echo "do "	 										>> `hostname`_Compliance.txt
#echo "DIR=${DIR:-$(pwd)}"	 									>> `hostname`_Compliance.txt
#echo "while [[ -a ${DIR} ]] "	 									>> `hostname`_Compliance.txt
#echo "do"	 											>> `hostname`_Compliance.txt
#echo "[[ "$(ls -ld ${DIR})" = @(????????w? *) ]] && print " WARNING ${DIR} is world writable" "			>> `hostname`_Compliance.txt
#echo "[[ "$(ls -ld ${DIR})" = @(?????w???? *) ]] && print " WARNING ${DIR} is group writable" "			>> `hostname`_Compliance.txt
#echo "[[ "$(ls -ld ${DIR} |awk '{print $3}')" != @(root|bin) ]] && print " WARNING ${DIR} is not owned by root or bin" "	>> `hostname`_Compliance.txt
#echo "DIR=${DIR%/*} "	 									>> `hostname`_Compliance.txt
#echo "done "	 										>> `hostname`_Compliance.txt
#echo "done"	 										>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.7 default umask"	 									>> `hostname`_Compliance.txt
lssec -f /etc/security/user -s default -a umask	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output: default umask=27"	 				>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.8 disabling core dumps"	 								>> `hostname`_Compliance.txt
lssec -f /etc/security/limits -s default -a core -a core_hard	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output: default core=0 core_hard=0"				>> `hostname`_Compliance.txt
echo "Ensure that the fullcore kernel parameter has been set to false: "						>> `hostname`_Compliance.txt
lsattr -El sys0 -a fullcore										>> `hostname`_Compliance.txt
echo "The above command should yield the following output: fullcore false Enable full CORE dump True"		>> `hostname`_Compliance.txt
echo ""	 											>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.9 AIX Auditing"	 											>> `hostname`_Compliance.txt
df -k /audit	 												>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 							>> `hostname`_Compliance.txt
echo "/dev/auditlv 262144 261776 1% 4 1% /audit"	 									>> `hostname`_Compliance.txt
echo "Validate the configuration in the /etc/security/audit/config file, this should match the changes made in the remediation section: "	>> `hostname`_Compliance.txt
cat /etc/security/audit/config	 									>> `hostname`_Compliance.txt
echo "Ensure that the /usr/lib/security/mkuser.default auditclasses entry has been updated: "			>> `hostname`_Compliance.txt
lssec -f /usr/lib/security/mkuser.default -s user -a auditclasses	 					>> `hostname`_Compliance.txt
echo "The above command should yield the following output: user auditclasses=general,SRC,cron,tcpip"		>> `hostname`_Compliance.txt
echo "Ensure that the cron audit rotation script has been implemented: "	 					>> `hostname`_Compliance.txt
crontab -l |grep "cronaudit"	 									>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 					>> `hostname`_Compliance.txt
echo "0 * * * * /etc/security/aixpert/bin/cronaudit"	 							>> `hostname`_Compliance.txt
echo "Ensure that the audit startup line has been added into /etc/inittab:"	 				>> `hostname`_Compliance.txt
lsitab audit	 										>> `hostname`_Compliance.txt
echo "This should echo: "	 									>> `hostname`_Compliance.txt
echo "audit:2:boot:audit start > /dev/console 2>&1 # Start audit"	 					>> `hostname`_Compliance.txt
echo ""	 											>> `hostname`_Compliance.txt

echo "2.7.1.10 Configuring syslog - local logging"	 >> `hostname`_Compliance.txt
echo "Please find the file /etc/syslog.conf"							>> `hostname`_Compliance.txt
cat /etc/syslog.conf 	>> `hostname`_Compliance.txt
echo "End of File /etc/syslog.conf"  >> `hostname`_Compliance.txt
echo ""		  >> `hostname`_Compliance.txt

tail -2 /etc/syslog.conf	 									>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 					>> `hostname`_Compliance.txt
echo "auth.info /var/adm/authlog rotate time 1w files 4 v"	 						>> `hostname`_Compliance.txt
echo "*.info;auth.none /var/adm/syslog rotate time 1w files 4"	 					>> `hostname`_Compliance.txt
echo "Check that the authlog and syslog files have been created: "	 					>> `hostname`_Compliance.txt
ls -l /var/adm/authlog /var/adm/syslog	 							>> `hostname`_Compliance.txt
echo "The output of the command above should list both files"	 					>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.11 Ensure that the Banner parameter has been changed: "	 					>> `hostname`_Compliance.txt
grep "^Banner[[:blank:]]" /etc/ssh/sshd_config	 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output: "	 					>> `hostname`_Compliance.txt
echo "Banner /etc/ssh/ssh_banner"	 								>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.12 Ensure the public entry has been commented out from /etc/snmpd.conf:"	 			>> `hostname`_Compliance.txt
grep "^#community[[:blank:]]*public" /etc/snmpd.conf 							>> `hostname`_Compliance.txt
echo "The above command should yield the following output: #community public"	 				>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.x Validate the permissions of /etc/security:"				>> `hostname`_Compliance.txt
ls -ld /etc/security | awk '{print $1 " " $3 " " $4 " " $9}'		>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"		>> `hostname`_Compliance.txt
echo "drwxr-x--- root security /etc/security"		>> `hostname`_Compliance.txt
echo "--------------------------------------"		>> `hostname`_Compliance.txt


echo "2.7.1.13 Validate the permissions of /etc/security: "	 						>> `hostname`_Compliance.txt
ls -ld /etc/security | awk '{print $1 " " $3 " " $4 " " $9}'	 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 					>> `hostname`_Compliance.txt
echo "drwxr-x--- root security /etc/security"	 							>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.14 Configuring SSH - disable null passwords "	 						>> `hostname`_Compliance.txt
grep "^PermitEmptyPasswords[[:blank:]]" /etc/ssh/sshd_config 						>> `hostname`_Compliance.txt
echo "The above command should yield the following output:"	 					>> `hostname`_Compliance.txt
echo "PermitEmptyPasswords no"	 							>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.7.1.15 All unlocked accounts must have a password "	 						>> `hostname`_Compliance.txt
echo "pwdck -n ALL" >> `hostname`_Compliance.txt
pwdck -n ALL						>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt
echo "-----------If 2nd field of /etc/shadow directory is empty for all active users then the control will be Non Compliant.-------------">> `hostname`_Compliance.txt
cat /etc/shadow >> `hostname`_Compliance.txt

echo "2.8. Encryption"			>> `hostname`_Compliance.txt
echo "2.8.1. Restrict Cipher list" 			>> `hostname`_Compliance.txt
echo "Please find the the/etc/ssh/sshd_config file"		>> `hostname`_Compliance.txt
cat /etc/ssh/sshd_config		>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo "2.8.2. Enable TLS 1.0 & Above protocol" 			>> `hostname`_Compliance.txt
echo "If the Web server is disabled on the server then control will be not applicable"	>> `hostname`_Compliance.txt
cat /etc/httpd/conf.d/ssl.conf		>> `hostname`_Compliance.txt
echo	 											>> `hostname`_Compliance.txt

echo Deloitte AIX Script Stopped
echo "-------------------------------END OF OUTPUT----------------------------"				>> `hostname`_Compliance.txt
echo										>> `hostname`_Compliance.txt
echo 										>> `hostname`_Compliance.txt
echo "########################################################################" 		>> `hostname`_Compliance.txt
echo "#              Refer "Hostname"Compliance.txt for Compliance Status	                             #"		>> `hostname`_Compliance.txt
echo "########################################################################" 		>> `hostname`_Compliance.txt
echo										>> `hostname`_Compliance.txt