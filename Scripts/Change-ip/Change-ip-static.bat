@echo off
chcp 65001
color 9
cls
netsh interface ip show interface
set /p ip="Enter ip-address: "
netsh interface ip set address name="Ethernet" static %ip% 255.255.255.0 192.168.1.254
netsh interface ip set dns "Ethernet" static 192.168.1.1
netsh interface ip add dns "Ethernet" 192.168.1.2
timeout 5
netsh interface ip show config
pause