#!/bin/bash

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

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/runnerdave/vagrant-init/master/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/runnerdave/vagrant-init/master/files/info.php

service httpd restart