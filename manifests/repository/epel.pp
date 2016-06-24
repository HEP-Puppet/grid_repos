# == Class: grid_repos::repository::epel
#
# Repository configuration for the Extra Packages for Enterprise Linux (EPEL):
# http://fedoraproject.org/wiki/EPEL
class grid_repos::repository::epel (
  $version  = $grid_repos::params::versions[epel], #
  $priority = $grid_repos::params::priorities[epel], #
  ) inherits grid_repos::params {
  package { 'epel-release':
    ensure => present,
    source => 'http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
  }
}
