@echo off
for %%a in (cls echo) do %%a.
setlocal EnableDelayedExpansion

set "list=%*"
set "md5_path=%~dp0" & set md5_path=!basePath:~0,-1!\MD5

echo DATA PASSED: !list!

for %%m in (!list!) do (
	title Hashing [%%~nxm]...
	call %md5_path%\md5sums.exe -u -e "%%~m" > "%%~m.md5"
)

pause
exit /b