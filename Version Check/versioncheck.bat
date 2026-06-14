@echo off
setlocal
if -%1-==-- (
	echo usage: versioncheck [data/game file]
	goto :end
)
set INPUT=%1
for /f %%i in ('rhash --md5 --one-hash %INPUT%') do set HASH=%%i
if not defined HASH (
	echo file hashing failed
	goto :end
)

findstr /I "^%HASH%" allundertaleversions.txt || (
	echo %HASH% Not a recognized version of Undertale.
	echo Please ensure you are using the data.win, game.win, game.ios, or game.unx file.
	goto :end
)

:end
endlocal
if -%2-==-- pause
exit /b
