#!/bin/bash

USAGE(){
  echo "$USAGE: $0 <tomcat-version>"
}
#vars section
USERID=$(id -u)
DATE=$(date +"%F-%H-%M")
LOG_PATH=/var/log/tomcat
LOG_FILE="tomcat_$DATE.log"
TOMCAT_VERSION=$1

#Check if the tomcat version is provided in arguments or not
if [[ -z $TOMCAT_VERSION ]]
then
  USAGE
  exit 1
fi

TOMCAT_MAJOR_VERSION=$(echo $TOMCAT_VERSION | cut -d "." -f1)
TOMCAT_URL=https://dlcdn.apache.org/tomcat/tomcat-$TOMCAT_MAJOR_VERSION/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
TOMCAT_DIR=apache-tomcat-$TOMCAT_VERSION
TOMCAT_TAR_FILE=$(echo $TOMCAT_URL | awk -F "/" '{print $NF}')
TOMCAT_PROCESS="catalina"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#Check if the user is sudo or not
if [[ $USERID -ne 0 ]]
then
  echo -e "$R Please run this script with sudo or root access $N"
  exit 1
fi

VALIDATE(){
  if [[ $1 -ne 0 ]]
  then
    echo -e "$2 ... $R FAILED $N"
    exit 1
  else
    echo -e "$2 ... $G SUCCESS $N"
  fi
}

if [[ -d $LOG_PATH ]]
then
  echo "Log path already exists"
else
  mkdir -p $LOG_PATH
fi

#Install dependency packages
apt install wget curl net-tools vim openjdk-17-jdk -y &>> $LOG_PATH/$LOG_FILE
VALIDATE $? "Installing Dependency packages"

#Download tomcat tarball
mkdir -p /opt/tomcat
cd /opt/tomcat

if [[ -d $TOMCAT_DIR ]]
then
  echo -e "$Y Tomcat already exists $N"
else
  wget $TOMCAT_URL &>> $LOG_PATH/$LOG_FILE
  VALIDATE $? "Downloading Tomcat"
  tar -xvzf $TOMCAT_TAR_FILE &>> $LOG_PATH/$LOG_FILE
  VALIDATE $? "Extracting tomcat archive"
  rm -rf $TOMCAT_TAR_FILE &>> $LOG_PATH/$LOG_FILE
  VALIDATE $? "Remove tomcat archive"
fi

#Stop Tomcat service
cd /opt/tomcat/$TOMCAT_DIR/bin
if ps aux | grep -q "$TOMCAT_PROCESS"; then
  ./shutdown.sh &>> $LOG_PATH/$LOG_FILE
  VALIDATE $? "Stopping tomcat server"
fi

#Start Tomcat service
./startup.sh &>> $LOG_PATH/$LOG_FILE
VALIDATE $? "Start tomcat server"

#Install mariaDB server
apt install mariadb-server -y &>> $LOG_PATH/$LOG_FILE
VALIDATE $? "Installing MariaDB Server"

#Starting MariaDB server
systemctl start mariadb &>> $LOG_PATH/$LOG_FILE
VALIDATE $? "Starting MariaDB Server"

#Enable mariaDB server
systemctl enable mariadb &>> $LOG_PATH/$LOG_FILE
VALIDATE $? "Enable MariaDB Server"

#Create Database Table
echo "create database if not exists ishop;

use ishop;

CREATE TABLE if not exists customer (
    customer_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mobile VARCHAR(20) NOT NULL,
    address VARCHAR(200) NOT NULL,
    date_of_birth VARCHAR(50) NOT NULL,
    PRIMARY KEY (customer_id)
);

GRANT ALL PRIVILEGES ON ishop.* TO 'ishop'@'%' IDENTIFIED BY 'ishop@%';" > /tmp/ishop.sql

mysql < /tmp/ishop.sql &>> $LOG_PATH/$LOG_FILE
VALIDATE $? "Create Database and table"
