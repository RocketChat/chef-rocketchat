maintainer        'JJ Asghar'
maintainer_email  'jj@chef.io'
license           'Apache 2'
description       'Installs/Configures Rocket.Chat'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.2.0'
name              'rocketchat'
issues_url        'https://github.com/jjasghar/chef-rocketchat/issues'
source_url        'https://github.com/jjasghar/chef-rocketchat/'

recipe 'rocketchat', 'Installs and configures Rocket.Chat'

%w(mongodb runit).each do |dep|
  depends dep
end

%w(debian ubuntu).each do |os|
  supports os
end
