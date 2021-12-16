\echo "# Deloitte PostgreSQL Secure Configuration Review Script#"		
\echo "# Property of Deloitte Touche Tohmatsu India LLP  #" 		
\echo "# Copyright (c) 2019 Deloitte Touche Tohmatsu India LLP #" 		


\echo "2.1 Audit, Monitoring and Logging "																
\echo "2.1.1 Event logging should be enabled "														
\echo "=============================================================="								 
show logging_collector;																	 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.2 Ensure the log destinations are set correctly "											 
\echo "=============================================================="								 
show log_destination;																	 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.3 Ensure the log file destination directory is set correctly "							 
\echo "=============================================================="								 
show log_directory;																		 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.4 Ensure the filename pattern for log files is set correctly "							 
\echo "=============================================================="								 
 show log_filename;																		 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.5 Ensure the log file permissions are set correctly "										 
\echo "=============================================================="								 
 show log_file_mode;																		 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.6 Ensure 'log_truncate_on_rotation' is enabled "											 
\echo "=============================================================="								 
 show log_truncate_on_rotation;															 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.7 Ensure the maximum log file lifetime is set correctly "									 
\echo "=============================================================="								 
 show log_rotation_age;																	 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.8 Ensure the correct syslog facility is selected  "										 
\echo "=============================================================="								 
 show syslog_facility;																	 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.9 Ensure the correct SQL statements generating errors are recorded "						 
\echo "=============================================================="								 
 show log_min_error_statement;															 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.10 Ensure 'log_connections' is enabled "													 
\echo "=============================================================="								 
 show log_connections;																	 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.11 Ensure 'log_timezone' is set correctly "												 
\echo "=============================================================="								 
 show log_timezone;	 																	 
\echo "=============================================================="								 

\echo "2.1 Audit, Monitoring and Logging "															 	
\echo "2.1.11 Ensure 'log_timezone' is set correctly "												 
\echo "=============================================================="								 
 show log_timezone;	 																	 
\echo "=============================================================="								 

\echo "2.2 Password Management "																		 	
\echo "2.2.1 Unsecured PostgreSQL password file "													 
\echo "=============================================================="								 
\echo " Manual check "			 																	 
\echo "=============================================================="								 

\echo "2.2 Password Management "																		 	
\echo "2.2.2 Strong Password policy should be implemented "											 
\echo "=============================================================="								 
\echo " Manual check "			 																	 
\echo "=============================================================="								 

\echo "2.3 System Configuration "																	 	
\echo "2.3.1 SSL communicationshould be enabled "													 
\echo "=============================================================="								 
 SHOW ssl;			 																	 
 SELECT name, setting, source FROM pg_settings WHERE name = 'ssl';						 
\echo "=============================================================="								 

\echo "2.3 System Configuration "																	 	
\echo "2.3.2  Latest Security patches are not installed "											 
\echo "=============================================================="								 
\echo " Manual Check "																				 
\echo "=============================================================="								 
 
\echo "2.4 User Rights and Security Options "														 	
\echo "2.4.1 Host Based Authentication (HBA) is insecurely configured "								 
\echo "=============================================================="								 
\echo " Manual Check "																				 
\echo "=============================================================="								 

\echo "2.4 User Rights and Security Options "														 	
\echo "2.4.2 Inadequate permissions on database "													 
\echo "=============================================================="								 
\echo " Manual Check "																				 
\echo "=============================================================="								 

\echo "2.4 User Rights and Security Options "														 	
\echo "2.4.3 Inadequate permissions on database objects "											 
\echo "=============================================================="								 
\echo " Manual Check "																				 
\echo "=============================================================="								 

\echo "2.4 User Rights and Security Options "														 	
\echo "2.4.5 Ensure the set_user extension is installed "											 
\echo "=============================================================="								 
 select * from pg_available_extensions where name = 'set_user';							 
\echo "=============================================================="								 

\echo "2.5 Security Settings "																		 	
\echo "2.5.1 Do not use default port "																 
\echo "=============================================================="		s						 
\echo " Manual Check "																				 
\echo "=============================================================="								 

\echo "2.6 Directory & File permission "																 	
\echo "2.6.1 Ensure the file permissions mask is correct  "											 
\echo "=============================================================="								 
\echo " Manual Check "																				 
\echo "=============================================================="								 
