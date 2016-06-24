# == Class: grid_repos::repository::umd
#
# Repository configuration for the Unified Middleware Distribution (UMD):
# http://repository.egi.eu/
class grid_repos::repository::umd (
  $version  = 3, #
  $priority = 25, #
  ) {
  package { 'umd-release':
    ensure   => present,
    provider => rpm,
    #this needs changing!
    source   => 'http://repository.egi.eu/sw/production/umd/3/sl6/x86_64/base/umd-release-3.0.0-1.el6.noarch.rpm'
    #source  => 'http://install.pp.rl.ac.uk/yum/umd/production/umd/3/sl6/x86_64/base/umd-release-3.0.0-1.el6.noarch.rpm',
    #require => Class['grid_repos::epel']
  }
}
