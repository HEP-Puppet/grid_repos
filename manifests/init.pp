# == Class: grid_repos
#
# Configuration for repositories used for the grid middle ware packages
# Required packages are
# - Extra Packages for Enterprise Linux (EPEL):
# http://fedoraproject.org/wiki/EPEL
# - European Grid Ingrastructure (EGI) IGTF:
# https://wiki.egi.eu/wiki/EGI_IGTF_Release
# - one of the four:
#   - Unified Middleware Distribution (UMD): http://repository.egi.eu/
#   - European Middleware Initiative (EMI): http://www.eu-emi.eu/home
#   - NorduGrid: http://www.nordugrid.org/
#   - Open Science Grid (OSG):
#   https://twiki.grid.iu.edu/bin/view/Documentation/Release3/YumRepositories
#
# It is also optional for real experts to set-up all repositories on their own.
# In that case you still need to include the grid_repos class as all puppet
# packages depend on it:
# class {'grid_repos': do_nuffink => true}
#
class grid_repos (
  $middle_ware_repos = ['umd', 'epel', 'egi'],
  $do_nuffink        = false,) {
  if $do_nuffink == true {
    notify { 'grid_repos::nuffink': message => 'OK, you are on your own then,\
       I hope you called grid_repos with a require\
        for the class you set up the repositories in.' }
  } else {
    if $::osfamily == 'Redhat' {
      create_resources('grid_repos::repository', $middle_ware_repos)
    } else {
      $apology = 'Sorry, but only the Redhat OS family is supported at the moment.'
      $encouragement = 'If you would like to see this feature, please make a request and/or constribute!'

      notify { "${apology}\n ${encouragement}": }
    }

  }
}
