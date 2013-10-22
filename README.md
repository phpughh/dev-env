dev-env (virtual box + vagrant)
==================================================================

Software to download:
------------------------------------------------------------------
**Windows:**
* VirtualBox - https://www.virtualbox.org/wiki/Downloads
* Vagrant - http://downloads.vagrantup.com/ (Vagrantfile is modified for 1.3.x)
* Putty - http://www.putty.org

**Linux:**<br>
Read the installation guide http://docs.vagrantup.com/v2/installation/ or
search via Google how to install vagrant on your distribution.

Workspace & Repositories
------------------------------------------------------------------
* create a workspace directory like "phpughh" on you local machine
* checkout "dev-env" repository into the created workspace directory
* checkout "phpughh.github.com" repository into the created workspace directory

Start the VM:
------------------------------------------------------------------
In general we assume that every developer has an 64Bit system. If you
don't just change the configuration values of the following parameters:
```
config.vm.box = "" // precise64 or precise32
```
```
config.vm.box_url = "" // http://files.vagrantup.com/precise64.box or http://files.vagrantup.com/precise32.box
```
Open a console and change over to the checkout "dev-env".
Start the VM by running the command:
```
vagrant up
```
**Long story short or what happens after executing "vagrant up".**

The first time you start building the machine vagrant will start downloading
the vagrant box (precise64) which is ~330MB. So please make sure you have a
well internet connection. Afterward ruby (v1.9.1) and it dependencies will be
installed, followed by Jekyll.

Connect the VM:
------------------------------------------------------------------
**Windows:**<br/>
Configure a SSH connection in Putty:
* host: localhost
* port: 2222
After the connect is established you need to enter user name and password:
* user: vagrant
* pass: vagrant

**Linux:**<br/>
Open a console and execute
```
vagrant ssh
```
Your are now connect to the VM (cross fingers).

Start the Jekyll:
------------------------------------------------------------------
Execute the following command:
```
sudo LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 jekyll serve --port 80 --watch --detach --source /var/www/phpughh.github.com
```
The page is now be available in your browser under "127.0.0.1:8080".

Useful Commands
------------------------------------------------------------------
```
vagrant destroy // destroy the vm
vagrant reload  // restart the vm
```
```
jekyll --help
```

Notice
------------------------------------------------------------------
* VirtualBox 4.1.8
* Vagrant 1.0.3

There should be no problems with the current version of VirtualBox
and Vagrant, in case of use this versions instead.

**Status:** not well tested

Cookbooks
------------------------------------------------------------------
* apt
* phpughh

Links
------------------------------------------------------------------
* https://www.virtualbox.org/
* http://www.vagrantbox.es/
* http://jekyllrb.com/
