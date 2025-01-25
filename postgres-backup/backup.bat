@echo off
:: Define variables
set DB_HOST=localhost
set DB_PORT=5432
set DB_USER=postgres
set DB_NAME=ehrcs
set BACKUP_DIR=C:\xampp\htdocs\workshop2\workshop2\postgres-backup
set BACKUP_FILE=%BACKUP_DIR%\latest_backup.sql
set PGPASSWORD=postgresql
set REDEMPTION_DAYS=7

:: Ensure backup directory exists
if not exist "%BACKUP_DIR%" (
    mkdir "%BACKUP_DIR%"
)

:: Perform the backup and overwrite the latest_backup.sql file
pg_dump -h %DB_HOST% -p %DB_PORT% -U %DB_USER% -d %DB_NAME% -F p -b -v -f "%BACKUP_FILE%"

if %ERRORLEVEL% EQU 0 (
    echo Backup successful!
) else (
    echo Backup failed!
)