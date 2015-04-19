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
default['snapraid']['version']['number'] = '7.1'
default['snapraid']['version']['url'] = 'http://downloads.sourceforge.net/project/snapraid/snapraid-7.1.tar.gz'
# You will need to calculate the SHA-256 checksum yourself as SourceForge does not provide it
default['snapraid']['version']['checksum'] = 'dd9005b6d7ea701e4aa0f854a0e34dabe68d7765b75f12fc6b3e1fda4d5c2cef'

# Scheduled Job Options
default['snapraid']['scheduler']['script_url'] = 'https://raw.githubusercontent.com/Chronial/snapraid-runner/716d30bc5214baf3b6c6e90891298df375fb6047/snapraid-runner.py'
default['snapraid']['scheduler']['script_directory'] = '/opt/snapraid-runner'
default['snapraid']['scheduler']['config_file'] = '/etc/snapraid_runner.conf'
default['snapraid']['scheduler']['execution_hour'] = 23
default['snapraid']['scheduler']['execution_minute'] = 59
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
