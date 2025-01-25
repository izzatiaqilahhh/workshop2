@echo off
:: Set MySQL credentials
set db_user=root
set db_password=
set db_name=hostelcomplaint
set backup_path=C:\xampp\htdocs\workshop2\autobackupmysql
set backup_file="%backup_path%\%db_name%_backup.sql"

:: Set the path to mysqldump.exe
set mysqldump_path=C:\xampp\mysql\bin\mysqldump.exe

:: Ensure the backup path exists
if not exist "%backup_path%" mkdir "%backup_path%"

:: Debug info
echo Using mysqldump path: "%mysqldump_path%"
echo Saving backup to: %backup_file%

:: Perform the backup and overwrite the file
"%mysqldump_path%" -u %db_user% %db_name% > %backup_file%

:: Check if the backup was successful
if %errorlevel%==0 (
    echo Backup successful! Saved to %backup_file%
) else (
    echo Backup failed!
)

pause