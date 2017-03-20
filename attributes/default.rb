#
# Cookbook Name:: rocketchat
# Attributes:: default
#
# Copyright 2016, Greg Fitzgerald.
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['rocketchat']['user'] = 'rocketchat'
default['rocketchat']['group'] = 'rocketchat'
default['rocketchat']['install_dir'] = '/srv/rocketchat'

default['rocketchat']['url'] = 'https://rocket.chat/releases/latest/download'
default['rocketchat']['checksum'] = '095c9476806186cb7ecd94490f43fe1496806b14edc8f4a3739840a895ee18a1'

default['rocketchat']['dependencies'] = %w(graphicsmagick curl)

# runit service settings
default['rocketchat']['root_url'] = "http://#{node['fqdn']}:3000"
default['rocketchat']['mongo_url'] = 'mongodb://localhost:27017/rocketchat'
default['rocketchat']['port'] = 3000
