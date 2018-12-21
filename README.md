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

* Ubuntu 14.04 (ubuntu/trusty64)
* Apache 2
* PHP 5.5
* MySQL 5.5
* Node.js
* NPM
* Bower
* Composer
* Grunt.js
* Grunt wiredep
* Git
* jQuery 3.x.x
* Twitter Bootstrap 3.x.x
* CodeIgniter 3.x.x

### Startup
At first boot up, the `package.json`, `bower.json` and `composer.json` files will be installed and placed in their package folders. A new git repo is created inside the **src** folder containing a `.gitignore` file to ignore these and other common files.

### Web Folder
The web root is located in your project directory at `src/`. Vagrant has mapped the apache servers default site to here where it is actually hosted from your host machine.

Since CodeIgniter is included in this package, `src/application` is where you'll work on your project. The CodeIgniter system path has in index.php now points to `src/vendor/codeigniter/framework/system` where Composer installed it.

The web server is available at <http://localhost:8888>

### MySQL
On your host machine the MySQL server is available at port 8889.  
When running on the VM, the MySQL server is available as a socket or at port 3306.

**Username:** `root`  
**Password:** `root`

### SSH

Connect to your server via Vagrant SSH in your project folder.

	$ vagrant ssh
	$ cd /vagrant/src

#### Dependency Management via Bower, Grunt and wiredep

When everything was installed the first time, vagrant ran `$ grunt wiredep`. This inserted the template paths for any bower package it found in the `bower.json` file.

To make use of these, you'll need to include the necessary code inside your header and footer files.

Inside HTML `<head>` Tag
```html
<!-- bower:css -->
<!-- endbower -->
```

Inside HTML `<head>` Tag or just before the closing `</body>`
```html
<!-- bower:js -->
<!-- endbower -->
```

Any time you add a template, or modify any of your package instructions, you should run `grunt wiredep` inside your VM via SSH to update your dependencies. Before doing so, be sure to add a line for each new file in your `Gruntfile.js` file so bower knows where to find it.

``` javascript
module.exports = function (grunt) {
  grunt.loadNpmTasks('grunt-wiredep');

  grunt.initConfig({
    wiredep: {
      app: {
        src: 'application/views/welcome_message.php',
        src: 'application/views/your_new_file.php',
      }
    }
  });
};
```

	$ vagrant ssh
	$ cd /vagrant/src
	$ grunt wiredep
