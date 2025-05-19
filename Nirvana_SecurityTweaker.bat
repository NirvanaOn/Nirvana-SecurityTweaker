@echo off
title Nirvana's Safe Security Tweaker
:: Batch script to disable and revert security features including notifications

:: Check for Admin Privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting Administrative privileges...
    goto UACPrompt
) else (
    goto ShowMenu
)

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c %~s0", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:ShowMenu
cls
echo ============================
echo Nirvana's Safe Security Tweaker
echo ============================
echo [1] Disable Security Features (Defender, SmartScreen, Firewall, Notifications)
echo [2] Revert Security Features (Enable Defender, SmartScreen, Firewall, Notifications)
echo [3] Exit
echo ============================
set /p choice="Choose an option: "

if "%choice%"=="1" goto DisableSecurity
if "%choice%"=="2" goto RevertSecurity
if "%choice%"=="3" exit
goto ShowMenu

:DisableSecurity
echo Disabling Windows Defender and related features...
:: Disable Real-Time Protection via registry
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: Disable SmartScreen
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f

:: Disable Windows Firewall
netsh advfirewall set allprofiles state off

:: Disable UAC (User Account Control)
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f

:: Disable Tamper Protection (manual disable needed for Windows Defender)
echo Please turn off Tamper Protection manually in Windows Security settings.

:: Disable Windows Notifications
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications" /v "SilentMode" /t REG_DWORD /d 1 /f

echo Security features and notifications disabled. Please reboot your system for full effect.
pause
goto ShowMenu

:RevertSecurity
echo Reverting security changes...
:: Re-enable Real-Time Protection via registry
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"

:: Re-enable SmartScreen
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "RequireAdmin" /f

:: Re-enable Windows Defender
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $false"
powershell -Command "Set-MpPreference -DisableBehaviorMonitoring $false"
powershell -Command "Set-MpPreference -DisableIOAVProtection $false"
powershell -Command "Set-MpPreference -DisableIntrusionPreventionSystem $false"
powershell -Command "Set-MpPreference -EnableControlledFolderAccess Enabled"
powershell -Command "Set-MpPreference -PUAProtection 1"

:: Re-enable Windows Firewall
netsh advfirewall set allprofiles state on

:: Re-enable UAC (User Account Control)
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f

:: Re-enable Windows Notifications
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" /v "NOC_GLOBAL_SETTING" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Notifications" /v "SilentMode" /f

echo Security features and notifications reverted. Please reboot your system for full effect.
pause
goto ShowMenu
