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
		IF NOT EXIST %CD%\Tools\Work\restore_azerothcore.zip. (
		echo        ..[X] restore_azerothcore.zip - Required for sandbox.
		)
		(
			echo.
		)
		echo.
		pause
		exit
)

REM ########################################################################################

: initialize
REM // Version
set acoredbrev=2018.12.04
set toolsrev=2019.01.21
set stygianrev=2019.01.21
set wowbuild=12340

REM // This is for launching the deploy batch file that automates debug and release testing
REM // This batch file should be placed in the AzerothCore Solution root folder
set solutiondir=..\Dev\StygianCore\StygianBuild

REM // DevTemp
REM // TODO: PATCH OR UPDATE SPECIFIC SQL TABLES
set quickupdate=item_pricing.sql

REM // Command
REM 1(Blue), 2(Green), 3(Cyan), 4(Red), 5(Purple), 6(Yellow), 7(LGray), 8(Gray)

COLOR 2F
SET mod=%1
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

REM // Try to turn on the lights
cls

:init
IF EXIST %CD%\Tools\Temp\NUL (
	goto mysql
) ELSE (
	mkdir Tools\Temp
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

REM CHECK FOR SAVE GAME STATE           
IF EXIST %CD%\Tools\SaveGameState\savestate-%world%.sql. (
	REM SAVE STATE EXISTS - SHOW RESTORE OPTIONS
) ELSE (
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
IF EXIST %CD%\Tools\SaveGameState\savestate-%world%.sql. (
	echo [ 1 ] - Reset Sandbox World
	echo [ 2 ] - Reset Sandbox Accounts 
	echo [ 3 ] - Exit Sandbox Mode 
) ELSE (
	IF EXIST %CD%\Tools\Work\restore_stygiancore.zip. (
		echo [ 5 ] - Restore Server: StygianCore %stygianrev% Release
	)
	IF EXIST %CD%\Tools\Work\restore_azerothcore.zip. (
		echo [ 6 ] - SandBox Mode: AzerothCore %acoredbrev% Release 
	)
)
echo.
echo ### TOOLS ##############################################################################                                 
echo [ 7 ] - Update MySQL Configuration
IF EXIST %solutiondir%\bin\RelWithDebInfo\worldserver.exe. (
echo [ 8 ] - Deploy Visual Studio Builds
)
echo.
echo ########################################################################################
echo                                                                    # Tools v%toolsrev% # 
echo.
set /P menu=%host% @ %port%: 
if "%menu%"=="0" (goto patch_core)
IF EXIST %CD%\Tools\SaveGameState\savestate-%world%.sql. (
	if "%menu%"=="1" (goto import_world)
	if "%menu%"=="2" (goto import_accounts)
	if "%menu%"=="3" (goto restore_savestate)
) ELSE (
	if "%menu%"=="1" (goto export_world)
)
if "%menu%"=="2" (goto export_accounts)
if "%menu%"=="3" (goto import_world)
if "%menu%"=="4" (goto import_accounts)
if "%menu%"=="5" (goto restore_default_sc)
if "%menu%"=="6" (goto restore_default_ac)
if "%menu%"=="7" (goto setup)
if "%menu%"=="8" (goto deploy)
if "%menu%"=="9" (goto restore_savestate)
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
	ren "Tools\Temp\%world%.sql" "stygian_world-%date:~10,4%%date:~7,2%%date:~4,2%-%time:~0,2%%time:~3,2%.sql"
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
	ren "Tools\Temp\%login%.sql" "stygian_auth-%date:~10,4%%date:~7,2%%date:~4,2%-%time:~0,2%%time:~3,2%.sql"
) else (
    REM echo [- *** No Account Backup Found *** -]
)

echo [- Exporting Accounts -]
Tools\mysqldump.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 %login% > Tools\Temp\%login%.sql
if exist Tools\Temp\%characters%.sql (
	echo.
	echo [- Archiving Existing Characters -]
	ren "Tools\Temp\%characters%.sql" "stygian_characters-%date:~10,4%%date:~7,2%%date:~4,2%-%time:~0,2%%time:~3,2%.sql"
) else (
    REM echo [- *** No Character Backup Found *** -]
)
echo [- Exporting Characters -]
Tools\mysqldump.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 %characters% > Tools\Temp\%characters%.sql
pause
goto menu


REM ########################################################################################
REM [- 3 -]
REM ########################################################################################

:import_world
cls
echo.
IF EXIST Tools\SaveGameState\savestate-%world%.sql. (
	SET action=sandbox_world
) ELSE (
	SET action=saved_world
)
	set /P menu=Are you sure want to RESTORE %action% DATABASE [Y/N]?
	if /I "%menu%"=="n" (goto menu)
	if /I "%menu%"=="y" (goto do_import_%action%)

:do_import_saved_world
cls
echo.
if exist Tools\Temp\stygian_world.sql. (
	echo [- Importing World from Tools\Temp\%world%.sql -]
	Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "DROP DATABASE %world%"
	Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "CREATE DATABASE %world%"
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%world% < Tools\Temp\stygian_world.sql
	echo.
	pause
	goto menu
) else (
    echo [- *** ERROR - No World Backup Found *** -]
	echo.
	pause
	goto menu
)

:do_import_sandbox_world
cls
echo.
if exist Tools\SaveGameState\savestate-stygian_world.sql. (
	echo [- Resetting World  -]
	echo.
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %world%"
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %world%" 
	for %%i in (Tools\Temp\restore_azerothcore\01_default\db_world\*sql) do if %%i neq Tools\Temp\restore_azerothcore\01_default\db_world\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%world% < %%i
	echo.
	pause
	goto menu
) else (
    echo [- *** ERROR - No World Save State Found *** -]
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
IF EXIST Tools\SaveGameState\savestate-%characters%.sql. (
	SET action=sandbox_accounts
) ELSE (
	SET action=saved_accounts
)
	set /P menu=Are you sure want to RESTORE %action% DATABASE [Y/N]?
	if /I "%menu%"=="n" (goto menu)
	if /I "%menu%"=="y" (goto do_import_%action%)

:do_import_saved_accounts
cls
echo.	
	if exist Tools\Temp\stygian_characters.sql. (	

	echo [- Restoring Default Accounts -]	
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %login%"	
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %login%" 		
	for %%i in (Tools\Temp\restore_stygiancore\01_default\db_characters\*sql) do if %%i neq Tools\Temp\restore_stygiancore\01_default\db_characters\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%characters% < %%i

	echo [- Restoring Default Characters -]
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %characters%"
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %characters%" 
	for %%i in (Tools\Temp\restore_stygiancore\01_default\db_auth\*sql) do if %%i neq Tools\Temp\restore_stygiancore\01_default\db_auth\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%login% < %%i
	
	pause
	goto menu
) else (
    echo [- *** ERROR - No Account Backup Found *** -]
	echo.
	pause
	goto menu
)

:do_import_sandbox_accounts
cls
echo.
if exist Tools\Temp\restore_azerothcore\01_default\db_world\waypoints.sql. (	
	echo [- Reset Accounts -]	
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %login%"	
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %login%" 		
	for %%i in (Tools\Temp\restore_stygiancore\01_default\db_characters\*sql) do if %%i neq Tools\Temp\restore_stygiancore\01_default\db_characters\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%characters% < %%i

	echo [- Reset Characters -]
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %characters%"
	Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %characters%" 
	for %%i in (Tools\Temp\restore_stygiancore\01_default\db_auth\*sql) do if %%i neq Tools\Temp\restore_stygiancore\01_default\db_auth\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%login% < %%i
	pause 
	goto menu
) else (
    echo [- *** ERROR - FILE NOT FOUND *** -]
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
cls
RD /S /Q "Tools\Temp\restore_stygiancore"
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
pause
goto menu


REM ########################################################################################
REM [- 6 -]
REM ########################################################################################

:restore_default_ac
cls

REM Check for restoration archive
IF NOT EXIST %CD%\Tools\Work\restore_azerothcore.zip. (
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
echo              You are about to enter Sandbox Mode
echo.
echo This process will RESTORE the default AzerothCore binaries and databases. 
echo A backup of the current game state will be made before the restore begins. 
echo.
echo.
set /P menu=Are you sure want to ENTER SANDBOX MODE? [Y/N]:
if /I "%menu%"=="n" (goto menu)
if /I "%menu%"=="y" (goto sandbox_mode)

:sandbox_mode
cls
echo.
if exist Tools\SaveGameState\savestate-%world%.sql (
	echo [- Existing Save State Found - Exiting... -]
	goto menu
) else (

	IF EXIST %CD%\Tools\SaveGameState\NUL (
		REM Folder Exists
	) ELSE (
		mkdir %CD%\Tools\SaveGameState
	)

	echo [- Saving Game State: Auth -]
	Tools\mysqldump.exe --defaults-extra-file=Server/MySQL/my.cnf %login% > Tools\SaveGameState\savestate-%login%.sql

	echo [- Saving Game State: Characters -]
	Tools\mysqldump.exe --defaults-extra-file=Server/MySQL/my.cnf %characters% > Tools\SaveGameState\savestate-%characters%.sql

	echo [- Saving Game State: World -]
	Tools\mysqldump.exe --defaults-extra-file=Server/MySQL/my.cnf %world% > Tools\SaveGameState\savestate-%world%.sql
		
	echo [- Saving Game State: Binaries -]
	taskkill /F /FI "IMAGENAME eq worldserver.exe"
	taskkill /F /FI "IMAGENAME eq authserver.exe"
	xcopy /y /q Server\Core\authserver.conf Tools\SaveGameState\
	xcopy /y /q Server\Core\authserver.conf.dist Tools\SaveGameState\
	xcopy /y /q Server\Core\worldserver.conf Tools\SaveGameState\
	xcopy /y /q Server\Core\worldserver.conf.dist Tools\SaveGameState\
	xcopy /y /q Server\Core\ace.dll Tools\SaveGameState\
	xcopy /y /q Server\Core\authserver.exe Tools\SaveGameState\
	xcopy /y /q Server\Core\worldserver.exe Tools\SaveGameState\	
	goto restore_default_ac
)

:restore_default_ac
RD /S /Q "Tools\Temp\restore_azerothcore"
CD Tools\Work
CALL build_restore_azerothcore.bat
CD ..
CD ..
Tools\7Z x -y Tools\Work\restore_azerothcore.zip -o.\Tools\Temp\
echo.
echo [- Restoring Default Accounts -]
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %login%"
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %login%" 
for %%i in (Tools\Temp\restore_azerothcore\01_default\db_auth\*sql) do if %%i neq Tools\Temp\restore_azerothcore\01_default\db_auth\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%login% < %%i

echo [- Restoring Default Characters -]
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %characters%"
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %characters%" 
for %%i in (Tools\Temp\restore_azerothcore\01_default\db_characters\*sql) do if %%i neq Tools\Temp\restore_azerothcore\01_default\db_characters\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%characters% < %%i

echo [- Restoring Default World -]
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "DROP DATABASE %world%"
Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf -e "CREATE DATABASE %world%" 
for %%i in (Tools\Temp\restore_azerothcore\01_default\db_world\*sql) do if %%i neq Tools\Temp\restore_azerothcore\01_default\db_world\*sql Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%world% < %%i

REM -- UPDATES --

echo [- Restoring Updates Accounts -]
for %%i in (Tools\Temp\restore_azerothcore\02_update\db_auth\*sql) do if %%i neq .\Tools\Temp\restore_azerothcore\02_update\db_auth\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%login% < %%i

echo [- Restoring Updates Characters -]
for %%i in (Tools\Temp\restore_azerothcore\02_update\db_characters\*sql) do if %%i neq .\Tools\Temp\restore_azerothcore\02_update\db_characters\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%characters% < %%i

echo [- Restoring Updates World -]
for %%i in (Tools\Temp\restore_azerothcore\02_update\db_world\*sql) do if %%i neq .\Tools\Temp\restore_azerothcore\02_update\db_world\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%world% < %%i

REM -- CUSTOM --

echo [- Restoring Custom Accounts -]
for %%i in (Tools\Temp\restore_azerothcore\03_custom\db_auth\*sql) do if %%i neq .\Tools\Temp\restore_azerothcore\03_custom\db_auth\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%login% < %%i

echo [- Restoring Custom Characters -]
for %%i in (Tools\Temp\restore_azerothcore\03_custom\db_characters\*sql) do if %%i neq .\Tools\Temp\restore_azerothcore\03_custom\db_characters\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%characters% < %%i

echo [- Restoring Custom World -]
for %%i in (Tools\Temp\restore_azerothcore\03_custom\db_world\*sql) do if %%i neq .\Tools\Temp\restore_azerothcore\03_custom\db_world\*sql .\Tools\mysql --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 -f --database=%world% < %%i

echo [- Restoring Binaries -]
xcopy /y /q Tools\Temp\restore_azerothcore\00_core\worldserver.exe Server\Core\	
xcopy /y /q Tools\Temp\restore_azerothcore\00_core\authserver.exe Server\Core\
xcopy /y /q Tools\Temp\restore_azerothcore\00_core\ace.dll Server\Core\
xcopy /y /q Tools\Temp\restore_azerothcore\04_conf\authserver.conf Server\Core\
xcopy /y /q Tools\Temp\restore_azerothcore\04_conf\authserver.conf.dist Server\Core\
xcopy /y /q Tools\Temp\restore_azerothcore\04_conf\worldserver.conf Server\Core\
xcopy /y /q Tools\Temp\restore_azerothcore\04_conf\worldserver.conf.dist Server\Core\

pause
goto menu

REM ########################################################################################
REM [- 7 -]
REM ########################################################################################

:deploy
start start_deploy.bat
goto menu

REM ########################################################################################
REM [- 9 -]
REM ########################################################################################

:restore_savestate
cls
echo.
echo                     [------------------]
echo                     [- !!! NOTICE !!! -]
echo                     [------------------]
echo.
echo              YOU ARE ABOUT TO EXIT SANDBOX MODE
echo.
echo This process will EXIT SANDBOX MODE and restore the previously saved 
echo game state.
echo.
set /P menu=Are you sure want to EXIT SANDBOX MODE? [Y/N]:
if /I "%menu%"=="n" (goto menu)
if /I "%menu%"=="y" (goto restore_game)

:restore_game
IF EXIST %CD%\Tools\SaveGameState\savestate-%world%.sql (
	goto restore_game_data
) ELSE (
    echo [- *** ERROR - No Save State Found *** -]
	pause
	goto menu
)

:restore_game_data
cls
echo.

echo [- Importing Accounts from Tools\SaveGameState\savestate-%login%.sql -]
%CD%\Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "DROP DATABASE %login%"
%CD%\Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "CREATE DATABASE %login%"
%CD%\Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%login% < %CD%\Tools\SaveGameState\savestate-%login%.sql

echo [- Importing Characters from Tools\SaveGameState\savestate-%characters%.sql -]
%CD%\Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "DROP DATABASE %characters%"
%CD%\Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "CREATE DATABASE %characters%"
%CD%\Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%characters% < %CD%\Tools\SaveGameState\savestate-%characters%.sql

echo [- Importing World from Tools\SaveGameState\savestate-%world%.sql -]
%CD%\Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "DROP DATABASE %world%"
%CD%\Tools\mysql --defaults-extra-file=Server\MySQL\my.cnf -e "CREATE DATABASE %world%"
%CD%\Tools\mysql.exe --defaults-extra-file=Server/MySQL/my.cnf --default-character-set=utf8 --database=%world% < %CD%\Tools\SaveGameState\savestate-%world%.sql

echo [- Restoring Binaries -]
xcopy /y /q Tools\SaveGameState\worldserver.exe Server\Core\	
xcopy /y /q Tools\SaveGameState\authserver.exe Server\Core\
xcopy /y /q Tools\SaveGameState\ace.dll Server\Core\
xcopy /y /q Tools\SaveGameState\authserver.conf Server\Core\
xcopy /y /q Tools\SaveGameState\authserver.conf.dist Server\Core\
xcopy /y /q Tools\SaveGameState\worldserver.conf Server\Core\
xcopy /y /q Tools\SaveGameState\worldserver.conf.dist Server\Core\

echo [- Clean Up -]
RD /S /Q "Tools\SaveGameState"

IF EXIST %CD%\Tools\SaveGameState\savestate-%world%.sql (
    echo [- *** ERROR - Restore Failed *** -]
	pause
	goto menu
) ELSE (
	    echo [- Restore Complete - Press Any Key To Restart World -]
		pause
		taskkill /F /FI "IMAGENAME eq worldserver.exe"
		start Server\Core\worldserver.exe
		goto menu
)

goto menu
exit