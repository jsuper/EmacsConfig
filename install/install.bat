@echo off
rem Using this bat to install the emacs configuration on windows 
rem To install this on linux, please see install.sh
cd /d %~dp0
set CURRENT_DIR=%cd%
set CURRENT_DIR=%CURRENT_DIR:\=/%
echo [INFO] %CURRENT_DIR%
set CONTENT=(load-file "%CURRENT_DIR%/../.emacs")

VER | FIND "6.1">>1
del 1

if errorlevel 0 goto WIN7

echo [INFO] Win Xp Host
set EMACS_HOME=%HOME%

:WIN7
echo [INFO] Win Seven Host
set EMACS_HOME=%APPDATA%

if not exist "%EMACS_HOME%\.emacs" goto CREATE_DOT_EMACS
echo [INFO] Backup .emacs to .emacs.bak
copy "%EMACS_HOME%\.emacs" "%EMACS_HOME%\.emacs.bak" >>1
del 1
del "%EMACS_HOME%\.emacs"

:CREATE_DOT_EMACS
echo [INFO] Create .emacs to link to %CURRENT_DIR%/../.emacs
echo %CONTENT%>>"%EMACS_HOME%\.emacs"
echo [INFO] Install succesfully
