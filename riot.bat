@echo off

echo Hledam Riot Klient

for /f "tokens=*" %%a in ('reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall /f "Riot Client" /s /d /e /reg:32') do set reg_output=%%a

if "%reg_output%"=="" (
  echo Riot Klient neni nainstalovan na tomhle pocitaci
) else (
  for /f "tokens=2*" %%b in ('reg query "%reg_output%" /v UninstallString') do set uninstall_string=%%c
  set uninstall_string=%uninstall_string:~1,-1%

  echo Mazu Riot Client

  %uninstall_string% /qn

  if %errorlevel%==0 (
    echo Riot klient se uspense vymazal
  ) else (
    echo Nepodarilo se vymazat riot client
  )
)

pause
