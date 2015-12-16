# Create the directory for snapraid-runner
directory node['snapraid']['scheduler']['script_directory'] do
  action :create
end

# Install the script
remote_file "#{node['snapraid']['scheduler']['script_directory']}/snapraid-runner.py" do
  source node['snapraid']['scheduler']['script_url']
end

# Configure the script's config file
template node['snapraid']['scheduler']['config_file'] do
end

#
# Install Python & configure scheduled task (Windows)
#
if platform?('windows')
  windows_package 'python2.7' do
    source node['snapraid']['scheduler']['python_url']
  end

  # Setup scheduled task
  script_path = "#{node['snapraid']['scheduler']['script_directory']}\\snapraid-runner.py"
  windows_task 'SnapRaid Runner' do
    user node['snapraid']['service_account']
    password node['snapraid']['service_account_password']
    command "C:\\Python27\\python.exe #{script_path} -c #{node['snapraid']['scheduler']['config_file']}"
    frequency node['snapraid']['scheduler']['execution_frequency']
    frequency_modifier node['snapraid']['scheduler']['execution_frequency_modifier']
    start_time node['snapraid']['scheduler']['start_time']
    action :create
  end
end

#
# Install Python & configure cron (Linux)
#
unless platform?('windows')
  package 'python'

  # Setup our cronjob
  cron 'snapraid-runner' do
    hour node['snapraid']['scheduler']['execution_hour']
    minute node['snapraid']['scheduler']['execution_minute']
    command "sudo python #{node['snapraid']['scheduler']['script_directory']}/snapraid-runner.py "\
      "-c #{node['snapraid']['scheduler']['config_file']}"
    user node['snapraid']['service_account']
  end
end
