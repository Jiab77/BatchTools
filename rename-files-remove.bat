@echo off
setlocal enabledelayedexpansion
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
for /f %%n in ('dir /b/s/a-d *.%fileExt%*') do (
	set src=%%~nxn
	echo While rename !src! TO !src:%strRemove%=!
)
echo. & echo Press any key to confirm... & pause >NUL & echo.
for /f %%n in ('dir /b/s/a-d *.%fileExt%*') do (
	set src=%%~nn
	echo Renaming !src!%%~xn TO !src:%strRemove%=!%%~xn & ren "%%~dpn\!src!%%~xn" "!src:%strRemove%=!%%~xn"
)
popd
echo. & pause & exit