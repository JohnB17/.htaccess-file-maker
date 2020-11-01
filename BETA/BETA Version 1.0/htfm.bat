@echo off

CLS
ECHO John's .htaccess File Maker
ECHO.
ECHO What Would You Like it to Do?
ECHO 1.Redirect
ECHO.

CHOICE /C 12345 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 1 GOTO Redirect

:Redirect
CLS
ECHO John's .htaccess File Maker
ECHO.
ECHO Please enter the URL you would like this to redirect to.
SET /P url=URL:

ECHO Do you want it as a permanant or a temporary redirect?
ECHO 1.Permanant
ECHO 2.Temporary
ECHO.

CHOICE /C 12345 /M "Enter your choice:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 2 GOTO Temporary
IF ERRORLEVEL 1 GOTO Permanant

:Permanant
ECHO redirectMatch 301 ^(.*)$ %url%>> .htaccess
GOTO End

:Temporary
ECHO
redirectMatch 302 ^(.*)$ %url% >> .htaccess

:End
ECHO END
pause