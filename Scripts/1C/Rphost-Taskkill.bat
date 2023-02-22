set LOG_FILE="scripts.log"
set SERVICE_1C_NAME="1C:Enterprise 8.3 Server Agent (x86-64) 1540 8.3.18.1741"
set CNTX_PATH="C:\Program Files\1cv8\srvinfo\reg_1541"
set PFL_PATH="C:\ProgramData\1C\1cv8"
set TEMP_PATH="C:\Users\su_1C\AppData\Local\Temp\"
echo stop %DATE% %TIME% >> %TEMP_PATH%\%LOG_FILE%
sc stop %SERVICE_1C_NAME%
timeout 60
taskkill /f /im "rphost.exe"
taskkill /f /im "rmngr.exe"
taskkill /f /im "ragent.exe"
timeout 5
echo done stop %DATE% %TIME% >> %TEMP_PATH%\%LOG_FILE%
echo clean temp %DATE% %TIME% >> %TEMP_PATH%\%LOG_FILE%
DEL /Q /F /S %CNTX_PATH%\snccntx*
DEL /Q /F %PFL_PATH%\*.pfl
DEL /Q /F /S %TEMP_PATH%\*.*
echo done clean temp %DATE% %TIME% >> %TEMP_PATH%\%LOG_FILE%
echo start %DATE% %TIME% >> %TEMP_PATH%\%LOG_FILE%
sc start %SERVICE_1C_NAME%
echo Service %SERVICE_1C_NAME% restarted at %DATE% %TIME% >> %TEMP_PATH%\%LOG_FILE%