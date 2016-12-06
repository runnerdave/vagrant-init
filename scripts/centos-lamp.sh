#!/bin/bash

# Update CentOS with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --reload

rm -rf /var/www/html
ln -s /vagrant /var/www/html 

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# MySQL - maria db
#does not work in centos yum install -y mysql mysql-server mysql-devel
yum install -y mysql mariadb-server
systemctl enable mariadb
systemctl start mariadb

mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/runnerdave/vagrant-init/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/runnerdave/vagrant-init/master/files/info.php

service httpd restart