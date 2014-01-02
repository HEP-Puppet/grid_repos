class grid_repos::params {
  $proxy = undef

  $emi_version = 3
  $nordugrid_version = '13.11'
  $versions = {
    egi                 => 1,
    emi                 => $emi_version,
    'emi-updates'       => $emi_version,
    'emi-constribs'     => $emi_version,
    'emi-third-party'   => $emi_version,
    epel                => '6',
    nordugrid           => $nordugrid_version,
    'nordugrid-updates' => $nordugrid_version,
    osg                 => 0,
    umd                 => 3,
  }

  # Some middleware is available in both EPEL and the middleware repositories.
  # The latter should be preferred, hence have a higher priority
  # Feel free to customise this part for your site.
  $priorities = {
    egi                 => 90,
    emi                 => 80,
    'emi-updates'       => 80,
    'emi-constribs'     => 80,
    'emi-third-party'   => 80,
    epel                => 60,
    nordugrid           => 80,
    'nordugrid-updates' => 80,
    osg                 => 80,
    umd                 => 80,
  }
  
  $gpgchecks = {
    egi                 => true,
    emi                 => true,
    'emi-updates'       => true,
    'emi-constribs'     => true,
    'emi-third-party'   => true,
    epel                => true,
    nordugrid           => true,
    'nordugrid-updates' => true,
    osg                 => true,
    umd                 => true,
  }
  
  # the epel entry needs to be tied into the epel version
  $emi_key = "http://emisoft.web.cern.ch/emisoft/dist/EMI/${versions[emi]}/RPM-GPG-KEY-emi"
  $nordugrid_key = 'http://download.nordugrid.org/RPM-GPG-KEY-nordugrid'

  $gpgkeys = {
    egi                 => 'http://repository.egi.eu/sw/production/cas/1/GPG-KEY-EUGridPMA-RPM-3',
    emi                 => $emi_key,
    'emi-updates'       => $emi_key,
    'emi-constribs'     => $emi_key,
    'emi-third-party'   => $emi_key,
    epel                => "http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-${versions
      [epel]}",
    nordugrid           => $nordugrid_key,
    'nordugrid-updates' => $nordugrid_key,
    osg => undef,
    
  }

  $emi_url = "http://emisoft.web.cern.ch/emisoft/dist/EMI/${versions[emi]}/sl6/\$basearch"
  $nordugrid_url = "http://download.nordugrid.org/repos/${versions[nordugrid]}/centos/\$releasever/\$basearch"
  $base_urls = {
    egi                 => "http://repository.egi.eu/sw/production/cas/${versions
      [egi]}/current/",
    emi                 => "${emi_url}/base",
    'emi-updates'       => "${emi_url}/updates",
    'emi-constribs'     => "${emi_url}/constribs",
    'emi-third-party'   => "${emi_url}/third-party",
    epel                => "http://download.fedoraproject.org/pub/epel/${versions
      [epel]}/\$basearch",
    nordugrid           => "${nordugrid_url}/base",
    'nordugrid-updates' => "${nordugrid_url}/updates",
  }

  $mirror_lists = {
    egi                 => undef,
    emi                 => undef,
    'emi-updates'       => undef,
    'emi-constribs'     => undef,
    'emi-third-party'   => undef,
    epel                => "https://mirrors.fedoraproject.org/metalink?repo=epel-${versions
      [epel]}&arch=\$basearch",
    nordugrid           => undef,
    'nordugrid-updates' => undef,
    osg                 => undef,
    umd                 => undef,

  }

  $enabled = {
    egi                 => true,
    emi                 => true,
    'emi-updates'       => true,
    'emi-constribs'     => true,
    'emi-third-party'   => true,
    epel                => true,
    nordugrid           => true,
    'nordugrid-updates' => true,
    osg                 => true,
    umd                 => true,
  }

  $descriptions = {
    egi                 => 'IGTF CA Repository',
    emi                 => "EMI - ${versions[emi]}",
    'emi-updates'       => "EMI - ${versions[emi]} - updates",
    'emi-constribs'     => "EMI - ${versions[emi]} - contribs",
    'emi-third-party'   => "EMI - ${versions[emi]} - third-party",
    epel                => 'Extra Packages for Enterprise Linux 6 - $basearch',
    nordugrid           => 'NorduGrid - $basearch - Base',
    'nordugrid-updates' => 'NorduGrid - $basearch - Updates',
    osg                 => 'Open Science Grid repository',
    umd                 => 'UMD',
  }
}
