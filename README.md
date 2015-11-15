Vagrant LAMP
============
Inspired by and derived from <https://github.com/mattandersen/vagrant-lamp>

Requirements
------------
* VirtualBox <http://www.virtualbox.com>
* Vagrant <http://www.vagrantup.com>
* Git <http://git-scm.com/>

Usage
-----

### Startup
	$ git clone https://github.com/DustinCarpenter/vagrant-lamp
	$ cd vagrant-lamp
	$ vagrant up

### Connecting

#### SSH
The web root is located in the project directory at `src/` and you can install your files there

You have SSH access with

	$ vagrant ssh

#### Apache
The Apache server is available at <http://localhost:8888>

#### MySQL
Externally the MySQL server is available at port 8889, when running on the VM it is available as a socket or at port 3306.
Username: root
Password: root

Technical Details
-----------------
* Ubuntu 14.04 64-bit
* Apache 2
* PHP 5.5
* MySQL 5.5