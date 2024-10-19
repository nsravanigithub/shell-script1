#!/bin/bash
#installation of mysql
userid=$(id -u)

if [ $userid -eq 0 ]
then
echo "User have root previlages"
else
echo "Run with root access"
fi
dnf install mysql -y
