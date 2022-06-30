#!/bin/bash
# Postbuilder By Istiak Ferdous
# Author: Istiak Ferdous
# Website: https://istiakferdous.com
# Email: hello@istiakferdous.com

dnf update -y

dnf install -y wget unzip

echo -e "\nPlease enter new root password for MySQL: "
read mysqlrootpass

install_ols()  {
  rpm -Uvh https://rpms.litespeedtech.com/centos/litespeed-repo-1.1-1.el8.noarch.rpm
  dnf install -y openlitespeed
  dnf install lsphp74* lsphp80* lsphp81* -y
  ln -sf /usr/local/lsws/lsphp73/bin/lsphp /usr/local/lsws/fcgi-bin/lsphp5
  systemctl enable --now openlitespeed
  openssl req -newkey rsa:2048 -new -nodes -x509 -days 730 -subj "/C=BD/ST=Orion/L=Orion/O=Istiak Ferdous/CN=istiak.com" -keyout /usr/local/key.pem -out /usr/local/cert.pem
  wget https://hostboxcp.com/litespeed/httpd_config.conf
  mv /usr/local/lsws/conf/httpd_config.conf /usr/local/lsws/conf/httpd_config.conf.orig
  mv httpd_config.conf /usr/local/lsws/conf/httpd_config.conf
  chown lsadm:nobody /usr/local/lsws/conf/httpd_config.conf
  systemctl restart openlitespeed
}

install_mariadb()  {
  dnf install -y mariadb-server
  systemctl enable --now mariadb

  mysql -u root <<-EOF
UPDATE mysql.user SET Password=PASSWORD('$mysqlrootpass') WHERE User='root';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.db WHERE Db='test' OR Db='test_%';
FLUSH PRIVILEGES;
EOF

  systemctl restart mariadb
}

install_ols
install_mariadb
