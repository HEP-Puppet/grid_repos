###
# Creates a repository either based on the passed parameters
# or on the defaults from grid_repos::params
define grid_repos::repository (
  $name          = $title,
  $load_defaults = true,
  # if load_defaults == false, fill these out
  $baseurl       = undef,
  $enabled       = true,
  $gpgkey        = undef,
  $gpgcheck      = true,
  $mirrorlist    = undef,
  $priority      = undef,
  $proxy         = undef,) {
  # test if repo name is in the list of keys of
  # grid_repos::params::default_versions

  if $load_defaults == true {
    $has_default = member($grid_repos::params::versions, $name)

    if $has_default {
      yumrepo { $name:
        baseurl    => $grid_repos::params::base_urls[$name],
        enabled    => $grid_repos::params::enabled[$name],
        gpgcheck   => $grid_repos::params::gpgchecks[$name],
        gpgkey     => $grid_repos::params::gpgkeys[$name],
        mirrorlist => $grid_repos::params::mirror_lists[$name],
        priority   => $grid_repos::params::priorities[$name],
        proxy      => $grid_repos::params::proxy,
      }
    } else {
      $default_class_msg = 'Defaults are not defined in grid_repos::params'
      $error_msg = "Trying to load defaults for ${name} failed."

      notify { "grid_repos::ERROR = ${error_msg} ${default_class_msg}": }
    }

  } else {
    yumrepo { $name:
      baseurl    => $baseurl,
      enabled    => $enabled,
      gpgcheck   => $gpgcheck,
      gpgkey     => $gpgkey,
      mirrorlist => $mirrorlist,
      priority   => $priority,
      proxy      => $proxy,
    }
  }
}
