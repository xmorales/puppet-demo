class apache::params {
  if $::osfamily == 'RedHat' or $::operatingsystem =~ /^[Aa]mazon$/ {
    $user                 = 'apache'
    $group                = 'apache'
    $root_group           = 'root'
    $apache_name          = 'httpd'
    $service_name         = 'httpd'
    $httpd_dir            = '/etc/httpd'
    $doc_root             = '/var/www/html'
    $conf_file            = 'httpd.conf'
    $conf_template        = 'apache/centos/conf.erb'
  } elsif $::osfamily == 'Debian' {
    $user                = 'www-data'
    $group               = 'www-data'
    $root_group          = 'root'
    $apache_name         = 'apache2'
    $service_name        = 'apache2'
    $httpd_dir           = '/etc/apache2'
    $doc_root            = '/var/www/html'
    $conf_file           = 'apache2.conf'
    $conf_template       = 'apache/ubuntu/conf.erb'
  } else {
    fail("Class['apache::params']: Unsupported osfamily: ${::osfamily}")
  }

}
