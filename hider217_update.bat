@echo off
echo ************
echo * hider217 *
echo ************
echo ================================================================
echo Welcome!!
echo Written By Bhargav Patil
echo For Help And Extra Information Please Visit 
echo http://cybersecurityfly.com/
echo ================================================================
IF EXIST "C:\logs\logs.brp" goto mains
if not exist "C:\logs\logs.brp" goto account

:mains
echo Select an option 
echo 1. Login
echo 2. Forgot Password
set /p z=Option: 
if %z%==1 ( goto login ) 
if %z%==2 ( goto recovery )

:recovery
cls
echo ================================================================
echo Recovery Question
echo ================================================================

< C:\logs\recovery.brp (
		set /p que=
		set /p ans=	)	
	
echo %que%
set /p checking=Answer: 
if %ans% == %checking% ( goto reset ) else ( goto wrongs )

:wrongs
cls
echo Enter Correct Answer!!
timeout 2
goto recovery

:reset
cls
echo ================================================================
echo Reset Panel
echo ================================================================

set /p name=Enter New Username: 
set /p pass=Enter New password: 
echo ================================================================
echo Reseting user User....
echo ================================================================
timeout 2
echo ================================================================
echo "Process Completed succesfully!!"
echo ================================================================
timeout 2	
	echo Hello %name%! 
	(
		echo %name%
		echo %pass%
	) > C:\logs\logs.brp
goto login


:login
cls
echo ================================================================
echo Login Panel
echo ================================================================
echo Please enter your username and password 
	< C:\logs\logs.brp (
		set /p name=
		set /p pass=	)
	
	< C:\logs\fldr.brp (
		set /p fldr=	)	
	
	set /p newname=Username: 
	
	set /p newpass=Password: 
	if %name% == %newname% ( goto passcheck ) else ( goto wrong )

:passcheck
if %pass% == %newpass% ( goto menu ) else ( goto wrong )

:account
echo Our script will help you to hide your files....
echo Stay safe with username and password
echo Enter Username
set /p name=
echo Enter Your password
set /p pass=
echo Add recovery question
set /p req=
echo Answer of question
set /p ans=
md C:\logs\
attrib +h +s C:\logs
echo Creating User....
timeout 3
echo "User created succesfully!!"
echo ================================================================
	echo Hello %name%! 
	(
		echo %name%
		echo %pass%
	) > C:\logs\logs.brp
	(
		echo %req%
		echo %ans%
	) > C:\logs\recovery.brp
goto menu

:wrong
echo ================================================================
echo Please Enter Valid credentials
echo ================================================================
goto login

:menu
cls
echo ================================================================
echo Select Action
echo ================================================================
echo 1. Private Folder
echo 2. Existing File
echo 3. Exit
set /p ch=Your Option: 
if %ch%==1 ( goto private )
if %ch%==2 ( goto existingfile )
if %ch%==3 ( goto last )

:private
cls
echo ================================================================
echo Select Action
echo ================================================================
echo NOTE: Create your private folder first!
echo 1. Hide Private Folder
echo 2. Unhide Private Folder
echo 3. Create private folder.
echo 4. Menu
set /p op=Option: 
echo %op%
if %op%==1 ( goto lock ) 
if %op%==2 ( goto unlock )
if %op%==3 ( goto create )
if %op%==4 ( goto menu )

:create
cls
echo ================================================================
echo Private Folder
echo ================================================================
echo NOTE: This Folder Will Appear On Given Location
echo EXAMPLE: Want to create file in New Volume(D:) 
echo Enter D:\foldername
set /p fldr=Location Of Folder: 
md %fldr%
	(
		echo %fldr%
	) >> C:\logs\fldr.brp
echo Folder created succesfully!!
goto menu

:lock
::cls
echo ================================================================
echo Confirmation
echo ================================================================
echo Are you sure you want to hide the folder(Y/N)
 set/p "choi=>"
 if %choi%==Y goto folderhide
 if %choi%==y goto folderhide
 if %choi%==n goto menu
 if %choi%==N goto menu
 
:folderhide
cls
attrib +h +s %fldr%
echo ================================================================
echo Action Performed Succesfully!
echo ================================================================
timeout 2
goto menu

:unlock
cls
attrib -h -s %fldr%
echo ================================================================
echo Action Performed Succesfully
echo ================================================================
timeout 2
goto menu

:existingfile
cls
echo ================================================================
echo Select Action
echo ================================================================
echo NOTE: First add your file to the list in order to hide it! 
echo 1. Hide File/Unhide File
echo 2. Add file to the list
echo 3. Menu
set /p x=Option: 
if %x%==1 ( goto displaylist ) 
if %x%==2 ( goto filechooser )
if %x%==3 ( goto menu )

:filechooser
cls
set pwshcmd=powershell -noprofile -command "&{[System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null;$OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog; $OpenFileDialog.ShowDialog()|out-null; $OpenFileDialog.FileName}"
for /f "delims=" %%I in ('%pwshcmd%') do set "FileName=%%I"

echo %FileName%
	(
		echo %FileName%
	) >> C:\logs\hidlist.brp
	
goto menu

:displaylist
cls
echo ================================================================
echo List Of Files And Folders
echo ================================================================
setlocal EnableDelayedExpansion
set i=0
for /F %%a in (C:\logs\hidlist.brp) do (
   set /A i+=1
   set array[!i!]=%%a
)
set n=%i%
for /L %%i in (1,1,%n%) do echo %%i. !array[%%i]!
goto selectfile


:selectfile
::cls
echo ================================================================
echo Select File Or Folder
echo ================================================================
set /p a=File Number: 
echo !array[%a%]! Slected
echo Select an option 
echo 1. Hide File
echo 2. Unhide File
echo 3. Menu
set /p y=Option: 
if %y%==1 ( goto close ) 
if %y%==2 ( goto open )
if %y%==3 ( goto menu )


:open
cls
attrib -h -s !array[%a%]!
echo ================================================================
echo Action Performed Succesfully
echo ================================================================
timeot 2
goto menu

:close
cls
attrib +h +s !array[%a%]!
echo ================================================================
echo Action Performed Succesfully
echo ================================================================
timeout 2
goto menu

:last

echo Please Wait...
timeout 3