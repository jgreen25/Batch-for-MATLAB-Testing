SETLOCAL EnableDelayedExpansion
dir /b > fileslist.txt
FOR /F "tokens=*" %%A in (fileslist.txt) DO (
matlab -nosplash -r "try; run('C:\Users\jlgree13\%%A'); catch; end; quit"
SET go=0
TIMEOUT /t 3 /nobreak
call :while1 )
exit /b
:while1
If "%go%"=="1" goto:cont1
If "%go%"=="0" tasklist /FI "IMAGENAME eq matlab.exe" 2>NUL | find /I /N "matlab.exe">NUL
If not "%ERRORLEVEL%"=="0" set go=1
goto:while1
:cont1
exit /b