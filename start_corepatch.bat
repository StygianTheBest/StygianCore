@echo off
REM ########################################################################################
REM    ____    __                                         ____                           
REM   /\  _`\ /\ \__                  __                 /\  _`\                         
REM   \ \,\L\_\ \ ,_\  __  __     __ /\_\     __      ___\ \ \/\_\    ___   _ __    __   
REM    \/_\__ \\ \ \/ /\ \/\ \  /'_ `\/\ \  /'__`\  /' _ `\ \ \/_/_  / __`\/\`'__\/'__`\ 
REM      /\ \L\ \ \ \_\ \ \_\ \/\ \L\ \ \ \/\ \L\.\_/\ \/\ \ \ \L\ \/\ \L\ \ \ \//\  __/ 
REM      \ `\____\ \__\\/`____ \ \____ \ \_\ \__/.\_\ \_\ \_\ \____/\ \____/\ \_\\ \____\
REM       \/_____/\/__/ `/___/  \/___L\ \/_/\/__/\/_/\/_/\/_/\/___/  \/___/  \/_/ \/____/
REM                        /\___/ /\____/                                                
REM                        \/__/  \_/__/          http://stygianthebest.github.io  
REM  
REM ########################################################################################
REM
REM start_corepatch.bat
REM
REM Launches the StygianCore patch utility for upgrading the repack.
REM
REM ########################################################################################

REM 1(Blue), 2(Green), 3(Cyan), 4(Red), 5(Purple), 6(Yellow), 7(LGray), 8(Gray)
COLOR 8F
SET NAME=StygianCore Patch Utility
TITLE %NAME%

CLS

IF EXIST %CD%\StygianCore_Revision*. (
echo.
echo                     [-------------------]
echo                     [- # CORE PATCH  # -]
echo                     [-------------------]
echo.
echo This process will patch StygianCore to the latest revision. If you
echo are seeing this, the required patch files are in the correct folder
echo and are ready to deploy. Your current binaries and world database
echo will be backed up automatically to the Tools\PatchBackup folder
echo before the patch process begins.
echo -------------------------------------------------------------------
echo.
set /P menu=Are you sure want to install the CORE PATCH? [Y/N]:
if /I "%menu%"=="n" (goto menu)
if /I "%menu%"=="y" (goto patch_prepare)
) else (
    echo.
	echo [- *** Core Patch Missing Files.. Exiting *** -]
	echo.
	echo.
	echo You need to put the StygianCore_Revision_XXXX_XX_XX.zip file 
	echo in this the StygianCore root folder.
	echo.
	pause
	exit
)

:patch_prepare

echo.
echo [- Preparing Patch Archive -]
echo.

REM Create Patch Folder
IF EXIST %CD%\Tools\Temp\PatchCore\NUL (
	REM Folder Exists
) ELSE (
	mkdir %CD%\Tools\Temp\PatchCore
)

REM Clear Temp\PatchCore
RD /S /Q "Tools\Temp\PatchCore"

REM Unzip Patch Archive
Tools\7Z x -y StygianCore_Revision_*.* -o.\Tools\Temp\PatchCore\
Tools\7Z x -y Tools\Temp\PatchCore\StygianCorePatch.zip -o.\Tools\Temp\PatchCore\

REM Upgrade StygianCoreTools.bat
xcopy /y /q Tools\Temp\PatchCore\StygianCoreTools.bat

Call StygianCoreTools.bat
exit


