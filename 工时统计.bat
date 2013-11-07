@echo off
setlocal enabledelayedexpansion

set /P from=开始日期(YYYY-MM-DD): 
set /P to=结束日期(YYYY-MM-DD): 

set filelist=data\employee.txt
for /F %%f in ('date-range %from% %to%') do (
  if exist data\工时\%%f.txt (
    set filelist=!filelist! data\工时\%%f.txt
  )
)

set reportfilename=report\工时-%from%-%to%.txt
bin\awk.exe -f script\工时统计.awk %filelist% > %reportfilename%
type %reportfilename%
pause
