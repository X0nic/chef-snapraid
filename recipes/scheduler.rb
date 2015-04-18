# Install Python
package 'python'

directory node['snapraid']['scheduler']['script_directory'] do
  action :create
end

# Install the script
remote_file "#{node['snapraid']['scheduler']['script_directory']}/snapraid-runner.py" do
  source node['snapraid']['scheduler']['script_url']
end

template node['snapraid']['scheduler']['config_file'] do
end

cron 'snapraid-runner' do
  hour node['snapraid']['scheduler']['execution_hour']
  minute node['snapraid']['scheduler']['execution_minute']
  command "sudo python #{node['snapraid']['scheduler']['script_directory']}/snapraid-runner.py "\
    "-c #{node['snapraid']['scheduler']['config_file']}"
  user 'root'
end
