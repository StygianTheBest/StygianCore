@echo off
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


