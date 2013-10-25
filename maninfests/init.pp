class grid_repos (
  $repo_name = 'umd',
  $repo_version = '3',
  $repo_priority = 25,
  $do_nuffink = false,
  ) {
  if $do_nuffink == true {
    notify ('OK, you are on your own then, I hope you called grid_repos with a require for the class you set up the repositories in.')
  }
  else {
    # I don't need anything here, someone else should write something
    case $repo_name {
      'umd': {
        class { 'grid_repos::umd':
          version  => $repo_version,
          priority => $repo_priority,
        }
      }
#      'emi': {
#        class { 'grid_repos::emi':
#          version  => $repo_version,
#          priority => $repo_priority,
#        }
#      }
#      'nordugrid': {
#        class { 'grid_repos::nordugrid':
#          version  => $repo_version,
#          priority => $repo_priority,
#        }
#      }
#      'osg': {
#        class { 'grid_repos::osg':
#          version  => $repo_version,
#          priority => $repo_priority,
#        }
      }
      default: {
        fail ( 'Do not know how to configure $repo_name' )
      }
    }
  }
}
