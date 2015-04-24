require 'serverspec'

# Required by serverspec
set :backend, :exec

# Check our cron job has been created
crontask = '59 23 * * * sudo python /opt/snapraid-runner/snapraid-runner.py -c /etc/snapraid_runner.conf'
describe cron do
  it { should have_entry(crontask).with_user('root') }
end

# Check files exist
files = [
  '/opt/snapraid-runner/snapraid-runner.py',
  '/etc/snapraid_runner.conf',
  '/etc/snapraid.conf'
]
files.each do |file|
  describe file(file) do
    it { should be_file }
  end
end

# Check packages installed
['python'].each do |package|
  describe package(package) do
    it { should be_installed }
  end
end
