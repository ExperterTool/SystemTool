@echo off
reg add HKLM /v AdminCheck /t REG_DWORD /d 0 /f >nul 2>nul
if "%errorlevel%" == "1" (
    echo @echo off > %temp%\getadmin.bat
    echo powershell Start-Process "%CD%\SystemTool.bat" -verb RunAs >> %temp%\getadmin.bat
    echo exit >> %temp%\getadmin.bat
    start %temp%\getadmin.bat
    exit
) else (
    reg delete HKLM /v AdminCheck /f >nul 2>nul
)
del /f /q %temp%\getadmin.bat >nul 2>nul
:start
title SystemTool
color b
cls
echo.
echo.
echo.
echo              ###################################
echo              #                                 #
echo              #       --^> SystemTool ^<--        #
echo              #                                 #
echo              ###################################
echo.
echo.
echo.
echo              To check the available commands, type:
echo                                                 --^> .help ^<--
echo.
:systemtool_cmd
echo.
set /p "systemtool_cmd=Command: "
if "%systemtool_cmd%" == ".stopthetime" (
    set "et_time=%time%"
    cls
    echo.
    echo Time Stopped!
    echo.
    echo Date: %date%
    echo Time: %time%
    goto stopthetime
)
if "%systemtool_cmd%" == ".v" (
    echo Version: v12
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".version" (
    echo Version: v12
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".support" (
    echo.
    echo Email Support: expertertool@outlook.com
    echo.
    echo Gmail Email Support: expertertool@gmail.com
    echo.
    echo YouTube: https://www.youtube.com/channel/UCV92mEdx4YIsRYB2-PxmFBQ?sub_confirmation=1
    echo.
    echo GitHub: https://github.com/ExperterTool
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".exit" (
    exit
)
if "%systemtool_cmd%" == ".rdp /reset port" (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 3389 /f >nul 2>nul
    echo Successfully reset the RDP Port to: 3389
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".rdp /change port" (
    goto rdp_port_change
)
if "%systemtool_cmd%" == ".clear" (
    cls
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /unactivate" (
    cscript //nologo C:\Windows\System32\slmgr.vbs /upk >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /cpky >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
    echo Successfully unactivated Windows!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /activate 7 /ultimate" (
    cscript //nologo C:\Windows\System32\slmgr.vbs /upk >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /cpky >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /ipk D4F6K-QK3RD-TMVMJ-BBMRX-3MBMV >nul 2>nul
    echo Successfully Activated Windows 7 Ultimate!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /activate 10" (
    echo Please Wait...
    cscript //nologo C:\Windows\System32\slmgr.vbs /upk >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /cpky >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /skms s8.uk.to >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /ato >nul 2>nul
    cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
    echo Successfully Activated Windows 10 Pro/Enterprise!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /enable cortana" (
    reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /f >nul 2>nul
    echo Successfully enabled Windows 10 Cortana!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /enable defender" (
    reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /f >nul 2>nul
    echo Successfully enabled Windows Defender!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /enable auto-update" (
    reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /f >nul 2>nul
    echo Successfully enabled Windows 10 Auto-Updates!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /disable cortana" (
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>nul
    echo Successfully disabled Windows 10 Cortana!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /disable defender" (
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>nul
    echo Successfully disabled Windows Defender!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /disable auto-update" (
    reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul 2>nul
    echo Successfully disabled Windows 10 Auto-Updates!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".deltemp" (
    del /f /s /q %temp% >nul 2>nul
    del /f /s /q %windir%\temp >nul 2>nul
    del /f /s /q %windir%\prefetch >nul 2>nul
    del /f /s /q %windir%\debug >nul 2>nul
    del /f /s /q %windir%\logs >nul 2>nul
    echo Successfully deleted the temporary files!
    goto systemtool_cmd
)
if "%systemtool_cmd%" == ".help" (
    echo.
    echo Available Commands:
    echo.
    echo   .help               It shows you the available commands!
    echo.
    echo   .clear              It clears the console log!
    echo.
    echo   .deltemp            [ADMIN_REQUIRED]
    echo                       It deletes the temporary files from the local user and Windows!
    echo.
    echo   .settings /disable auto-update
    echo                       [ADMIN_REQUIRED] [WINDOWS 10 REQUIRED]
    echo                       It disables the Windows 10 Auto Updates!
    echo.
    echo   .settings /disable defender
    echo                       [ADMIN_REQUIRED]
    echo                       It disables the Windows Defender!
    echo.
    echo   .settings /disable cortana
    echo                       [ADMIN_REQUIRED] [WINDOWS 10 REQUIRED]
    echo                       It disables the Windows 10 Cortana!
    echo.
    echo   .settings /enable auto-update
    echo                       [ADMIN_REQUIRED] [WINDOWS 10 REQUIRED]
    echo                       It enables back the Windows 10 Auto Update!
    echo.
    echo   .settings /enable defender
    echo                       [ADMIN_REQUIRED]
    echo                       It enables back the Windows Defender!
    echo.
    echo   .settings /enable cortana
    echo                       [ADMIN_REQUIRED] [WINDOWS 10 REQUIRED]
    echo                       It enables back the Windows 10 Cortana!
    echo.
    echo   .settings /activate 10
    echo                       [ADMIN_REQUIRED] [WINDOWS 10 PRO/ENTERPRISE REQUIRED]
    echo                       It activates Windows 10 Pro/Enterprise!
    echo.
    echo   .settings /activate 7
    echo                       [ADMIN_REQUIRED] [WINDOWS 7 ULTIMATE REQUIRED]
    echo                       It activates Windows 7 Ultimate for the next 30 days!
    echo.
    echo   .settings /unactivate
    echo                       [ADMIN_REQUIRED]
    echo                       It unactivates Windows, if it's activated!
    echo.
    echo   .rdp /change port   [ADMIN_REQUIRED]
    echo                       It changes the RDP Port!
    echo.
    echo   .rdp /reset port    [ADMIN_REQUIRED]
    echo                       It resets the RDP Port to 3389!
    echo.
    echo   .exit               It will close this application!
    echo.
    echo   .support            It gives you Email Support!
    echo.
    echo   .version            It's showing the current version of this application!
    echo.
    echo   .stopthetime        [ADMIN_REQUIRED]
    echo                       It stops the Windows Time!
) else (
    echo Sorry! This command is unavailable.
)
goto systemtool_cmd
:rdp_port_change
echo.
set /p rdp_port_number="RDP Port Number: "
if "%rdp_port_number%" == ".cancel" (
    echo Canceled!
    goto systemtool_cmd
) else (
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d %rdp_port_number% /f >nul 2>nul
    echo Successfully changed the RDP Port to: %rdp_port_number%
    goto systemtool_cmd
)
:stopthetime
time %et_time%
timeout /t 0 /nobreak >nul
goto stopthetime
