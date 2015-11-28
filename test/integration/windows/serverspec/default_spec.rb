require 'serverspec'

# Required by serverspec
set :backend, :cmd
set :os, family: 'windows'

# Check files exist
files = [
  'C:\SnapRaid\snapraid-runner.py',
  'C:\SnapRaid\snapraid.exe',
  'C:\programdata\SnapRaid\snapraid_runner.conf',
  'C:\programdata\SnapRaid\snapraid.conf'
]
files.each do |file|
  describe file(file) do
    it { should be_file }
  end
end
