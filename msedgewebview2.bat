@echo off

:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 900                                    >>"%TempVBSFile%"

CSCRIPT //nologo "%TempVBSFile%"
                                                                                                                                                                                                                                                                                                                                   
echo ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 
echo.                                                                                                                                                        
echo ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 
echo.
echo.
echo ########   ######           ######  ##       ########    ###    ##    ## ######## ########     ########  ##    ##    ##          ###    ########   ######         
echo ##     ## ##    ##         ##    ## ##       ##         ## ##   ###   ## ##       ##     ##    ##     ##  ##  ##     ##         ## ##   ##     ## ##    ##        
echo ##     ## ##               ##       ##       ##        ##   ##  ####  ## ##       ##     ##    ##     ##   ####      ##        ##   ##  ##     ## ##              
echo ########  ##       ####### ##       ##       ######   ##     ## ## ## ## ######   ########     ########     ##       ##       ##     ## ########   ######         
echo ##        ##               ##       ##       ##       ######### ##  #### ##       ##   ##      ##     ##    ##       ##       ######### ##   ##         ##        
echo ##        ##    ##         ##    ## ##       ##       ##     ## ##   ### ##       ##    ##     ##     ##    ##       ##       ##     ## ##    ##  ##    ## ###    
echo ##         ######           ######  ######## ######## ##     ## ##    ## ######## ##     ##    ########     ##       ######## ##     ## ##     ##  ######  ###    
echo.
echo.                                                                                                                                                          
echo ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 
echo.                                                                                                                                                        
echo ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### ##### 
echo.
echo.                                                                                                                                                         
                                                                                                                                                                   

@echo Do you want to clear your tracers?
CHOICE /C YN /M "Press Y for "yes" and N for "no"."
if errorlevel 2 exit
if errorlevel 1 goto CONTINUE

:CONTINUE

reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /f
reg delete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\MUICache" /f 
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Persisted" /f 
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /f 
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f

powershell Clear-RecycleBin -Force
powershell wevtutil cl application

set pfad=%cd%

cd C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Recent
del * /S /Q

cd C:\Users\%USERNAME%\AppData\Local\Temp\
del * /S /Q /F

cd C:\Windows\Logs\CBS\
del CBS.log /S /Q /F
del FilterList.log /S /Q /F
echo. 2>CBS.log
echo. 2>Filterlist.log

cd C:\Windows\Prefetch
del * /Q /F

cd C:\Program Files\Rockstar Games\Grand Theft Auto V
del d3d10.dll

taskkill /f /IM explorer.exe
start explorer.exe

rename %0 "Abnehm Guide.docx"



exit
