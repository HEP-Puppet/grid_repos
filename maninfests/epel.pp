class grid_repos::epel {
  package { 'epel-release':
    ensure => present,
  }
}
