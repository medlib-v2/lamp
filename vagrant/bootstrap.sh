#!/usr/bin/env bash

echo "Provisioning virtual machine..."
echo "=========================================="
echo "Updating Ubuntu"
sudo apt-get update > /dev/null
sudo apt-get upgrade > /dev/null

# Apache
echo "Installing Apache"
sudo apt-get install apache2 -y > /dev/null
# enable mod_rewrite
sudo a2enmod rewrite
# restart apache
service apache2 restart

# PHP
echo "Updating PHP repository"
sudo apt-get install python-software-properties -y > /dev/null
sudo add-apt-repository ppa:ondrej/php5-oldstable -y > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install -y php5 > /dev/null

echo "Installing PHP"
sudo apt-get install php5-common php5-dev php5-cli php5-fpm php5-xsl php-pear -y > /dev/null
sudo apt-get install yaz libyaz4 libyaz4-dev -y > /dev/null
sudo pecl install yaz -y > /dev/null

#echo "Installing PHP extensions"
sudo apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql php5-xdebug php5-memcached php5-memcache php5-sqlite php5-json php5-xmlrpc php5-geoip -y > /dev/null

# Install Git
echo "Installing Git"
sudo apt-get install git -y > /dev/null

# Installing Composer
echo "Installing Composer"
sudo curl -sS https://getcomposer.org/installer | php > /dev/null
sudo mv composer.phar /usr/local/bin/composer > /dev/null

# Installing Node
echo "Installing Node"
sudo curl -sL https://deb.nodesource.com/setup | sudo bash - > /dev/null
sudo sudo apt-get install -y nodejs > /dev/null
sudo npm install npm -g

echo "Installing Bower"
sudo npm install bower -g > /dev/null

echo "Installing Gulp"
sudo npm install Gulp -g > /dev/null

echo "Finished provisioning."
