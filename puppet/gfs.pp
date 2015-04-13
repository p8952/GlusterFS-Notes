###
# Resource Defaults
###
Package {
  allow_virtual => false
}

###
# IP Address
###
$ip_4th_octet = split($vagrant_hostname, '0')

augeas { 'ifcfg-eth1':
  context => '/files/etc/sysconfig/network-scripts/ifcfg-eth1',
  changes => [
    "set DEVICE eth1",
    "set BOOTPROTO static",
    "set IPADDR 192.168.0.${ip_4th_octet[1]}",
    "set NETMASK 255.255.255.0",
    "set ONBOOT yes",
    "set TYPE Ethernet",
  ],
  notify  => Service['network']
}

service { 'network':
  ensure => 'running',
  enable => true
}

###
# Hostname
###
augeas { 'network':
  context => '/files/etc/sysconfig/network',
  changes => [
    "set HOSTNAME ${vagrant_hostname}"
  ],
  notify  => [
    Service['network'],
    Exec['hostname']
  ]
}

exec { 'hostname':
  command     => "/bin/hostname ${vagrant_hostname}",
  refreshonly => true
}

###
# Hosts File
###
host { 'gfs01':
  name => 'gfs01',
  ip => '192.168.0.1'
}

host { 'gfs02':
  name => 'gfs02',
  ip => '192.168.0.2'
}

host { 'gfs03':
  name => 'gfs03',
  ip => '192.168.0.3'
}

host { 'gfs04':
  name => 'gfs04',
  ip => '192.168.0.4'
}

###
# SSH
###
exec { 'id_rsa':
  command => '/usr/bin/wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant -O /root/.ssh/id_rsa && /bin/chmod 600 /root/.ssh/id_rsa',
  creates => '/root/.ssh/id_rsa'
}

###
# GlusterFS
###
package { 'glusterfs-server':
  ensure  => 'installed',
  name    => 'glusterfs-server',
  require => Exec['glusterfs-repo']
}

package { 'glusterfs-fuse':
  ensure  => 'installed',
  name    => 'glusterfs-fuse',
  require => Exec['glusterfs-repo']
}

exec { 'glusterfs-repo':
  command => '/usr/bin/wget http://download.gluster.org/pub/gluster/glusterfs/LATEST/EPEL.repo/glusterfs-epel.repo -O /etc/yum.repos.d/glusterfs-epel.repo',
  creates => '/etc/yum.repos.d/glusterfs-epel.repo'
}