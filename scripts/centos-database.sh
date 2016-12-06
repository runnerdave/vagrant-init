#!/bin/bash

# MySQL - maria db
#does not work in centos 7 yum install -y mysql mysql-server mysql-devel
yum install -y mysql mariadb-server
systemctl enable mariadb
systemctl start mariadb

firewall-cmd --permanent --add-port=3306/tcp
firewall-cmd --reload

mysql -u root -e "SHOW DATABASES";