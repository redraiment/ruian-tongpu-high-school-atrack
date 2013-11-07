@echo off
setlocal enabledelayedexpansion

set /P from=��ʼ����(YYYYMMDD): 
set /P to=��������(YYYYMMDD): 

set filelist=
for /F %%f in ('date-range %from% %to%') do (
  if exist data\ʳ��\%%f.txt (
    set filelist=!filelist! data\ʳ��\%%f.txt
  )
)

set reportfilename=report\ʳ��-%from%-%to%.txt
bin\awk.exe -f script\ʳ��ͳ��.awk %filelist% > %reportfilename%
type %reportfilename%
pause
