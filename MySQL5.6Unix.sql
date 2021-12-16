Created Date - 16/12/2019
Script Version - 1
+++++++++++++++++++++++Script Execution On MySQL Unix Platform++++++++++++++++++++++++

======2.1. Auditing & Logging ==============
MySQL_2.1.1. Enable logging in MySQL
show variables like '%log%';

MySQL_2.1.2 Ensure 'log_error' Is Not Empty 
SHOW variables LIKE 'log_error';

MySQL_2.1.3 Ensure 'log_warnings' Is Set to '2' 
SHOW GLOBAL VARIABLES LIKE 'log_warnings';

=====2.2. Password Management=========

MySQL_2.2.1. Protect root account of MySQL with strong password
---Manual check----

MySQL_2.2.2 Do Not Specify Passwords in Command Line 
---Manual check----

MySQL_2.2.3 Ensure Password Policy Is in Place 
SHOW VARIABLES LIKE 'validate_password%';

======2.3. System Configuration=======
MySQL_2.3.1. Encrypt traffic to MySQL server
SHOW VARIABLES LIKE 'have_openssl';

MySQL_2.3.2. Run MySQL under other user id and gid
---Manual check----

MySQL_2.3.3. Start up MySQL with the parameter to disable the use of symlinks
SHOW VARIABLES LIKE 'have_symlink';

MySQL_2.3.4. Remove sample preinstalled databases
SELECT name FROM sys.databases WHERE name LIKE 'AdventureWorks%' OR name = 'pubs' OR name = 'Northwind';

MySQL_2.3.5 Disable TCP networking from MySQL
show variables like 'skip_networking';

MySQL_2.3.6 Remove the MySQL history file
---Manual check----

MySQL_2.3.7 MySQL should be run on a non default port
SHOW GLOBAL VARIABLES LIKE 'PORT';

MySQL_2.3.8 Place Databases on Non-System Partitions
show variables where variable_name = 'datadir';
-----replace the <datadir> with the output of above command and run df -h <datadir Value>----

MySQL_2.3.9 Verify That the MYSQL_PWD Environment Variables Is Not In Use
--------check implemented in .sh file---------

MySQL_2.3.10 Backup policy in place 
--------check implemented in .sh file---------

MySQL_2.3.11 Ensure the 'test' Database Is Not Installed 
SHOW DATABASES LIKE 'test';

MySQL_2.3.12 Ensure the 'daemon_memcached' Plugin Is Disabled 
SELECT * FROM information_schema.plugins WHERE PLUGIN_NAME='daemon_memcached' ;

=======2.4. User Rights and Security Options=======

MySQL_2.4.1. Prevent anonymous access to MySQL
SELECT user from mysql.user where user = '';

MySQL_2.4.2. Sensitive privileges granted to unnecessary users
SELECT user, host from mysql.user where (Select_priv = 'Y') or (Insert_priv = 'Y') or (Update_priv = 'Y') or (Delete_priv = 'Y') or (Create_priv = 'Y') or (Drop_priv = 'Y');
SELECT user, host from mysql.db where db = 'mysql' and ( (Select_priv = 'Y') or (Insert_priv = 'Y') or (Update_priv = 'Y') or (Delete_priv = 'Y') or (Create_priv = 'Y') or (Drop_priv = 'Y'));

MySQL_2.4.3. Disable unauthorized reading from local files
show variables like 'local_infile';

MySQL_2.4.4. Rename the administrator account
SELECT name, is_disabled FROM sys.server_principals WHERE name = sa;

MySQL_2.4.5. Review list of privileges granted to user
show variables like 'skip_grant_tables';

MySQL_2.4.6. Restrict connections for a single user
show status like '%onn%';

MySQL_2.4.7 Disable Interactive Login 
--------check implemented in .sh file---------

MySQL_2.4.8 Ensure 'datadir' Has Appropriate Permissions
show variables where variable_name = 'datadir'
--------further check implemented in .sh file---------

MySQL_2.4.9 Ensure 'log_error' Has Appropriate Permissions 
show variables like 'log_error';
--------manually verify the said permissions--------

MySQL_2.4.10 Ensure Plugin Directory Has Appropriate Permissions 
show variables where variable_name = 'plugin_dir';
-------Replace <plugin_dir Value> with obtained value and run this command ls -l <plugin_dir Value>/.. | egrep "^drwxr[-w]xr[-w]x[ \t]*[0-9][ \t]*mysql[\t]*mysql.*plugin.*$"------

MySQL_2.4.11 Ensure 'old_passwords' Is Not Set to '1' or 'ON' 
SHOW VARIABLES WHERE Variable_name = 'old_passwords';

=======2.5. Security Settings=======

MySQL_2.5.1 Ensure latest security patches installed
SHOW VARIABLES LIKE ‘%version%’;

MySQL_2.5.2 Ensure 'have_ssl' is set to 'YES'
SHOW GLOBAL VARIABLES LIKE '%ssl%';
STATUS;

MySQL_2.5.3 Ensure that the strong ciphers are configured
SHOW SESSION STATUS LIKE 'Ssl_cipher_list';
SHOW GLOBAL VARIABLES LIKE 'tls_version';

MySQL_2.5.4 Do Not Use Default or Non-MySQL-specific Cryptographic Keys 
---Manual check----

MySQL_2.5.5 Ensure 'secure_auth' is set to 'ON' 
SHOW VARIABLES WHERE Variable_name = 'secure_auth';

=======2.6. Disaster Recovery=======

MySQL_2.6.1 Disaster recovery plan
---Manual check----

+++++++++++++Script End+++++++++++++++++++++++++++