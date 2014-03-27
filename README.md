# Devbox

## Informations

Vagrant box for developpers based on Ubuntu 14.04 Trusty

## Requirements

* Vagrant
* Virtualbox

## Usage
Create a "workspace" directory on your disk root (/workspace or c:\workspace)

```
vagrant up
```

ssh : Port 2222, User vagrant, Password vagrant

#### Installed software

* MongoDB
* Node.js 0.10.26 with npm
* php5 with fpm
* nginx
* git
* composer
* grunt
* bower
* gulp
* yeoman
* express
* sails

#### Ports

The only configured port is 3000 for your nodejs app.

#### Shared folders

Your projects is shared in:
``/var/workspace/``

# Licences

MIT
devbox