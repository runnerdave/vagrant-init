#!/bin/bash

# MySQL - maria db
#does not work in centos yum install -y mysql mysql-server mysql-devel
yum install -y mysql mariadb-server
systemctl enable mariadb
systemctl start mariadb

mysql -u root -e "SHOW DATABASES";