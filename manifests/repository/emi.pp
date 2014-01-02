# == Class: grid_repos::repository::emi
#
# Class for the EMI repositories
# http://emisoft.web.cern.ch/emisoft/
class grid_repos::repository::emi (
  $priority = 40, #
  $version  = 3, #
  $proxy    = undef, #
  ) {
    
    repository{'emi-base':}
  repository{'emi-base':}
  yumrepo { "emi${version}-base":
    descr    => "EMI ${version} - base",
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${version}/sl6/\$basearch/base",
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${version}/RPM-GPG-KEY-emi",
    priority => $priority,
  }

  yumrepo { "emi${version}-updates":
    descr    => "EMI ${version} updates",
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${version}/sl6/\$basearch/updates",
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${version}/RPM-GPG-KEY-emi",
    priority => $priority,
  }

  yumrepo { "emi${version}-contribs":
    descr    => "EMI ${version} contribs",
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${version}/sl6/\$basearch/contribs",
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${version}/RPM-GPG-KEY-emi",
    priority => $priority,
  }

  yumrepo { "emi${version}-third-party":
    descr    => "EMI ${version} third-party",
    baseurl  => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${version}/sl6/\$basearch/third-party",
    enabled  => 1,
    gpgcheck => 1,
    gpgkey   => "http://emisoft.web.cern.ch/emisoft/dist/EMI/${version}/RPM-GPG-KEY-emi",
    priority => $priority,
  }
}
