@echo off

Echo ORA_W11g_00 SYSTEM INFORMATION>> Oracle11g_Windows.txt
Echo ORA_W11g_00_STARTS >> Oracle11g_Windows.txt
Echo SCRIPT VERSION - 1.0 >> Oracle11g_Windows.txt
Echo.  >> Oracle11g_Windows.txt
Echo The Name of the Server >> Oracle11g_Windows.txt
hostname >> Oracle11g_Windows.txt
Echo.  >> Oracle11g_Windows.txt
Echo The Operating System of the Server >> Oracle11g_Windows.txt
ver >> Oracle11g_Windows.txt
Echo.  >> Oracle11g_Windows.txt
Echo Today's Date  >> Oracle11g_Windows.txt
date /t >> Oracle11g_Windows.txt
Echo.  >> Oracle11g_Windows.txt
Echo Network Configuration >> Oracle11g_Windows.txt
ipconfig /all >> Oracle11g_Windows.txt
Echo.  >> Oracle11g_Windows.txt
for /f "delims=" %%d in (oraclehome.txt) do set orahome=%%d
Echo ORACLE HOME: %orahome% >>Oracle11g_Windows.txt
Echo.  >> Oracle11g_Windows.txt
Echo ORA_W11g_00_ENDS >> Oracle11g_Windows.txt

echo --------------END OF OUTPUT-------------- >>Oracle11g_Windows.txt
del password_equals_username.txt
del host.bat
del password_equals_username.run
del file_Permissions.txt
del oraclehome.txt