@echo off
color b
reg add HKLM /v AdminCheck /t REG_DWORD /d 0 /f >nul 2>nul
if not %errorlevel% == 0 (
set admin_rights=0
goto start
) else (
reg delete HKLM /v AdminCheck /f >nul 2>nul
set admin_rights=1
goto start
)
:start
title SystemTool
cls
echo.
echo.
echo.
echo              ###################################
echo              #                                 #
echo              #           SystemTool            #
echo              #                                 #
echo              ###################################
echo.
echo.
echo.
echo              To check the available commands, type:
echo                                                     .help
echo.
:systemtool_cmd
echo.
set /p systemtool_cmd="Command: "
if "%systemtool_cmd%" == ".updatelog" (
echo.
echo Update v5.0:
echo - Added new types of activation:
echo   -       Windows 10 Enterprise
echo   - [NEW] Windows 11 Enterprise
echo   - [NEW] Windows 10 Pro
echo   - [NEW] Windows 11 Pro
echo.
echo Update v4.0:
echo - Added .updatelog Command
echo.
echo Update v3.0
echo - Added .checkadmin Command
echo.
echo Update v2.0
echo - Added .version Command
echo.
echo Update v1.0
echo - The first release!
goto systemtool_cmd
)
if "%systemtool_cmd%" == ".checkadmin" (
if "%admin_rights%" == "1" (
echo Running as Administrator!
goto systemtool_cmd
) else (
echo Running in Normal Mode!
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".v" (
echo Version: v5.0
goto systemtool_cmd
)
if "%systemtool_cmd%" == ".version" (
echo Version: v5.0
goto systemtool_cmd
)
if "%systemtool_cmd%" == ".support" (
echo.
echo Email Support: expertertool@pm.me
echo                expertertool@protonmail.com
echo.
echo Discord Support: https://discord.gg/sUBvbGkwT7
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
if "%admin_rights%" == "1" (
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d 3389 /f >nul 2>nul
echo Successfully reset the RDP Port to: 3389
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".rdp /change port" (
if "%admin_rights%" == "1" (
goto rdp_port_change
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".clear" (
cls
goto systemtool_cmd
)
if "%systemtool_cmd%" == ".settings /unactivate" (
if "%admin_rights%" == "1" (
cscript //nologo C:\Windows\System32\slmgr.vbs /upk >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /cpky >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
echo Successfully unactivated Windows!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /activate 7 /ultimate" (
if "%admin_rights%" == "1" (
cscript //nologo C:\Windows\System32\slmgr.vbs /upk >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /cpky >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk D4F6K-QK3RD-TMVMJ-BBMRX-3MBMV >nul 2>nul
echo Successfully Activated Windows 7 Ultimate!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /activate 11 /pro" (
if "%admin_rights%" == "1" (
cscript //nologo C:\Windows\System32\slmgr.vbs /upk >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /cpky >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /skms s8.uk.to >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ato >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
echo Successfully Activated Windows 11 Pro!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /activate 10 /pro" (
if "%admin_rights%" == "1" (
cscript //nologo C:\Windows\System32\slmgr.vbs /upk >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /cpky >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /skms s8.uk.to >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ato >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
echo Successfully Activated Windows 10 Pro!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /activate 11 /enterprise" (
if "%admin_rights%" == "1" (
cscript //nologo C:\Windows\System32\slmgr.vbs /upk >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /cpky >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /skms s8.uk.to >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ato >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
echo Successfully Activated Windows 11 Enterprise!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /activate 10 /enterprise" (
if "%admin_rights%" == "1" (
cscript //nologo C:\Windows\System32\slmgr.vbs /upk >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /cpky >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /skms s8.uk.to >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ato >nul 2>nul
cscript //nologo C:\Windows\System32\slmgr.vbs /ckms >nul 2>nul
echo Successfully Activated Windows 10 Enterprise!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /enable cortana" (
if "%admin_rights%" == "1" (
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /f >nul 2>nul
echo Successfully enabled Windows 10 Cortana!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /enable defender" (
if "%admin_rights%" == "1" (
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /f >nul 2>nul
echo Successfully enabled Windows Defender!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /enable auto-update" (
if "%admin_rights%" == "1" (
reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /f >nul 2>nul
echo Successfully enabled Windows 10 Auto-Updates!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /disable cortana" (
if "%admin_rights%" == "1" (
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>nul
echo Successfully disabled Windows 10 Cortana!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /disable defender" (
if "%admin_rights%" == "1" (
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul 2>nul
echo Successfully disabled Windows Defender!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".settings /disable auto-update" (
if "%admin_rights%" == "1" (
reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 1 /f >nul 2>nul
echo Successfully disabled Windows 10 Auto-Updates!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
)
if "%systemtool_cmd%" == ".deltemp" (
if "%admin_rights%" == "1" (
del /f /s /q %temp% >nul 2>nul
del /f /s /q %windir%\temp >nul 2>nul
del /f /s /q %windir%\prefetch >nul 2>nul
del /f /s /q %windir%\debug >nul 2>nul
del /f /s /q %windir%\logs >nul 2>nul
echo Successfully deleted the temporary files!
goto systemtool_cmd
) else (
echo Sorry! This command is running only as Administrator.
goto systemtool_cmd
)
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
echo   .settings /activate 11 /pro
echo                       [ADMIN_REQUIRED] [WINDOWS 10 REQUIRED]
echo                       It activates Windows 10 Enterprise!
echo.
echo   .settings /activate 11 /enterprise
echo                       [ADMIN_REQUIRED] [WINDOWS 10 REQUIRED]
echo                       It activates Windows 10 Enterprise!
echo.
echo   .settings /activate 10 /pro
echo                       [ADMIN_REQUIRED] [WINDOWS 10 REQUIRED]
echo                       It activates Windows 10 Enterprise!
echo.
echo   .settings /activate 10 /enterprise
echo                       [ADMIN_REQUIRED] [WINDOWS 10 REQUIRED]
echo                       It activates Windows 10 Enterprise!
echo.
echo   .settings /activate 7
echo                       [ADMIN_REQUIRED] [WINDOWS 7 REQUIRED]
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
echo   .checkadmin         Checks if the current session is running as Administrator
echo                       or as Normal User!
) else (
echo Sorry! This command is unavailable.
)
goto systemtool_cmd
:rdp_port_change
echo.
set /p rdp_port_number="RDP Port Number: "
if "%rdp_port_number%" == "cancel" (
echo Canceled!
goto systemtool_cmd
) else (
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber /t REG_DWORD /d %rdp_port_number% /f >nul 2>nul
echo Successfully changed the RDP Port to: %rdp_port_number%
goto systemtool_cmd
)
