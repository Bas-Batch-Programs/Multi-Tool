@echo off
echo Loading Network Information...
  
:loop
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "SSID" ^|=findstr /v "BSSID"') do set ssid=%%a 
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Signal"') do set Signal=%%a 
for /f "tokens=2 delims=:" %%a in ('netsh wlan show interface ^| find "Description"') do set Description=%%a 
for /f "tokens=4 delims==" %%a in ('ping -n 2 62.179.104.196 ^| find "Average"') do set ping=%%a 
cls
echo Network Info:
echo ==================
echo SSID:%ssid% 
echo Signal:%Signal% 
echo Network Inteface Card:%Description% 
echo. 
echo Latency:
echo ========
echo Pinging Ziggo DNS:%ping% 
goto loop