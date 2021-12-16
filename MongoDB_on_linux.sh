#!/bin/sh

echo "#####################################################"	>>output.txt
echo ############################################################################################## 	>> output.txt
echo       Property of Deloitte Touche Tohmatsu India LLP 					                 	>> output.txt
echo       Copyright (c) 2021  Deloitte Touche Tohmatsu India LLP				                	>> output.txt
echo ############################################################################################## 	>> output.txt
echo "#Deloitte Configuration Interrogation Script For MongoDB on linux#"	>>output.txt

echo "############Server Information########################"	>>output.txt


echo "Hostname" 						>>output.txt
echo "--------"							>>output.txt	
hostname  							>>output.txt
echo 								>>output.txt
echo "Timestamp" 						>>output.txt
echo "--------"							>>output.txt
date 								>>output.txt
echo 								>>output.txt

#Banner

echo "Operating System"								>> output.txt
echo "----------------"								>> output.txt
cat /etc/motd									>> output.txt
echo										>> output.txt
cat /etc/issue									>> output.txt
echo										>> output.txt

#IP Configuration
echo "IP Address"								>> output.txt
echo "----------"								>> output.txt
/sbin/ifconfig -a|grep "inet addr"						>> output.txt
echo 										>> output.txt

echo "######################################"			>>output.txt
echo "2. Installation and Patching"			>>output.txt
echo "######################################"			>>output.txt

echo "2.1. Ensure the appropriate MongoDB software version/patches are installed."			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "Run the following command from within the MongoDB shell to determine if the MongoDB software version complies with your organization’s operational needs:"			>>output.txt
echo "db.version()"			>>output.txt

echo "######################################"			>>output.txt
echo "3. Authentication"			>>output.txt
echo "######################################"			>>output.txt

echo "3.1. Ensure that authentication is enabled for MongoDB databases."			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "Run	the	following	command	to	verify	whether	authentication	is	enabled	(Auth value	set	to	True)	on	the	MongoDB	server."			>>output.txt
cat /etc/mongod.conf | grep "Auth="			>>output.txt

echo "3.2. Ensure that MongoDB does not bypass authentication via the localhost exception"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "To	verify the	localhost	exception	is	disabled,	run	the	following	command	to	ensure	that enableLocalhostAuthBypass is	set	to	false"			>>output.txt
cat /etc/mongod.conf |grep "enableLocalhostAuthBypass"			>>output.txt

echo "3.3. Ensure authentication is enabled in the sharded cluster"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "Run	the	following	command	to	verify	that	the	keyfile parameter	is	configured:"			>>output.txt
cat /etc/mongod.conf | grep "keyFile="			>>output.txt

echo "3.4. Ensure an industry standard authentication mechanism is used"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "To	verify	the	authentication	mechanism	in	use	for	MongoDB,	run	the	following	commands:"			>>output.txt
cat /etc/mongod.conf | grep "clusterAuthMode:"			>>output.txt
cat /etc/mongod.conf | grep "mode:"			>>output.txt
cat /etc/mongod.conf | grep "authorization:"			>>output.txt
cat /etc/mongod.conf | grep "authenticationMechanisms:"			>>output.txt

echo "#######################################"			>>output.txt
echo "4.Access Control"			>>output.txt
echo "#######################################"			>>output.txt

echo "4.1. Ensure that role-based access control is enabled and configured appropriately"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "Connect	to	MongoDB	with	the	appropriate	privileges	and	run	the	following	command:"			>>output.txt
echo "mongo --port 27017 -u <siteUserAdmin> -p <password> --authenticationDatabase <database name>"			>>output.txt
echo "Identify	users'	roles	and	privileges:"			>>output.txt
echo "> db.getUser()"			>>output.txt
echo "> db.getRole()"			>>output.txt
echo "Verify	that	the	appropriate	role	or	roles	have	been	configured	for	each user"			>>output.txt

echo "4.2. Ensure that MongoDB only listens for network connections on authorized interfaces"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "1. Verify	that	network	exposure	is	limited,	review	the	settings	in	the	MongoDB	configuration	file:"			>>output.txt
cat /etc/mongod.conf |grep –A12 "net" | grep "bindIp"			>>output.txt
echo "2. Verify	the	relevant	network	settings	on	the	Linux	system	itself:"			>>output.txt
iptables –L

echo "4.3. Ensure that MongoDB is run using a non-privileged, dedicated service account"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "Run	the	following	command	to	get	listing	of	all	mongo	instances,	the	PID	number,	and	the	PID	owner."			>>output.txt
ps -ef | grep -E "mongos|mongod"			>>output.txt

echo "4.4. Ensure that each role for each MongoDB database is needed and grants only the necessary privileges"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "Perform	the	following	command	to	view	all	roles	on	the	database	on	which	the	command	 runs,	including	both	built-in	and	user-defined	roles,	as	well	as	the	privileges	granted	by	each	role."			>>output.txt
echo "Ensure	that	only	necessary	roles	are	listed	and	only	the	necessary	privileges	are	 listed	for	each	role."			>>output.txt
echo "db.runCommand("			>>output.txt
echo " {"			>>output.txt
echo " rolesInfo: 1,"			>>output.txt
echo " showPrivileges: true,"			>>output.txt
echo " showBuiltinRoles: true"			>>output.txt
echo " }"			>>output.txt
echo ")"			>>output.txt

echo "4.5. Review User-Defined Roles"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "Check	each	role	for	each	database	using	one	of	the	following	commands."			>>output.txt
echo "To	specify	a	role	from	the	current	database,	specify	the	role	by	its	name:"			>>output.txt
echo "db.runCommand( { rolesInfo: "<rolename>" } )"			>>output.txt
echo "To	specify	a	role	from	another	database,	specify	the	role	by	a	document	that	specifies	the	role	and	database:"			>>output.txt
echo "db.runCommand( { rolesInfo: { role: "<rolename>", db: "<database>" } } )"			>>output.txt

echo "4.6. Review Superuser/Admin Roles"		>>output.txt
echo "------------------------------------------------------------------"		>>output.txt
echo "Superuser	roles provide	the	ability	to	assign	any	user	any	privilege	on	any	database,	which	means	that	users	with	one	of	these	roles	can	assign	themselves	any	privilege	on	any	database:"     >>output.txt
echo "db.runCommand( { rolesInfo: "dbOwner" } )"		>>output.txt
echo "db.runCommand( { rolesInfo: "userAdmin" } )"		>>output.txt
echo "db.runCommand( { rolesInfo: "userAdminAnyDatabase" } )"		>>output.txt
echo "Root	role provides	access	to	the	operations	and	all	the	resources	of	the	readWriteAnyDatabase,	dbAdminAnyDatabase,	userAdminAnyDatabase,	clusterAdmin roles,	restore	combined."		>>output.txt
echo "db.runCommand( { rolesInfo: "readWriteAnyDatabase" } )"		>>output.txt
echo "db.runCommand( { rolesInfo: "dbAdminAnyDatabase" } )"		>>output.txt
echo "db.runCommand( { rolesInfo: "userAdminAnyDatabase" } )"		>>output.txt
echo "db.runCommand( { rolesInfo: "clusterAdmin" } )"		>>output.txt
echo "Cluster	Administration	Roles are	used	for	administering	the	whole	system	rather	than	just	a	single	database."		>>output.txt
echo "db.runCommand( { rolesInfo: "hostManager" } )"		>>output.txt

echo "##################################"		>>output.txt
echo "5. Data Encryption"		>>output.txt
echo "##################################"		>>output.txt

echo "5.1. Ensure TLS or SSL protects all network communications"		>>output.txt
echo "------------------------------------------------------------------"		>>output.txt
echo "To	verify	that	the	server	requires	SSL	or	TLS	use	(net.ssl.mode value	set	to	requireSSL), run	one	of	the	following	commands:"		>>output.txt
cat /etc/mongos.conf | grep –A20 'net' | grep –A10 'ssl' | grep 'mode'		>>output.txt

echo "##################################"			>>output.txt
echo "6. Auditing"			>>output.txt
echo "##################################"			>>output.txt

echo "6.1. Ensure that system activity is audited."			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "To	verify	that	system	activity	is	being	audited	for	MongoDB,	run	the	following	command	to	confirm	the	auditLog.destination value	is	set	correctly:"			>>output.txt
cat /etc/mongod.conf |grep –A4 "auditLog" | grep "destination"			>>output.txt

echo "6.2. Ensure that audit filters are configured properly"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "To	verify	that	audit	filters	are	configured	on	MongoDB	as	per	the	organization’s	requirements,	run	the	following	command:"			>>output.txt
cat /etc/mongod.conf |grep –A10 "auditLog" | grep "filter"			>>output.txt

echo "#############################"			>>output.txt
echo "7. Operating System Hardening"			>>output.txt
echo "#############################"			>>output.txt

echo "7.1. MongoDB Database Running with Least Privileges"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "Connect	MongoDB	Service"			>>output.txt
echo "mongod --port 27017 --dbpath /data/db1"			>>output.txt
echo "It	will	highlight	if	the	service	is	running	as	root	privilege	or	not."			>>output.txt

echo "7.2. Ensure that MongoDB uses a non-default port"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "To	verify	the	port	number	used	by	MongoDB,	execute	the	following	command	and	ensure	that	the	port	number	is	not	27017:"			>>output.txt
cat /etc/mongod.conf |grep "port"			>>output.txt

echo "7.3. Ensure that server-side scripting is disabled if not needed"		>>output.txt
echo "------------------------------------------------------------------"		>>output.txt
echo "If	server-side	scripting	is	not	required,	verify	that	it	is	disabled	(javascriptEnabled value of	false)	using	the	following	command:"		>>output.txt
cat /etc/mongod.conf | grep –A10 "security" | grep "javascriptEnabled"		>>output.txt

echo "############################"		>>output.txt
echo "8. File Permissions"		>>output.txt
echo "############################"		>>output.txt

echo "8.1. Ensure that key file permissions are set correctly"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "To	verify	the	permissions	for	the	MongoDB	key	file,	run	the	following	command:"			>>output.txt
cat /etc/mongod.conf | grep "keyFile:"			>>output.txt

echo "8.2. Ensure that database file permissions are set correctly"			>>output.txt
echo "------------------------------------------------------------------"			>>output.txt
echo "To	verify	that	the	permissions	for	the	MongoDB	database	file	are	configured	securely,	run	the	following	commands."			>>output.txt
echo "Find	out	the	database	location	using	the	following	command:"			>>output.txt
cat /etc/mongod.conf |grep "dbpath"			>>output.txt

echo "########################################END#########################################"			>>output.txt