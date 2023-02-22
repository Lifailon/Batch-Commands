@echo off
chcp 65001
color 9
cls
netsh interface ip set address name="Ethernet" dhcp
netsh interface ip set dns "Ethernet" dhcp
timeout 5
netsh interface ip show config
pause