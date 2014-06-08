# -*- tab-width: 2; indent-tabs-mode: nil -*-
# vim: set tabstop=2 shiftwidth=2 softtabstop=2 expandtab:

class phabricator {
  file { '/vagrant/phabricator/conf/local/ENVIRONMENT':
    ensure  => present,
    content => 'development'
  }

  file { '/vagrant/phabricator/conf/local/local.json':
    ensure => present,
    source => 'puppet:///modules/phabricator/local.json'
  }
}
