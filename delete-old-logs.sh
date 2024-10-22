#!/bin/bash
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIRECTORY=/tmp/app.logs
#Check folder exists or not

if [ -d $SOURCE_DIRECTORY ]
then
echo "Source directory exists"
else
echo -e "$R Please make sure source directory exits $N"
fi

 #find . -name "*.log"