class grid_repos::umd (
  $version  = 3,
  $priority = 25,
  ) {
  package { 'umd-release':
    ensure   => present,
    provider => rpm,
    source   => 'http://install.pp.rl.ac.uk/yum/umd/production/umd/3/sl6/x86_64/base/umd-release-3.0.0-1.el6.noarch.rpm',
    require  => Class['grid_repos::epel']
  }
}
