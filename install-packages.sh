#!/bin/bash

#Using functions,colors,logfile,timestamp
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
userid=$(id -u)
Validate ()
{
    if [ $1 -eq 0 ]
    then
    echo -e "Installation of $2 is:: $G Success $N"
    else
    echo -e "Installation of $2 is:: $R Failure $N"
    exit 1
    fi
}

if [ $userid -eq 0 ]
then
echo "User have root previlages"
else
echo "Run with root access"
exit 1
fi

for i in $@
do 
   echo "Packages to install:: $i"

dnf list installed $i &>>$LOGFILE

if [ $? -eq 0 ]
then
echo -e "Package already installed....$Y Skipping $N"
else
dnf install $i -y&>>$LOGFILE
Validate $? "Installation of $i"
fi
done