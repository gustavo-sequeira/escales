@echo off
chcp 65001 > nul
title PostgreSQL Backup Manager

:menu
cls
echo ========================================
echo        GERENCIADOR DE BACKUP PostgreSQL
echo ========================================
echo.
echo 1. Fazer backup de uma base especifica
echo 2. Listar backups existentes
echo 3. Restaurar backup
echo 4. Sair
echo.
set /p choice="Escolha uma opcao: "

if "%choice%"=="1" goto backup
if "%choice%"=="2" goto list
if "%choice%"=="3" goto restore
if "%choice%"=="4" exit
goto menu

:backup
cls
echo.
@set /p DATABASE="Nome da base de dados: "
@set /p PGUSER="Usuario (padrao: postgres): "
if "%PGUSER%"=="" set PGUSER=postgres
set /p PGPASSWORD="Senha: "

@set PGPATH=C:\Program Files\PostgreSQL\17\bin\
@set PGHOST=localhost
@set PGPORT=5432
@set BACKUP_DIR=C:\Backups\PostgreSQL\
@set DATE=%date:~-4,4%-%date:~-7,2%-%date:~-10,2%
@set TIME=%time:~0,2%-%time:~3,2%-%time:~6,2%
@set FILENAME=%DATABASE%_%DATE%_%TIME%.backup

if not exist "%BACKUP_DIR%" mkdir "%BACKUP_DIR%"

echo Executando backup de %DATABASE%...
"%PGPATH%pg_dump.exe" -h %PGHOST% -p %PGPORT% -U %PGUSER% -F c -b -v -f "%BACKUP_DIR%%FILENAME%" %DATABASE%

if %errorlevel% equ 0 (
    echo Backup concluido com sucesso!
    echo Arquivo: %BACKUP_DIR%%FILENAME%
) else (
    echo Erro no backup!
)

pause
goto menu

:list
cls
echo.
echo Backups existentes em C:\Backups\PostgreSQL\
echo.
dir "C:\Backups\PostgreSQL\*.backup" /b
echo.
pause
goto menu

:restore
cls
echo.
echo RESTAURAR BACKUP (COM SOBRESCRITA COMPLETA)
echo.
set /p RESTORE_FILE="Nome do arquivo de backup: "
set /p RESTORE_DB="Nome da base para restaurar: "

@set PGPATH=C:\Program Files\PostgreSQL\17\bin\
@set PGHOST=localhost
@set PGPORT=5432
@set PGUSER=postgres
@set /p PGPASSWORD="Senha do PostgreSQL: "

echo.
echo ATENCAO: Esta operacao ira SOBRESCREVER COMPLETAMENTE a base %RESTORE_DB%!
echo Todos os dados atuais serao perdidos e substituidos pelo backup.
echo.
@set /p CONFIRM="Tem certeza que deseja continuar? (S/N): "

if /i not "%CONFIRM%"=="S" (
    echo Operacao cancelada.
    pause
    goto menu
)

echo.
echo 1. Verificando se a base de dados existe...
"%PGPATH%psql.exe" -h %PGHOST% -p %PGPORT% -U %PGUSER% -l -q | findstr /C:"%RESTORE_DB%" >nul

if %errorlevel% equ 0 (
    echo A base %RESTORE_DB% existe. Prosseguindo com a restauracao...
) else (
    echo A base %RESTORE_DB% nao existe. Criando nova base...
    "%PGPATH%createdb.exe" -h %PGHOST% -p %PGPORT% -U %PGUSER% -E UTF8 %RESTORE_DB%
    if %errorlevel% neq 0 (
        echo Erro ao criar a base de dados!
        pause
        goto menu
    )
)

echo.
echo 2. Restaurando estrutura e dados (com sobrescrita)...
echo Esta operacao pode demorar varios minutos...
echo.

REM Restaurar com opcoes para sobrescrever completamente
"%PGPATH%pg_restore.exe" -h %PGHOST% -p %PGPORT% -U %PGUSER% -d %RESTORE_DB% --clean --if-exists --create --verbose "C:\Backups\PostgreSQL\%RESTORE_FILE%"

if %errorlevel% equ 0 (
    echo.
    echo ===========================================
    echo RESTAURACAO CONCLUIDA COM SUCESSO!
    echo A base %RESTORE_DB% foi completamente sobrescrita.
    echo ===========================================
) else (
    echo.
    echo ===========================================
    echo ERRO NA RESTAURACAO!
    echo ===========================================
    echo Verifique:
    echo - Se o arquivo de backup existe
    echo - Se a senha esta correta
    echo - Se o usuario tem privilegios suficientes
)

echo.
pause
goto menu