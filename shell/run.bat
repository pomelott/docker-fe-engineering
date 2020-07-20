@echo off 
set param=%1

if "%param%" == "" set param=start
if %param% == "start" goto start

:start
    set vdir=%2
    if "%vdir%" == "" set vdir=/mnt/project
    docker run -itv %vdir%:/project --rm 172.17.20.119/bj-fe/node
    goto end


:end