default['snapraid']['block_size'] = 256
default['snapraid']['exclude_list'] = [
  '*.bak',
  '*.unrecoverable',
  '/tmp/',
  '/lost+found/',
  '.AppleDouble',
  '._AppleDouble',
  '.DS_Store',
  '.Thumbs.db',
  '.fseventsd',
  '.Spotlight-V100',
  '.TemporaryItems',
  '.Trashes',
  '.AppleDB',
  'snapraid.content'
]
default['snapraid']['data_disks'] = []
default['snapraid']['parity_disks'] = []
default['snapraid']['content_files'] = []

# Version options
default['snapraid']['version']['number'] = '8.1'
if node['platform'] == 'windows'
  default['snapraid']['version']['url'] = 'https://github.com/amadvance/snapraid/releases/download/v9.1/snapraid-9.1-windows-x64.zip'
  # You will need to calculate the SHA-256 checksum yourself as GitHub does not provide it
  default['snapraid']['version']['checksum'] = '4c56b2c5d556a3685239e444cb58ce84c398e86a173be34ff7cfa3a2b31a5b34'
  default['snapraid']['install_directory'] = "#{ENV['SystemDrive']}\\SnapRaid"
  default['snapraid']['config_directory'] = "#{ENV['PROGRAMDATA']}\\SnapRaid"
  default['snapraid']['service_account'] = 'SYSTEM'
else
  default['snapraid']['version']['url'] = 'https://github.com/amadvance/snapraid/releases/download/v9.1/snapraid-9.1.tar.gz'
  # You will need to calculate the SHA-256 checksum yourself as GitHub does not provide it
  default['snapraid']['version']['checksum'] = '397fdd7709e941e372b37025457794f8b0ce63a5a8455703ad17770cbccd3823'
  default['snapraid']['install_directory'] = '/etc/snapraid'
  default['snapraid']['config_directory'] = '/etc'
  default['snapraid']['service_account'] = 'root'
end

# Scheduled Job Options
if node['platform'] == 'windows'
  default['snapraid']['scheduler']['python_url'] = 'https://www.python.org/ftp/python/2.7.10/python-2.7.10.amd64.msi'
  default['snapraid']['scheduler']['script_directory'] = "#{ENV['SystemDrive']}\\SnapRaid"
  default['snapraid']['scheduler']['config_file'] = "#{ENV['PROGRAMDATA']}\\SnapRaid\\snapraid_runner.conf"
  default['snapraid']['scheduler']['execution_frequency'] = :daily
  default['snapraid']['scheduler']['execution_frequency_modifier '] = 1
  default['snapraid']['scheduler']['start_time'] = '23:59'
  default['snapraid']['scheduler']['log_directory'] = "#{ENV['TEMP']}\\"
else
  default['snapraid']['scheduler']['script_directory'] = '/opt/snapraid-runner'
  default['snapraid']['scheduler']['config_file'] = '/etc/snapraid_runner.conf'
  default['snapraid']['scheduler']['execution_hour'] = 23
  default['snapraid']['scheduler']['execution_minute'] = 59
  default['snapraid']['scheduler']['log_directory'] = '/var/log'
end

default['snapraid']['scheduler']['script_url'] = 'https://raw.githubusercontent.com/Chronial/snapraid-runner/f6a25897412cd9849aee037891d60250d2212beb/snapraid-runner.py'
default['snapraid']['scheduler']['email_from'] = ''
default['snapraid']['scheduler']['email_to'] = ''
default['snapraid']['scheduler']['smtp_host'] = ''
default['snapraid']['scheduler']['smtp_port'] = ''
default['snapraid']['scheduler']['smtp_ssl'] = 'false'
default['snapraid']['scheduler']['smtp_user'] = ''
default['snapraid']['scheduler']['smtp_password'] = ''
default['snapraid']['scheduler']['scrub_after_sync'] = 'true'
default['snapraid']['scheduler']['scrub_percentage'] = 12
default['snapraid']['scheduler']['scrub_older_than'] = 10
default['snapraid']['scheduler']['deletion_abort_threshold'] = 40
