# Get tomcat
package{ ['wget','tar','java-1.8.0-openjdk']:
  ensure => installed,
}
user { 'tomcat':
  ensure => present,
  gid  => 'tomcat',
}
group { 'tomcat':
  ensure => present,
}

# Untar
#
Exec {
  path => ["/usr/bin", "/bin"],
}
exec { 'get_tomcat':
  command => 'wget http://apache.uvigo.es/tomcat/tomcat-7/v7.0.77/bin/apache-tomcat-7.0.77.tar.gz',
  cwd => "/tmp",
  require => Package['wget'],
  creates => "/opt/apache-tomcat-7.0.77"
} ->
exec { 'untar_tomcat':
  command => "tar xzf /tmp/apache-tomcat-7.0.77.tar.gz",
  cwd => "/opt",
  require => Package['tar'],
  creates => "/opt/apache-tomcat-7.0.77"
} ->
file { "/opt/apache-tomcat-7.0.77":
  ensure => directory,
  owner  => 'tomcat',
  group => 'tomcat',
  require => User['tomcat'],
  recurse => true,
} ->
file { '/opt/tomcat':
  ensure => link,
  target => "/opt/apache-tomcat-7.0.77",
} ->
file { "/tmp/apache-tomcat-7.0.77.tar.gz": ensure => absent }
file { "/etc/init.d/tomcat":
  source => "/root/puppet-demo/session1/tomcat.initd",
  mode   => 0755,
 }
service {'tomcat':
  hasstatus => false,
  hasrestart => false,
  ensure => running,
  start => "/opt/tomcat/bin/startup.sh",
  stop => "/opt/tomcat/bin/shutdown.sh",
  #TODO
  #enable => true,
  require => [ File["/etc/init.d/tomcat"], File["/opt/tomcat"] ]
}
package { 'httpd': ensure => installed }
service { 'httpd': ensure => running }
file { '/etc/httpd/conf.d/tomcat.conf':
  ensure => present,
  source => "/root/puppet-demo/session1/httpd_tomcat.conf"
  notify => Service['httpd'],
}







