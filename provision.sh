#!/bin/bash

apache_config_file="/etc/apache2/envvars"
apache_vhost_file="/etc/apache2/sites-available/vagrant_vhost.conf"
php_config_file="/etc/php7.2/apache2/php.ini"
xdebug_config_file="/etc/php7.2/mods-available/xdebug.ini"
mysql_config_file="/etc/mysql/my.cnf"
default_apache_index="/var/www/html/index.html"

# This function is called at the very bottom of the file
main() {
	update_go

	if [[ -e /var/lock/vagrant-provision ]]; then
	    cat 1>&2 << EOD
################################################################################
# To re-run full provisioning, delete /var/lock/vagrant-provision and run
#
#    $ vagrant provision
#
# From the host machine
################################################################################
EOD
	    exit
	fi

	network_go
	tools_go
	apache_go
	php_go
	mysql_go
	setup_app

	touch /var/lock/vagrant-provision
}

update_go() {
	# Update the server
	apt-get update
	apt-get -y upgrade

	apt-get install software-properties-common
	add-apt-repository ppa:ondrej/php
	apt-get update
}

network_go() {
	IPADDR=$(/sbin/ifconfig eth0 | awk '/inet / { print $2 }' | sed 's/addr://')
	sed -i "s/^${IPADDR}.*//" /etc/hosts
	echo ${IPADDR} ubuntu.localhost >> /etc/hosts			# Just to quiet down some error messages
}

tools_go() {
	# Install basic tools
	apt-get -y install build-essential binutils-doc git
}

apache_go() {
	# Install Apache
	apt-get -y install apache2

	sed -i "s/^\(.*\)www-data/\1vagrant/g" ${apache_config_file}
	chown -R vagrant:vagrant /var/log/apache2

	cat << EOF > ${apache_vhost_file}
<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /vagrant/public_html
        LogLevel debug

        ErrorLog /var/log/apache2/error.log
        CustomLog /var/log/apache2/access.log combined

        <Directory /vagrant/public_html>
            AllowOverride All
            Require all granted
        </Directory>
</VirtualHost>
EOF

	a2dissite 000-default
	a2ensite vagrant_vhost

	a2enmod rewrite

	service apache2 reload
	update-rc.d apache2 enable
}

php_go() {
	apt-get -y install php7.2 php7.2-curl php7.2-mysql php7.2-sqlite php7.2-xdebug
	apt-get -y install zip unzip php7.2-zip

	sed -i "s/display_startup_errors = Off/display_startup_errors = On/g" ${php_config_file}
	sed -i "s/display_errors = Off/display_errors = On/g" ${php_config_file}

	cat << EOF > ${xdebug_config_file}
zend_extension=xdebug.so
xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.remote_port=9000
xdebug.remote_host=10.0.2.2
EOF
	service apache2 reload
}

mysql_go() {
	# Install MySQL
	echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
	echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
	apt-get -y install mysql-client mysql-server

	sed -i "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" ${mysql_config_file}

	# Allow root access from any host
	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION" | mysql -u root --password=root
	echo "GRANT PROXY ON ''@'' TO 'root'@'%' WITH GRANT OPTION" | mysql -u root --password=root

	service mysql restart
	update-rc.d apache2 enable
}

setup_app() {
	echo ">>>>>> Starting Setup..."
	cd /vagrant/public_html

	echo ">>>>>> Installing NPM..."
	curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

	echo ">>>>>> Installing Node..."
	sudo apt-get install nodejs

	echo ">>>>>> Installing Composer..."
	curl -sS https://getcomposer.org/installer | php
	sudo mv composer.phar /usr/local/bin/composer

	echo ">>>>>> Installing Codeigniter..."
	cd /vagrant
	composer require codeigniter/framework
	
	echo ">>>>>> Creating new git Repo..."
	cd /vagrant/public_html
	git init

}

main
exit 0