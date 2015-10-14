@echo off
setlocal EnableDelayedExpansion
title Filename modifier

:loop
for %%a in (cls echo echo) do %%a.
set /p folder=Rename in folder ? :
set /p fileExt=Looking for file extension ? :
set /p strRemove=String to remove from filenames ? :
set /p strReplace=String to replace the removed part ? :
echo.
if "%strRemove%"=="" (
	goto loop
)
pushd "%folder%"
for /f "delims=;" %%n in ('dir /b/s/a-d *.%fileExt%*') do (
	set src=%%~nxn
	echo While rename: !src!
	echo To: !src:%strRemove%=%strReplace%!
	echo.
)
echo. & echo Press any key to confirm... & pause >NUL & echo.
for /f "delims=;" %%n in ('dir /b/s/a-d *.%fileExt%*') do (
	set src=%%~nxn
	echo Renaming: !src!
	echo To: !src:%strRemove%=%strReplace%!
	ren "%%~dpn\!src!" "!src:%strRemove%=%strReplace%!"
	echo Done. & echo.
)
popd
echo. & pause & exit