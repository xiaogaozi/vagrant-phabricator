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

# Update before install any packages
exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}
Apt::Source <| |> -> Exec['apt-update'] -> Package <| |>

# Install and configure nginx
include nginx
nginx::server { 'ph.dev':
  root => '/vagrant/phabricator/webroot'
}

# And PHP
include php

# And MySQL
class { 'mysql::server':
  root_password => 'root',
}

# And Phabricator
include phabricator
