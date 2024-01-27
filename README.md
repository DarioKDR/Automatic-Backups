# Automatic-Backups
A batch script used to automate backups, compressing and encrypting the data, using the Bitwarden CLI and 7-Zip.

## Requirements:
- Windows 11
- A Bitwarden account
- A Bitwarden item to securely store the password for the backup process (easily created through the Desktop Application)
- The [Bitwarden CLI](https://bitwarden.com/help/cli/)
- And lastly [7-Zip](https://www.7-zip.org/)


## How does the script work?
1. The script reads a list of variables.
2. Asks the user for Bitwarden Credentials.
3. After logging in, the backup will request the master password again (to unlock the vault).
4. The backup is created using the password from the item set inside the script.
5. After the backup is finished, the Bitwarden account will log out.

## The actual script:
```batch
@echo off
setlocal enabledelayedexpansion

:: Modify the following variables to your personal needs:

:: "folderPath"= Path of the files you want to backup
:: "zipPath"= Path where "7z.exe" is installed
:: "outputPath"= Path where the backup file (including filename) will be created, for example: "C:\BackupsFolder\Backup01.7z"
:: "bitwardenItemName"= The name of the item where your password is stored (This item has to be created beforehand) easily done with the Desktop Application.

set "folderPath=C:\"
set "zipPath=C:\Program Files\7-Zip\7z.exe"
set "outputPath=C:\Backups"
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
```

## Here is a preview with images:

![Script_Preview_01](https://github.com/DarioKDR/Automatic-Backups/assets/110359877/7b483de2-86c8-43f9-8676-3ea01ee56cf6)
![Script_Preview_02](https://github.com/DarioKDR/Automatic-Backups/assets/110359877/ea74eb54-9805-4006-b021-dc5b1c9a3350)
