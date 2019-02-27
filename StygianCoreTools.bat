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

REM ########################################################################################
REM CHECK FOR RESTORATION ARCHIVES
REM ########################################################################################

IF EXIST %CD%\Tools\Work\restore_stygiancore.zip. (
	goto initialize
)
(
		CLS
		echo.
		echo                     [-------------------]
		echo                     [- !!! WARNING !!! -]
		echo                     [-------------------]
		echo.
		echo THE REQUIRED RESTORATION ARCHIVE, restore_stygiancore.zip, WAS NOT 
		echo FOUND IN THE TOOLS FOLDER. PLEASE LOCATE THIS FILE AND TRY AGAIN. 
		echo -------------------------------------------------------------------
		echo ... Server
		echo ... Support
		echo ... Tools
		echo     .. Work
		echo        ..[X] restore_stygiancore.zip - Required for server restore.
		echo.
		pause
		exit
)

REM ########################################################################################

: initialize
REM // Version
set toolsrev=2019.03.01
set stygianrev=2019.03.01
set wowbuild=12340

REM // This is for launching the deploy batch file that automates debug and release testing
REM // This batch file should be placed in the AzerothCore Solution root folder
set solutiondir=..\Dev\StygianCore\StygianBuild

REM // Command
REM 1(Blue), 2(Green), 3(Cyan), 4(Red), 5(Purple), 6(Yellow), 7(LGray), 8(Gray)
COLOR 2F
MODE con:cols=89 lines=45
SET NAME=StygianCore Tools
TITLE %NAME%

REM // MySQL 5.6.42 x64 
set host=127.0.0.1
set port=3306
set user=azerothcore
set pass=azerothcore

REM // Database
set login=stygian_auth
set characters=stygian_characters
set world=stygian_world

REM // Model Mall 
set modelmax=640
set modelstart=18600

REM // Try to turn on the lights
cls
goto init

:init
REM // Create needed folders
IF EXIST %CD%\Tools\Temp\NUL (
	goto mysql
) ELSE (
	mkdir %CD%\Tools\Temp
	goto mysql
)

IF EXIST %CD%\Server\Core\logs\NUL (
	goto mysql
) ELSE (
	mkdir %CD%\Server\Core\logs
	goto mysql
)

REM
REM [- 0 -]
REM
:setup
cls
echo.
set /P host=Host [%host%]: 
set /P port=Port [%port%]: 
set /P user=User [%user%]: 
set /P login=DB Auth [%login%]: 
set /P pass=DB Char[%characters%]: 
set /P pass=DB World [%world%]: 

echo.
pause

:mysql
rem echo Checking MySQL...
tasklist /FI "IMAGENAME eq mysqld.exe" 2>NUL | find /I /N "mysqld">NUL
if "%ERRORLEVEL%"=="0" goto menu
if "%ERRORLEVEL%"=="1" goto start_mysql

:start_mysql
echo Starting MySQL...
start start_database.bat
ping -n 10 127.0.0.1>nul
goto mysql

:menu
cls
echo ########################################################################################
echo    ____    __                                         ____                           
echo   /\  _`\ /\ \__                  __                 /\  _`\                         
echo   \ \,\L\_\ \ ,_\  __  __     __ /\_\     __      ___\ \ \/\_\    ___   _ __    __   
echo    \/_\__ \\ \ \/ /\ \/\ \  /'_ `\/\ \  /'__`\  /' _ `\ \ \/_/_  / __`\/\`'__\/'__`\ 
echo      /\ \L\ \ \ \_\ \ \_\ \/\ \L\ \ \ \/\ \L\.\_/\ \/\ \ \ \L\ \/\ \L\ \ \ \//\  __/ 
echo      \ `\____\ \__\\/`____ \ \____ \ \_\ \__/.\_\ \_\ \_\ \____/\ \____/\ \_\\ \____\
echo       \/_____/\/__/ `/___/  \/___L\ \/_/\/__/\/_/\/_/\/_/\/___/  \/___/  \/_/ \/____/
echo                        /\___/ /\____/                                                
echo                        \/__/  \_/__/          http://stygianthebest.github.io  
echo.
echo.        
echo ### IMPORT/EXPORT ######################################################################             
	IF EXIST %CD%\Tools\Temp\PatchCore\patch_core_ready.txt. (
		echo [ 0 ] - Patch Core: StygianCore %stygianrev% Release
	)
	echo [ 1 ] - Export World
	echo [ 2 ] - Export Accounts/Characters
	IF EXIST %CD%\Tools\Temp\%world%.sql. (
		echo [ 3 ] - Import World
	)
	IF EXIST %CD%\Tools\Temp\%login%.sql. (
		echo [ 4 ] - Import Accounts/Characters
	)
)
echo.
echo ### RESTORE SERVER #####################################################################
echo.
	IF EXIST %CD%\Tools\Work\restore_stygiancore.zip. (
		echo [ 5 ] - Restore Server: StygianCore [%stygianrev% Release]
	)
)
echo.
echo ### TOOLS ##############################################################################                                 
echo [ 6 ] - Start Server
echo [ 7 ] - NPC Model Tools
IF EXIST %solutiondir%\bin\RelWithDebInfo\worldserver.exe. (
echo [ 8 ] - Deploy Visual Studio Builds
)
echo [ 9 ] - Update MySQL Configuration
echo.
echo ########################################################################################
echo                                                                    # Tools v%toolsrev% # 
echo.
set /P menu=%host% @ %port%: 
if "%menu%"=="0" (goto patch_core)
if "%menu%"=="1" (goto export_world)
if "%menu%"=="2" (goto export_accounts)
if "%menu%"=="3" (goto import_world)
if "%menu%"=="4" (goto import_accounts)
if "%menu%"=="5" (goto restore_default_sc)
if "%menu%"=="6" (goto start_server)
if "%menu%"=="7" (goto model_tools)
if "%menu%"=="8" (goto deploy)
if "%menu%"=="9" (goto start)
if "%menu%"=="" (goto menu)


REM ########################################################################################
REM [- 0 -]
REM ########################################################################################

:patch_core
cls
echo.
IF EXIST Tools\Temp\PatchCore\patch_core_ready.txt. (
CLS
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
if /I "%menu%"=="y" (goto patch_backup)
) else (
    echo.
	echo [- *** Invalid Core Patch Installation.. Exiting *** -]
	echo.
	pause
	goto menu
)

:patch_backup
echo.

REM Create Patch Folder
IF EXIST %CD%\Tools\PatchBackup\NUL (
	REM Folder Exists
) ELSE (
	mkdir %CD%\Tools\PatchBackup
)

REM Shutdown Server Processes
taskkill /F /FI "IMAGENAME eq worldserver.exe"
taskkill /F /FI "IMAGENAME eq authserver.exe"
CLS

echo.
echo [- Backing Up Current Core To Tools\PatchBackup -]
xcopy /y /q Server\Core\* Tools\PatchBackup\

echo.
echo [- Backing Up Current World To Tools\PatchBackup -]
Tools\mysqldump.exe --defaults-extra-file=Server/MySQL/my.cnf %world% > Tools\PatchBackup\%world%.sql

echo.
IF EXIST Tools\Work\restore_stygiancore\01_default\db_world\creature.sql. (
	echo [- Building Backup Restoration Archive To Tools\PatchBackup -]
	CD Tools\Work
	CALL build_restore_stygiancore.bat
	CD ..
	CD ..
	xcopy /y /q Tools\Work\restore_stygiancore.zip Tools\PatchBackup\	
) ELSE (
	IF EXIST Tools\Work\restore_stygiancore.zip. (
		echo [- WARNING!!! RESTORATION ARCHIVE DATA CORRUPT! CAN'T REBUILD! COPYING EXISTING ARCHIVE! -]
		xcopy /y /q Tools\Work\restore_stygiancore.zip Tools\PatchBackup\
	) ELSE (
		echo [- WARNING!!! RESTORATION ARCHIVE DATA CORRUPT! CAN'T BACKUP! -]
	)
)

echo.
echo [- Patching Core -]
xcopy /y /q Tools\Temp\PatchCore\*.dll Server\Core\
xcopy /y /q Tools\Temp\PatchCore\*.exe Server\Core\
xcopy /y /q Tools\Temp\PatchCore\*.dist Server\Core\

echo.
echo [- Patching World -]
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %world%"
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %world%" 
for %%i in (Tools\Temp\PatchCore\*sql) do if %%i neq Tools\Temp\PatchCore\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%world% < %%i

echo.
echo [- Patching Restoration Archive -]
RD /S /Q "Tools\Work\restore_stygiancore"
Tools\7Z x -y Tools\Temp\PatchCore\restore_stygiancore.zip -o.\Tools\Work\
RD /S /Q "Tools\Temp\PatchCore"
echo.
echo [- Patch Complete -]
echo.
pause
goto menu	


REM ########################################################################################
REM [- 1 -]
REM ########################################################################################

:export_world
cls
echo.
echo ###] .\TOOLS\TEMP DIRECTORY CONTENTS [##################################################
dir Tools\Temp /N /ON
echo.
echo ########################################################################################
echo.
set /P menu=Are you sure want to EXPORT the current WORLD database? [Y/N]:
if /I "%menu%"=="n" (goto menu)
if /I "%menu%"=="y" (goto export_world_go)

:export_world_go
cls
echo.
if exist Tools\Temp\%world%.sql (
	echo [- Archiving Existing World -]
	ren "Tools\Temp\%world%.sql" "%world%-%date:~10,4%%date:~7,2%%date:~4,2%-%time:~0,2%%time:~3,2%.sql"
) else (
    REM echo [- *** No World Backup Found *** -]
)
echo [- Exporting World -]
Tools\mysqldump.exe --defaults-extra-file=Server/MySQL/my.cnf %world% > Tools\Temp\%world%.sql
echo.
pause
goto menu	


REM ########################################################################################
REM [- 2 -]
REM ########################################################################################

:export_accounts
cls
echo.
echo ###] .\TOOLS\TEMP DIRECTORY CONTENTS [##################################################
dir Tools\Temp /N /ON
echo.
echo ########################################################################################
echo.
set /P menu=Are you sure want to EXPORT ACCOUNTS/CHARACTERS? [Y/N]:
if /I "%menu%"=="n" (goto menu)
if /I "%menu%"=="y" (goto export_accounts_go)

:export_accounts_go
cls
echo.
if exist Tools\Temp\%login%.sql (
	echo [- Archiving Existing Accounts -]
	ren "Tools\Temp\%login%.sql" "%login%-%date:~10,4%%date:~7,2%%date:~4,2%-%time:~0,2%%time:~3,2%.sql"
) else (
    REM echo [- *** No Account Backup Found *** -]
)

echo [- Exporting Accounts -]
Tools\mysqldump.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 %login% > Tools\Temp\%login%.sql
if exist Tools\Temp\%characters%.sql (
	echo.
	echo [- Archiving Existing Characters -]
	ren "Tools\Temp\%characters%.sql" "%characters%-%date:~10,4%%date:~7,2%%date:~4,2%-%time:~0,2%%time:~3,2%.sql"
) else (
    REM echo [- *** No Character Backup Found *** -]
)
echo [- Exporting Characters -]
Tools\mysqldump.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 %characters% > Tools\Temp\%characters%.sql
echo.
pause
goto menu


REM ########################################################################################
REM [- 3 -]
REM ########################################################################################

:import_world
cls
echo.
	set /P menu=Are you sure want to IMPORT THE WORLD DATABASE? [Y/N]
	if /I "%menu%"=="n" (goto menu)
	if /I "%menu%"=="y" (goto do_import_saved_world)

:do_import_saved_world

REM Shutdown Server Processes
taskkill /F /FI "IMAGENAME eq worldserver.exe"
taskkill /F /FI "IMAGENAME eq authserver.exe"
CLS

echo.
if exist Tools\Temp\%world%.sql. (
	echo [- Importing World from Tools\Temp\%world%.sql -]
	Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "DROP DATABASE %world%"
	Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "CREATE DATABASE %world%"
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%world% < Tools\Temp\%world%.sql
	echo.	
	echo [- *** WORLD IMPORT COMPLETE - RESTART SERVER *** -]
	echo.
	pause
	goto menu
) else (
    echo [- *** ERROR - No World Backup Found *** -]
	echo.
	pause
	goto menu
)


REM ########################################################################################
REM [- 4 -]
REM ########################################################################################

:import_accounts
cls
echo.
	set /P menu=Are you sure want to RESTORE THE ACCOUNT/CHARACTERS DATABASE? [Y/N]
	if /I "%menu%"=="n" (goto menu)
	if /I "%menu%"=="y" (goto do_import_saved_accounts)

:do_import_saved_accounts

REM Shutdown Server Processes
taskkill /F /FI "IMAGENAME eq worldserver.exe"
taskkill /F /FI "IMAGENAME eq authserver.exe"
CLS

echo.	
	if exist Tools\Temp\%characters%.sql. (	

	echo [- Restoring Default Accounts -]	
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %login%"	
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %login%" 		
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%login% < Tools\Temp\%login%.sql
	
	echo [- Restoring Default Characters -]
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %characters%"
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %characters%" 
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%characters% < Tools\Temp\%characters%.sql
	
	echo.	
	echo [- *** ACCOUNT/CHARACTER IMPORT COMPLETE - RESTART SERVER *** -]
	echo.
	pause
	goto menu
) else (
    echo [- *** ERROR - No Account/Character Backup Found *** -]
	echo.
	pause
	goto menu
)


REM ########################################################################################
REM [- 5 -]
REM ########################################################################################

:restore_default_sc
cls

REM Check for restoration archive
IF NOT EXIST %CD%\Tools\Work\restore_stygiancore.zip. (
    echo [- *** No Default Restoration Archive Found *** -]
	echo.
	pause
	goto menu
)

echo.
echo                     [-------------------]
echo                     [- !!! WARNING !!! -]
echo                     [-------------------]
echo.
echo This process will RESTORE the StygianCore databases which will 
echo overwrite existing Accounts, Characters, and World database files 
echo and the contents of any temporary restoration data in the Tools folder.
echo It will first build a new restoration archive from the Tools\Work
echo folder and then use it to restore the server.
echo.
echo.
set /P menu=Are you sure want to RESTORE STYGIANCORE DEFAULT DATABASES? [Y/N]:
if /I "%menu%"=="n" (goto menu)
if /I "%menu%"=="y" (goto restore_sc_prep)

:restore_sc_prep
CLS

REM Shutdown Server Processes
taskkill /F /FI "IMAGENAME eq worldserver.exe"
taskkill /F /FI "IMAGENAME eq authserver.exe"
RD /S /Q "Tools\Temp\restore_stygiancore"

CLS
CD Tools\Work
CALL build_restore_stygiancore.bat
CD ..
CD ..
Tools\7Z x -y Tools\Work\restore_stygiancore.zip -o.\Tools\Temp\
echo.
goto restore_default_sc

:restore_default_sc
echo.
echo [- Restoring Default Accounts -]
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %login%"
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %login%" 
for %%i in (Tools\Temp\restore_stygiancore\01_default\db_auth\*sql) do if %%i neq Tools\Temp\restore_stygiancore\01_default\db_auth\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%login% < %%i

echo [- Restoring Default Characters -]
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %characters%"
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %characters%" 
for %%i in (Tools\Temp\restore_stygiancore\01_default\db_characters\*sql) do if %%i neq Tools\Temp\restore_stygiancore\01_default\db_characters\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%characters% < %%i

echo [- Restoring Default World -]
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %world%"
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %world%" 
for %%i in (Tools\Temp\restore_stygiancore\01_default\db_world\*sql) do if %%i neq Tools\Temp\restore_stygiancore\01_default\db_world\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%world% < %%i

REM -- UPDATES --

echo [- Restoring Updates Accounts -]
for %%i in (Tools\Temp\restore_stygiancore\02_update\db_auth\*sql) do if %%i neq .\Tools\Temp\restore_stygiancore\02_update\db_auth\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%login% < %%i

echo [- Restoring Updates Characters -]
for %%i in (Tools\Temp\restore_stygiancore\02_update\db_characters\*sql) do if %%i neq .\Tools\Temp\restore_stygiancore\02_update\db_characters\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%characters% < %%i

echo [- Restoring Updates World -]
for %%i in (Tools\Temp\restore_stygiancore\02_update\db_world\*sql) do if %%i neq .\Tools\Temp\restore_stygiancore\02_update\db_world\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%world% < %%i

REM -- CUSTOM --

echo [- Restoring Custom Accounts -]
for %%i in (Tools\Temp\restore_stygiancore\03_custom\db_auth\*sql) do if %%i neq .\Tools\Temp\restore_stygiancore\03_custom\db_auth\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%login% < %%i

echo [- Restoring Custom Characters -]
for %%i in (Tools\Temp\restore_stygiancore\03_custom\db_characters\*sql) do if %%i neq .\Tools\Temp\restore_stygiancore\03_custom\db_characters\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%characters% < %%i

echo [- Restoring Custom World -]
for %%i in (Tools\Temp\restore_stygiancore\03_custom\db_world\*sql) do if %%i neq .\Tools\Temp\restore_stygiancore\03_custom\db_world\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%world% < %%i

echo.	
echo [- *** SERVER RESTORE COMPLETE - RESTART SERVER *** -]
echo.
pause
goto start_server
pause
goto menu


REM ########################################################################################
REM [- 6 -]
REM ########################################################################################

:start_server

REM Shutdown Server Processes
taskkill /F /FI "IMAGENAME eq worldserver.exe"
taskkill /F /FI "IMAGENAME eq authserver.exe"
CLS

START start_auth.bat
START start_world.bat
goto menu


REM ########################################################################################
REM [- 7-]
REM ########################################################################################

:model_tools
CLS
CLS
echo.
echo                     [-------------------]
echo                     [- # CORE PATCH  # -]
echo                     [-------------------]
echo.
echo ########################################################################################
echo   This process will randomize the NPC models on GM Island and set 
echo   the models and range for the models on Programmer Isle. This process 
echo   is useful for previewing many different NPC models at once in addition 
echo   to changing things up a bit on GM Island.
echo.
echo   ** WARNING: This process will stop and restart the Auth and Worldserver **
echo ########################################################################################
echo.
set /P menu=Are you sure want to Randomize NPC Models? [Y/N]:
if /I "%menu%"=="n" (goto menu)
if /I "%menu%"=="y" (goto gorandom)

:gorandom

REM Shutdown Server Processes
taskkill /F /FI "IMAGENAME eq worldserver.exe"
taskkill /F /FI "IMAGENAME eq authserver.exe"

cls
echo.
echo [- Set Model Mall Parameters -]
echo.
set /P modelmax=Max Models (Default: 640) [%modelmax%]: 
set /P modelstart=Start Model (Range: 13 .. 37,254) [%modelstart%]:
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%world% --execute="CALL UpdateModelRange(%modelmax%, %modelstart%)"

echo.
echo [- Generating Model Mall -]
echo.
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%world% --execute="CALL ModelMall()"

echo [- Randomizing GM Island NPC Models -]
echo.
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%world% < Tools\Work\restore_stygiancore\03_custom\db_world\npc_gm_island_mall_rand.sql

echo [- NPC Models Updated :: DELETE THE WOW CLIENT CACHE! -]
echo.
pause

rem start start_auth.bat
rem start start_world.bat

goto menu


REM ########################################################################################
REM [- 8 -]
REM ########################################################################################

:deploy
start start_deploy.bat
goto menu


REM ########################################################################################
REM [- 9 -]
REM ########################################################################################

REM :setup


