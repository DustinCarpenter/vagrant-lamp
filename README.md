# Vagrant LAMP

Inspired by, and derived from: <https://github.com/mattandersen/vagrant-lamp>

### Requirements

* VirtualBox <http://www.virtualbox.com>
* Vagrant <http://www.vagrantup.com>
* Git <http://git-scm.com/>

## Getting Started

	$ git clone https://github.com/DustinCarpenter/vagrant-lamp
	$ cd vagrant-lamp
	$ vagrant up

### What you get...

* Ubuntu 14 (ubuntu/trusty64)
* Apache 2
* PHP 7.2.x
* MySQL 5.5.x
* Node.js 10.x.x
* NPM
* Composer
* Git
* CodeIgniter 3.x.x
* Jquery-3.3.1 (CDN)
* Bootstrap 4.2.1 (CDN)
* Font Awesome - Free 5.6.3 (CDN)

### Web Folder
The web root is located in your project directory at `public_html/`. Vagrant has mapped the apache servers default site to here where it is actually hosted from your host machine.

The web server is available at <http://localhost:8888>

Since CodeIgniter is included in this package, `vagrant-lamp/application` is where you'll work on your project. The CodeIgniter system path defined in index.php points to `../vendor/codeigniter/framework/system` where Composer installed it.

### MySQL
On your host machine the MySQL server is available at port 8889.  
When running on the VM, the MySQL server is available as a socket or at port 3306.

**Username:** `root`  
**Password:** `root`

### SSH

Connect to your server via Vagrant SSH in your project folder.

	$ vagrant ssh
	$ cd /vagrant/public_html