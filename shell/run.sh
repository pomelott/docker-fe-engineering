#!/bin/sh
param=$1
pathfile='/tmp/ekwing_fe_docker_path'

if [ "${param}" == "start" ] || [ "${param}" == "" ]
then
    vdir=$2
    if [ "${vdir}" == "" ]
    then
        deft="~/ek_fe"
        if [ ! -e "${pathfile}" ]
        then
            echo $deft >  "${pathfile}"
        fi
        vdir=`cat ${pathfile}`
    else
        ovdir=`cat ${pathfile}`
        if [ "${ovdir}" != "${vdir}" ]
        then
            echo $vdir > "${pathfile}"
        fi
    fi
    docker run -itv "${vdir}":/project --rm 172.17.20.119/bj-fe/node
fi