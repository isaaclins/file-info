@echo off
set /p "filename=Drag and drop a file here: "
for %%F in ("%filename%") do set "name=%%~nxF"
echo The file name is: %name%
pause
