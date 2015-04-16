#
# Cookbook Name:: snapraid
# Recipe:: default
#
# Copyright (C) 2014 Nathan Lee
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'ark::default'

# Download and build the selected version of SnapRaid
ark 'snapraid' do
  url node['snapraid']['version']['url']
  version node['snapraid']['version']['number']
  checksum node['snapraid']['version']['checksum']
  action [:install_with_make]
end

# Ensure the right owner and mode for snapraid install dir
directory '/etc/snapraid' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

directory '/var/snapraid' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

template '/etc/snapraid/snapraid.conf' do
end
