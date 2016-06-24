class grid_repos::repository::egi (
  $baseurl    = undef,
  $enabled    = true,
  $gpgkey     = undef,
  $gpgcheck   = true,
  $mirrorlist = undef,
  $priority   = undef,
  $proxy      = undef,) inherits grid_repos::params {
  if $baseurl == undef {
    repository { 'egi': }
  } else {
    repository { 'egi':
      load_defaults => false,
      baseurl       => $baseurl,
      enabled       => $enabled,
      gpgcheck      => $gpgcheck,
      gpgkey        => $gpgkey,
      mirrorlist    => $mirrorlist,
      priority      => $priority,
      proxy         => $proxy,
    }
  }
}
