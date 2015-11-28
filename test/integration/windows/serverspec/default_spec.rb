require 'serverspec'
require 'setup_helper'
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

# Check SnapRAID runs!
describe exec('C:\SnapRaid\snapraid.exe -c C:\ProgramData\SnapRaid\snapraid.conf sync') do
  everything_ok = /Everything OK/
  its(:stdout) { should match everything_ok }
end
