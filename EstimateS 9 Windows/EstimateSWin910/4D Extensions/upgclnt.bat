
@echo off

rem Argument list:
rem 1 - application folder name  
rem 2 - client application name 
rem 3 - decompressing directory,
rem 4 - temporary folder
rem 5 - directory to move old client 
rem 6 - script name, to remove after completion

rem echo "[p0=%~0] [p1=%~1] [p2=%~2] [p3=%~3] [p4=%~4] [p5=%~5] [p6=%~6]"

rem Sanity check 
if not exist "%~1\Database\EnginedServer.4Dlink" goto noxml
xcopy "%~1\Database\EnginedServer.4Dlink" "%~4\%~3\Database\" /Y /C /R
:noxml

rem now replacing the old client with the new one

set name=%~1
set namecopy=%~1 copy
set i=""

if not exist "%~5\%name%" goto docopy

set name=%namecopy%%i%
echo "%name%"
if not exist "%~5\%name%" goto docopy

:newfilename
set /A i=i+1
set name=%namecopy%%i%
if not exist "%~5\%name%" goto docopy
goto :newfilename

:docopy
rem create new folder for moving the old client 
md %5

rem delay is milliseconds
set delay=500
set cpt=
:doEraseOld
ping 1.1.1.1 -n 1 -w %delay%
move /Y %1 "%~5\"
set cpt=%cpt%!

rem 45 attemps of .5s
if (%cpt%)==(!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!) goto emergencyStop

if exist %1 goto doEraseOld

rem new client copying
rem [MI] : bidouille, pour les chemin long ( > 130 caracteres) le move echoue
rem move /Y "%~4\%~3" "%~1"
pushd "%~4"
rename "%~3" "%~1"
popd
move /Y "%~4\%~1" ".\"

rem copy old ClientLocal to the new location if it exists
if not exist "%~5\%name%\ClientLocal" goto dotempfolder

md "%~1\ClientLocal"
xcopy  "%~5\%name%\ClientLocal\*" "%~1\ClientLocal\" /S  /y

:dotempfolder
rem temporary folder removing
rmdir /s /Q %4

rem launch new client
"%~1\%~2"

:doend
:emergencyStop
