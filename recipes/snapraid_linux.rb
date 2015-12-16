include_recipe 'ark::default'
# Download and build the selected version of SnapRaid
ark 'snapraid' do
  url node['snapraid']['version']['url']
  version node['snapraid']['version']['number']
  checksum node['snapraid']['version']['checksum']
  action [:install_with_make]
end
