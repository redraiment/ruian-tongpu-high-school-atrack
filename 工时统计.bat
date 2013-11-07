@echo off
setlocal enabledelayedexpansion

set /P from=��ʼ����(YYYYMMDD): 
set /P to=��������(YYYYMMDD): 

set filelist=
for /F %%f in ('date-range %from% %to%') do (
  if exist data\��ʱ\%%f.txt (
    set filelist=!filelist! data\��ʱ\%%f.txt
  )
)

set reportfilename=report\��ʱ-%from%-%to%.txt
bin\awk.exe -f script\��ʱͳ��.awk %filelist% > %reportfilename%
type %reportfilename%
pause
