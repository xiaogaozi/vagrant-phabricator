# -*- tab-width: 2; indent-tabs-mode: nil -*-
# vim: set tabstop=2 shiftwidth=2 softtabstop=2 expandtab:

class { 'apt':
  purge_sources_list => true
}

apt::source { 'debian':
  location    => 'http://http.debian.net/debian/',
  repos       => 'main contrib non-free',
  include_src => false
}

apt::source { 'debian_updates':
  location    => 'http://http.debian.net/debian/',
  release     => "${::lsbdistcodename}-proposed-updates",
  repos       => 'main contrib non-free',
  include_src => false
}

apt::source { 'debian_security':
  location    => 'http://security.debian.org/',
  release     => "${::lsbdistcodename}/updates",
  repos       => 'main contrib non-free',
  include_src => false
}

apt::source { 'puppetlabs':
  location   => 'http://apt.puppetlabs.com',
  repos      => 'main',
  key        => '4BD6EC30',
  key_server => 'pgp.mit.edu',
}

apt::source { 'dotdeb':
  location   => 'http://packages.dotdeb.org',
  repos      => 'all',
  key        => '89DF5277',
  key_source => 'http://www.dotdeb.org/dotdeb.gpg'
}

Apt::Source['dotdeb'] -> Class['nginx']
Apt::Source['dotdeb'] -> Class['php']

include nginx
nginx::server { 'ph.dev':
  root => '/vagrant/phabricator/webroot'
}

include php

class { 'mysql::server':
  root_password => 'root',
}

file { '/etc/profile.d/ph.sh':
  ensure  => present,
  content => 'export PHABRICATOR_ENV=custom/myconfig'
}
