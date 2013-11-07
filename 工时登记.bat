@echo off

color F9
cls

echo 输入Ctrl-C退出
echo.
echo 请依次输入员工卡号

bin\awk.exe -f script\工时登记.awk data\employee.txt -
