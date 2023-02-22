@echo off
chcp 65001
cls
set /p username="Enter user name: "
md \\fs2\users\%username%
md \\fs2\users\%username%\Drive
md \\fs2\users\%username%\ConsUserData
cacls \\fs2\users\%username% /e /g %username%@domain.local:C
cacls \\fs2\users\%username%\Drive /e /g %username%@domain.local:C
cacls \\fs2\users\%username%\ConsUserData /e /g %username%@domain.local:C
pause