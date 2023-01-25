#!/bin/bash
yum install httpd -y
service httpd start
chkconfig httpd on
echo -e "Hello, world\n<br>" > /var/www/html/index.html
hostname >> /var/www/html/index.html