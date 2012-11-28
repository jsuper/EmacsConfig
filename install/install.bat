@echo off
rem Using this bat to install the emacs configuration on windows 
rem To install this on linux, please see install.sh
cd /d %~dp0
set CURRENT_DIR=%cd%
set CURRENT_DIR=%CURRENT_DIR:\=/%
echo [INFO] %CURRENT_DIR%
set CONTENT=(load-file "%CURRENT_DIR%/../.emacs")

if not exist "%HOME%\.emacs" goto CREATE_DOT_EMACS
echo [INFO] Backup .emacs to .emacs.bak
copy "%HOME%\.emacs" "%HOME%\.emacs.bak" >>1
del 1
del "%HOME%\.emacs"

:CREATE_DOT_EMACS
echo [INFO] Create .emacs to link to %CURRENT_DIR%/../.emacs
echo %CONTENT%>>"%HOME%\.emacs"
echo [INFO] Install succesfully