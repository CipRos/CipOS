mode con: cols=100 lines=40
@echo off
title Original CipOS
::goto LoginMenuAfterBoot

:startup
color 9B
cls
echo Starting up program.
ping localhost -n 2 >nul
cls
echo Starting up program..
ping localhost -n 2 >nul
cls
echo Starting up program...
ping localhost -n 5 >nul
cls

ping localhost -n 2 >nul
echo Loading Cip.VbsHost
ping localhost -n 2 >nul

echo Mozzila/5.0 (CipOS NT 1.0; Cip64; x64) is starting up...
ping localhost -n 5 >nul

echo hostanme: PC
echo hash:
echo Chrome PDF Viewer
echo Chrome PDF Plugin
echo search


echo CipDoac v1 booting on...
echo Chrome 69.0.3497.100 on CipDoac 64-bit

if EXIST C:\Users\%username%\Desktop\CipOS\data\bios.dll (
echo bios ... ready
) else (
goto sysfail
)
ping localhost -n 2 >nul

if EXIST C:\Users\%username%\Desktop\CipOS\data\settings.dll (
echo settings ... ready
) else (
goto sysfail2
)

ping localhost -n 2 >nul

if EXIST C:\Users\%username%\Desktop\CipOS\data\modules.dll (
echo modules ... ready
) else (
goto sysfail2
)

ping localhost -n 3 >nul

if EXIST C:\Users\%username%\Desktop\CipOS\data\CipOS.dll (
echo system ... ready
) else (
goto sysfail
)

ping localhost -n 2 >nul
echo audio ... ready
ping localhost -n 2 >nul
echo boot ... ready
ping localhost -n 1 >nul
echo apps ... ready
ping localhost -n 3 >nul
echo config ... ready
ping localhost -n 2 >nul
echo exe ... ready
ping localhost -n 2 >nul
echo start ... ready
ping localhost -n 2 >nul

echo Starting Up!
ping localhost -n 2 >nul
goto Activation

:Activation
if EXIST C:\Users\%username%\Desktop\CipOS\Activated.dll (
    goto LoginMenuAfterBoot
) else (
    goto NeedToActivate
)

:NeedToActivate
set /a "activation_code=1V6J1-DM3M4-HU246-L4SU6"
cls
set input=
set /p input= "20 digit Activation Key ( XXXXX-XXXXX-XXXXX-XXXXX ): "
if %input%==%activation_code% goto YES
if not %input%==%activation_code% goto NO

:NO
Echo INCORRECT ACTIVATION KEY
goto ACTIVATE

:YES
echo This machine is activated! > Activated.dll
cls
echo This machine has been activated!
ping localhost -n 5 >nul
goto LoginMenuAfterBoot

:LoginMenuAfterBoot
cls
echo Available Users
echo.
echo 1) guest 
echo 2) root (Administrator)
echo.
set /p "seluser=Login as: "

:GuestLogin
if %seluser%==guest (
    echo Logged in as guest
    pause
    goto LoginMenuAfterBoot
)

if %seluser%==root (
    goto RootLogin
)

:RootLogin
set /p "password=Password: "

if %password%==admin (
    echo Welcome, root!
    echo Loading Desktop...
    ping localhost -n 3 >nul
    echo Desktop Loaded!
    cls
    goto Home
) else (
echo Incorrect password!
pause
goto LoginMenuAfterBoot
)

:Home
color 9B
cls
Title Home
echo Home
echo.
echo Choose from a list of commands
echo.
echo 1 = Calculator
echo 2 = Text Editor
echo 3 = Restart
echo 4 = Shutdown
echo 5 = Help
echo 6 = Logout
echo 7 = Update Info
echo 8 = Files
echo 9 = Steamie
echo.
set /p "Choice=Command: "
if %Choice% == 1 goto Calc
if %Choice% == 2 goto TEXT
if %Choice% == 3 goto startup
if %Choice% == 4 exit
if %Choice% == 5 goto HELP
if %Choice% == 6 goto LoginMenuAfterBoot
if %Choice% == 7 goto UPDINF
if %Choice% == 8 goto FILES
if %Choice% == 9 goto Steamie
echo INVALID COMMAND
pause
goto Home


:Calc
cls
color 0a
title Calculator
ECHO Calculator Version 1.1
ECHO * = MULTIPLY
ECHO + = ADD
ECHO _ = SUBTRACT
ECHO / = DIVIDE
SET /p UDefine= 
SET /a UDefine=%UDefine
ECHO =
ECHO %UDefine%
ECHO.
pause
goto Home

:TEXT
if %seluser%==root (
    goto TextChecked
) else (
    echo Access Denied! You need Administrator Permission!
)

:TextChecked
cls
title Text Editor
echo My Text Editor Version 1.5
echo.
echo 1) Open...
echo 2) New...
echo 3) Back...
echo 4) Delete...
set /p Choice=
if %choice%==1 goto OPEN
if %choice%==2 goto NEW
if %choice%==3 goto HOME
if %choice%==4 goto DEL
echo.
pause

:NEW
cls
cd /d "C:\Users\%username%\Desktop\CipOS\Saved Text Editor Files"
echo Enter name of the file you want to make. It cannot contain spaces.
echo. 
set /p N=Name: 
cls
set /p WRITE=`                   Write Your Document 
echo %WRITE% > %N%.txt
goto home

:OPEN
cls
cd /d "C:\Users\%username%\Desktop\CipOS\Saved Text Editor Files"
echo Type the name of the file you are trying to open.
set /p file=
FOR /F "tokens=*" %%i IN (%file%) DO @ECHO %%i
echo.
pause
goto HOME

:DEL
cls
cd /d "C:\Users\%username%\Desktop\CipOS\Saved Text Editor Files"
echo Type the name of the file you want to delete.
set /p delete=
del %delete%
pause
goto HOME


:Help
cls
title Help
echo Help
echo.
echo Text Editor is a Program Made for Creating Text Documents
echo Calculator Lets you Process Simple Math Problems
echo Restart Reboots the OS
echo Shutdown Shuts Down the OS
echo Logout Returns you to the Login Screen
echo Update Info Shows you all Updates
echo Files Shows you all of the System Files
echo Password Generator can Create 1, 5, or 10 numeric passwords for you.
pause
goto Home

:UPDINF
cls
title Update Info
echo.
echo Update Info
echo.
echo Version 1.1.5 - Added Password Generator. 25 Digit Activation Key is 
echo                 Required to boot OS.
echo.
echo Version 1.1.0 - Added Ability to View .txt files and delete them.
echo.
echo Version 1.0.3 - Added Ability to See Filesystem
echo.
echo Version 1.0.2 - Fixed Title Bugs
echo.
echo Version 1.0.1 - Did some spell checking.
echo.
echo Version 1.0.0 - Fixed final bugs with calculator constantly adding instead of
echo                 multiplying. OFFICAL LAUNCH!
echo.
echo Version 0.9.0 - Added Calculator. Fixed bugs with Text Editor
echo                 OFFICIAL BETA LAUNCH!
echo.
echo Version 0.6.0 - Fixed Bugs with Login Allowing any Username or Password.
echo.
echo Version 0.3.0 - Added Login Screen.
echo.
echo Version 0.1.0 - Completed Kernel, Bootloader, and Text Editor.
echo                 OFFICAL ALPHA LAUNCH!
echo.
pause
goto Home

:FILES
cls
title Files
echo Here Are All Of The Files Within This Operating System's Drive.
echo.
echo.
cd /d "C:\Users\%username%\Desktop\CipOS"
dir
pause
goto Home

:Steamie
cls
title Steamie
echo Game library
echo ----------------------------------------­-----------------------
echo 1) Flappy Bird ( Phone Emulator )
echo Input your game choice
set input=
set /p input= Choice:
if %input%==1 start "C:\Users\%username%\Desktop\CipOS\data\Games\Flappy Bird\Flappy Bird.bat"
