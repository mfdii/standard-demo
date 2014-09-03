name             'apache'
maintainer       'Chef'
maintainer_email 'michael@getchef.com'
license          'All rights reserved'
description      'Installs/Configures apache'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2.0'

depends 'iptables'