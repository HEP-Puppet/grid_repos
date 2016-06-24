# == Class: grid_repos::repository::nordugrid
#
# Repository configuration for NorduGrid: http://www.nordugrid.org/
class grid_repos::repository::nordugrid (
  $version  = '13.11', #
  $priority = 25, #
  ) inherits grid_repos::params {
  yumrepo { 'nordugrid':
    descr    => 'NorduGrid - $basearch - base',
    baseurl  => "http://download.nordugrid.org/repos/${version}/centos/\$releasever/\$basearch/base",
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'http://download.nordugrid.org/RPM-GPG-KEY-nordugrid',
    priority => $priority,
  }

  yumrepo { 'nordugrid-updates':
    descr    => 'NorduGrid - $basearch - updates',
    baseurl  => "http://download.nordugrid.org/repos/${version}/centos/\$releasever/\$basearch/updates",
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'http://download.nordugrid.org/RPM-GPG-KEY-nordugrid',
    priority => $priority,
  }

  yumrepo { 'nordugrid-testing':
    descr    => 'NorduGrid - $basearch - testing',
    baseurl  => "http://download.nordugrid.org/repos/${version}/centos/\$releasever/\$basearch/testing",
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => 'http://download.nordugrid.org/RPM-GPG-KEY-nordugrid',
    priority => $priority,
  }
}
