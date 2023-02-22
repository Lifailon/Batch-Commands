@echo off
chcp 65001
cls
set /p username="Enter user name: "
rd /s /q "\\profiles-01\Profiles\%username%\AppData\Roaming\1C\1cv8\"
rd /s /q "\\profiles-01\Profiles\%username%\AppData\Roaming\1C\1cv82\"
dir "\\profiles-01\Profiles\%username%\AppData\Roaming\1C"
pause