@echo off
cls
for %%L in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
	for /F "delims=;" %%D in ('dir /B/AD %CD%\%%L*') do (
		if exist "%CD%\%%L*" (
			if not exist "%CD%\%%L" mkdir "%CD%\%%L"
			(move "%CD%\%%D" "%CD%\%%L") && echo Moving [%%D] to [%CD%\%%L] || echo Error. Can't move [%%D] to [%CD%\%%L]
		)
	)
)
