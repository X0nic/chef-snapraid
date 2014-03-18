#
# Cookbook Name:: snapraid
# Recipe:: default
#
# Copyright (C) 2014 Nathan Lee
#
# All rights reserved - Do Not Redistribute
#

ark 'snapraid' do
  url 'http://downloads.sourceforge.net/project/snapraid/snapraid-5.2.tar.gz'
  version '5.2'
  checksum 'eab07c21201eceb4204f8039f021ff0032515719aa5e640c330da45dd8b8e7a3'
  action [:configure, :install_with_make]
end

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
