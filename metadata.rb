maintainer        'rocketchat'
maintainer_email  'cookbook@rocket.chat'
license           'Apache 2.0'
description       'Installs/Configures Rocket.Chat'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.3.1'
name              'rocketchat'
issues_url        'https://github.com/RocketChat/chef-rocketchat/issues'
source_url        'https://github.com/RocketChat/chef-rocketchat/'

recipe 'rocketchat', 'Installs and configures Rocket.Chat'

chef_version      '>= 12.19' if respond_to?(:chef_version)

%w(mongodb runit).each do |dep|
  depends dep
end

%w(debian ubuntu).each do |os|
  supports os
end
