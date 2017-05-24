class apache inherits apache::params {
  package { 'httpd':
    ensure => present,
    name   => $::apache::params::apache_name,
    notify => Service['httpd'],
  }
  file {"${::apache::params::httpd_dir}":
    ensure  => directory,
    owner   => ${::apache::params::user},
    group   => ${::apache::params::group},
    mode    => '0644',
    require => Package['httpd'],
    notify  => Service['httpd'],
  }
  file {"${::apache::params::httpd_dir}/${::apache::params::conf_file}":
    ensure  => file,
    content => template("${::apache::params::conf_template}",
    owner   => ${::apache::params::user},
    group   => ${::apache::params::group},
    mode    => '0644',
    require => Package['httpd'],
    notify  => Service['httpd'],
  }
  file {"${::apache::params::doc_root}":
    ensure  => directory,
    owner   => ${::apache::params::user},
    group   => ${::apache::params::group},
    mode    => '0644',
    require => Package['httpd'],
    notify  => Service['httpd'],
  }
  file {"${::apache::params::doc_root}/index.html":
    ensure  => file,
    source  => "puppet:///modules/apache/index.html"
    owner   => ${::apache::params::user},
    group   => ${::apache::params::group},
    mode    => '0644',
    require => Package['httpd'],
    notify  => Service['httpd'],
  }
  file {"${::apache::params::doc_root}/404.html":
    ensure  => file,
    source  => "puppet:///modules/apache/404.html"
    owner   => ${::apache::params::user},
    group   => ${::apache::params::group},
    mode    => '0644',
    require => Package['httpd'],
    notify  => Service['httpd'],
  }
  service { 'httpd':
    ensure     => started,
    name       => $service_name,
    enable     => true,
    hasrestart => true,
  }
}
