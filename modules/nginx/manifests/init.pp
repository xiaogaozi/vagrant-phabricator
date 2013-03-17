# -*- tab-width: 2; indent-tabs-mode: nil -*-
# vim: set tabstop=2 shiftwidth=2 softtabstop=2 expandtab:

class nginx {
  package { 'nginx':
    ensure => installed
  }

  service { 'nginx':
    ensure => running,
    enable => true
  }
  service { 'apache2':
    ensure => stopped,
    enable => false
  }

  file { '/etc/nginx/sites-enabled/default':
    ensure => absent
  }

  Package['nginx'] -> Service['apache2'] -> Service['nginx']
}

define nginx::server(
  $root,
  $servername = $title
) {
  file { "/etc/nginx/sites-enabled/${name}.conf":
    ensure  => present,
    content => template('nginx/ph.conf.erb'),
    require => Package['nginx'],
    notify  => Service['nginx']
  }
}
