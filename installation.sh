#!/bin/bash
#installation of mysql
userid=$(id -u)

if [ $userid -eq 0 ]
then
echo "User have root previlages"
else
echo "Run with root access"
exit status
fi
dnf install mysql -y

if [ $? -eq 0 ]
then
echo "Installation successful"
else
echo "Installation not successfull"
fi
