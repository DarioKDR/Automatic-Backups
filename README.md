# Automatic-Backups
A script used to automate backups using the Bitwarden CLI and 7-Zip.

# Requirements:
- Windows 10/11
- A Bitwarden account
- The [Bitwarden CLI](https://bitwarden.com/help/cli/)
- [7Zip](https://www.7-zip.org/)

# The actual script:
```
@echo off
setlocal enabledelayedexpansion

set "folderPath=C:\Users\Kodoro\Desktop\Kodoro"
set "zipPath=C:\Program Files\7-Zip\7z.exe"
set "outputPath=C:\Users\Kodoro\Desktop\Archive.7z"
set "bitwardenItemName=zzMasterBackup"

echo This is a script for automatic backups. Made by Kodoro
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
```
