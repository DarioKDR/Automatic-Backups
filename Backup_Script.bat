:: A batch script used to automate backups, compressing and encrypting the data, using the Bitwarden CLI and 7-Zip.
:: Current version: v1.0-beta.1

@echo off
setlocal enabledelayedexpansion

:: Modify the following variables to your personal needs:

:: "folderPath"= Path of the files you want to backup
:: "zipPath"= Path where "7z.exe" is installed
:: "outputPath"= Path where the backup file (including filename) will be created, for example: "C:\BackupsFolder\Backup01.7z"
:: "bitwardenItemName"= The name of the item where your password is stored (This item has to be created beforehand) easily done with the Desktop Application.

set "folderPath=C:\"
set "zipPath=C:\"
set "outputPath=C:\"
set "bitwardenItemName=ItemExample"

echo This is a script used to automate backups using the Bitwarden CLI and 7-Zip.
echo Press any key to log in to Bitwarden...
pause > nul
start /wait cmd /c bw login

for /f "tokens=*" %%a in ('bw get password %bitwardenItemName%') do set "password=%%a"
echo Press any key to proceed with the backup...
pause > nul

"%zipPath%" a -t7z -mx9 -p!password! "%outputPath%" "%folderPath%"
echo Press any key to log out from Bitwarden...
pause > nul
start /wait cmd /c bw logout

endlocal