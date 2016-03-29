class nginx {
      package {'nginx':
              ensure => present,
              }
      file { '/var/www':
              ensure => directory,
              require => Package['nginx'],
            }
      file { '/etc/nginx/nginx.conf':
              ensure => file,
              source => 'puppet:///modules/ngnix/nginx.conf',
              require => Package['nginx'],
            }
      file { '/etc/nginx/conf.d/default.conf':
              ensure => file,
              source => 'puppet:///modules/ngnix/default.conf',
              require => Package['nginx'],
            }
      service { 'nginx':
                ensure => running,
                enable => true,
              }
}
