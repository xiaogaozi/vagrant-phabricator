# Vagrant for Phabricator #

Phabricator development box using Vagrant

## Quick Start ##

```bash
$ git clone git@github.com:xiaogaozi/vagrant-phabricator.git
$ cd vagrant-phabricator
$ git clone git@github.com:phacility/libphutil.git
$ git clone git@github.com:phacility/arcanist.git
$ git clone git@github.com:phacility/phabricator.git
$ librarian-puppet install
$ vagrant up
```

Phabricator is now running at [http://192.168.33.10](http://192.168.33.10), you could also access through [http://ph.dev](http://ph.dev) if you edit your `/etc/hosts` file.
