#!/bin/bash

#Using functions

userid=$(id -u)
Validate ()
{
    if ( $1 -eq 0 )
    then
    echo "Installation of $2 is:: Success"
    else
    echo "Installation of $2 is:: Failure"
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
dnf install mysql -y
Validate $? "mysql"

dnf install nodejs -y
Validate $? "nodejs"