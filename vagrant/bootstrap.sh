#!/usr/bin/env bash

echo "Provisioning virtual machine..."
echo "=========================================="
echo "Updating Ubuntu"
sudo apt-get update > /dev/null
sudo apt-get upgrade > /dev/null

# PHP
echo "Updating PHP repository"
sudo apt-get update > /dev/null 2>&1
sudo apt-get upgrade > /dev/null 2>&1
sudo apt-get install php5 -y > /dev/null

echo "Installing YAZ PHP"
sudo apt-get install yaz libyaz4 libyaz4-dev -y > /dev/null 2>&1
sudo printf "\n" | pecl install yaz > /dev/null 2>&1

# MySQL
echo "Preparing MySQL"
sudo apt-get install debconf-utils -y > /dev/null
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySQL"
sudo apt-get install mysql-server-5.6 -y > /dev/null
sudo apt-get install -y mysql-client > /dev/null

echo "Installing PHP extensions"
sudo apt-get install php5-sqlite php5-xmlrpc php5-geoip -y > /dev/null 2>&1

# Installing Composer
echo "Installing Composer"
sudo curl -sS https://getcomposer.org/installer | php > /dev/null 2>&1
sudo mv composer.phar /usr/local/bin/composer > /dev/null 2>&1

# Installing Node
echo "Installing Node"
sudo curl -sL https://deb.nodesource.com/setup | sudo bash - > /dev/null 2>&1
sudo sudo apt-get install -y nodejs > /dev/null
sudo npm install npm -g

echo "Installing Bower"
sudo npm install bower -g > /dev/null

echo "Installing Gulp"
sudo npm install gulp -g > /dev/null

echo "Finished provisioning."
