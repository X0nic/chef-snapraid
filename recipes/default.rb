#
# Cookbook Name:: snapraid
# Recipe:: default
#
# Copyright (C) 2014 Nathan Lee
#
# All rights reserved - Do Not Redistribute
#

#
# Install SnapRaid for Windows
#
include_recipe 'snapraid::snapraid_windows' if platform?('windows')

#
#  Install SnapRAID for Linux
#
include_recipe 'snapraid::snapraid_linux' unless platform?('windows')

#
# Configure SnapRAID
#
template "#{node['snapraid']['config_directory']}/snapraid.conf" do
end
