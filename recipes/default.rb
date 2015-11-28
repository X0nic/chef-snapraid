#
# Cookbook Name:: snapraid
# Recipe:: default
#
# Copyright (C) 2014 Nathan Lee
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'ark::default'

if node['platform_family'] == 'windows'

  # Ensure the right owner and mode for snapraid install dir
  directory node['snapraid']['config_directory'] do
    rights :full_control, node['snapraid']['service_account']
    recursive true
  end

  directory node['snapraid']['install_directory'] do
    rights :full_control, node['snapraid']['service_account']
    recursive true
  end

  # Download snapraid
  snapraid_zip_file = File.basename(node['snapraid']['version']['url'])
  snapraid_zip_file_location = "#{Chef::Config[:file_cache_path]}\\#{snapraid_zip_file}"
  Chef::Log.info("Downloading snapraid to #{snapraid_zip_file_location}")
  remote_file snapraid_zip_file_location do
    source node['snapraid']['version']['url']
    notifies :unzip, "windows_zipfile[#{node['snapraid']['install_directory']}]", :immediately
    checksum node['snapraid']['version']['checksum']
    action :create
  end

  # Unzip snapraid
  Chef::Log.info("Extracting snapraid to #{node['snapraid']['install_directory']}")
  windows_zipfile node['snapraid']['install_directory'] do
    source snapraid_zip_file_location
    action :nothing
  end
else

  # Download and build the selected version of SnapRaid
  ark 'snapraid' do
    url node['snapraid']['version']['url']
    version node['snapraid']['version']['number']
    checksum node['snapraid']['version']['checksum']
    action [:install_with_make]
  end
end

template "#{node['snapraid']['config_directory']}/snapraid.conf" do
end
