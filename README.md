# Vagrant for Phabricator #

Phabricator development box using Vagrant

## Bootstrap ##

```bash
$ vagrant box add squeeze64 http://dl.dropbox.com/u/937870/VMs/squeeze64.box
$ ln -s $(pwd)/puppet.conf ~/.puppet/puppet.conf
$ ./bootstrap.sh
$ vagrant up
```
