# Vagrant for Phabricator #

[Phabricator](http://phabricator.org) development box using Vagrant


## Quick Start ##

You need install Puppet and [librarian-puppet](http://librarian-puppet.com) first, for example:

```bash
$ gem install puppet librarian-puppet
```

Then follow these steps:

```bash
$ git clone git@github.com:xiaogaozi/vagrant-phabricator.git
$ cd vagrant-phabricator
$ git clone git@github.com:phacility/libphutil.git
$ git clone git@github.com:phacility/arcanist.git
$ git clone git@github.com:phacility/phabricator.git
$ librarian-puppet install
$ vagrant up
```

Phabricator is now running at [http://192.168.33.10](http://192.168.33.10), you could edit `/etc/hosts` file for quick access, for example:

```
192.168.33.10 ph.dev
```
