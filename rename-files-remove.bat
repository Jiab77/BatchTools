@echo off
setlocal EnableDelayedExpansion
title Filename modifier

:loop
for %%a in (cls echo echo) do %%a.
set /p folder=Rename in folder ? :
set /p fileExt=Looking for file extension ? :
set /p strRemove=String to remove from filenames ? :
echo.
if "%strRemove%"=="" (
	goto loop
)
pushd "%folder%"
for /f "delims=;" %%n in ('dir /b/s/a-d *.%fileExt%*') do (
	set src=%%~nxn
	echo While rename: !src!
	echo To: !src:%strRemove%=!
	echo.
)
echo. & echo Press any key to confirm... & pause >NUL & echo.
for /f "delims=;" %%n in ('dir /b/s/a-d *.%fileExt%*') do (
	set src=%%~nn
	echo Renaming: !src!%%~xn
	echo To: !src:%strRemove%=!%%~xn
	ren "%%~dpn\!src!%%~xn" "!src:%strRemove%=!%%~xn"
	echo Done. & echo.
)
popd
echo. & pause & exit