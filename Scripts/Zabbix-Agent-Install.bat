@echo off
chcp 65001
:start
cls

echo 1. Open port to Firewall
echo 2. Setup service Zabbix Agent
echo 3. Start service Zabbix Agent
echo 4. Stop service Zabbix Agent
echo 5. Remove service Zabbix Agent

set /P num="Enter: "

if %num% equ 1 cls
if %num% equ 1 netsh advfirewall firewall add rule name="Zabbix-Agent" dir=in action=allow localport=10050-10051 protocol=TCP enable=yes
if %num% equ 1 netsh advfirewall firewall show rule name="Zabbix-Agent"
if %num% equ 1 (pause & goto start)

if %num% equ 2 "C:\zabbix_agent2-6.2.4\bin\zabbix_agent2.exe" --config "C:\zabbix_agent2-6.2.4\conf\zabbix_agent2.conf" --install
if %num% equ 2 (pause & goto start)

if %num% equ 3 "C:\zabbix_agent2-6.2.4\bin\zabbix_agent2.exe" --config "C:\zabbix_agent2-6.2.4\conf\zabbix_agent2.conf" --start
if %num% equ 3 (pause & goto start)

if %num% equ 4 "C:\zabbix_agent2-6.2.4\bin\zabbix_agent2.exe" --config "C:\zabbix_agent2-6.2.4\conf\zabbix_agent2.conf" --stop
if %num% equ 4 (pause & goto start)

if %num% equ 5 "C:\zabbix_agent2-6.2.4\bin\zabbix_agent2.exe" --config "C:\zabbix_agent2-6.2.4\conf\zabbix_agent2.conf" --uninstall
if %num% equ 5 (pause & goto start)