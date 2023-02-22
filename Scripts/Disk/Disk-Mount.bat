@echo off 
net use X: /delete
net use X: \\fs2\users\%username%\drive
exit 1