@echo off
setlocal enabledelayedexpansion

set /P from=开始日期(YYYYMMDD): 
set /P to=结束日期(YYYYMMDD): 

set filelist=
for /F %%f in ('date-range %from% %to%') do (
  if exist data\食堂\%%f.txt (
    set filelist=!filelist! data\食堂\%%f.txt
  )
)

set reportfilename=report\食堂-%from%-%to%.txt
bin\awk.exe -f script\食堂统计.awk %filelist% > %reportfilename%
type %reportfilename%
pause
