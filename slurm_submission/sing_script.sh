#!/bin/bash

echo == SING SCRIPT staring at `date`



#check certificate
echo === Checking Certificate $CERTIFICATE for validity of 24h
export X509_USER_PROXY=$CERTIFICATE
voms-proxy-info -exists -valid 24:00:00
if [ $? != 0 ]
then
    echo === ERROR: certificate $X509_USER_PROXY is not valid for at least 24h
    exit 1
fi

#go to work area

cd $WORK_AREA
if [ $? != 0 ]
then
    echo === ERROR: WORK area $WORK_AREA not existing / accessible
    exit 2
fi

mkdir -p GWMS_DIR
mkdir GWMS_DIR/bin
export GWMS_DIR=`pwd`/GWMS_DIR

./glidein_startup_wrapper

echo == SING SCRIPT finishing at `date` with code $?

exit 0

