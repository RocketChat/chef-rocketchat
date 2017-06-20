#
# Cookbook Name:: rocketchat
# Recipe:: default
#
# Copyright 2016, Greg Fitzgerald
# Copyright 2017, JJ Asghar
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

tar_name = tar_file(node['rocketchat']['url'])

group node['rocketchat']['group']

user node['rocketchat']['user'] do
  system true
  comment 'rocketchat Server'
  home node['rocketchat']['install_dir']
  gid node['rocketchat']['group']
  shell '/bin/false'
  action :create
end

packages = node['rocketchat']['dependencies']
package packages do
  action :install
end

node.override['mongodb']['config']['smallfiles'] = true
node.override['mongodb']['config']['rest'] = true
node.override['mongodb']['config']['bind_ip'] = 'localhost'

include_recipe 'mongodb::10gen_repo'
include_recipe 'mongodb::default'

bash 'install node' do
  user 'root'
  cwd '/tmp'
  creates 'maybe'
  code <<-EOH
  STATUS=0
    curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -   || STATUS=1
    apt-get install -y nodejs   || STATUS=1
  exit $STATUS
  EOH
end

remote_file "#{Chef::Config['file_cache_path']}/#{tar_name}" do
  source node['rocketchat']['url']
  checksum node['rocketchat']['checksum']
  owner node['rocketchat']['user']
  group node['rocketchat']['group']
  mode '0644'
  action :create_if_missing
end

directory node['rocketchat']['install_dir'] do
  owner node['rocketchat']['user']
  group node['rocketchat']['group']
  mode '0755'
  action :create
end

directory "#{Chef::Config['file_cache_path']}/rocketchat" do
  owner node['rocketchat']['user']
  group node['rocketchat']['group']
  mode '0755'
  action :create
end

execute 'Extract Rocket.Chat' do
  cwd Chef::Config['file_cache_path']
  command "tar xf #{Chef::Config['file_cache_path']}/#{tar_name} -C rocketchat"
  user node['rocketchat']['user']
  group node['rocketchat']['group']
end

directory node['rocketchat']['install_dir'] do
  recursive true
  owner node['rocketchat']['user']
  group node['rocketchat']['group']
  mode '0755'
  action :create
end

package ['build-essential', 'g++'] do
  action :install
end

execute 'mv bundle dir' do
  command "cp -a #{Chef::Config['file_cache_path']}/rocketchat/bundle/* #{node['rocketchat']['install_dir']}"
end

execute 'npm install' do
  command 'npm install'
  cwd "#{node['rocketchat']['install_dir']}/programs/server"
end

template '/srv/rocketchat/.node_version.txt' do
  source 'node_version.erb'
  owner 'rocketchat'
  group 'rocketchat'
  mode '0644'
end

include_recipe 'runit'
runit_service 'rocketchat' do
  options({
    install_dir: node['rocketchat']['install_dir'],
    user: node['rocketchat']['user'],
    group: node['rocketchat']['group'],
    root_url: node['rocketchat']['root_url'],
    mongo_url: node['rocketchat']['mongo_url'],
    port: node['rocketchat']['port']
  }.merge(params))
  action [:enable, :start]
end
