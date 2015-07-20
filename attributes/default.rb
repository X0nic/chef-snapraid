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
default['snapraid']['version']['url'] = 'http://downloads.sourceforge.net/project/snapraid/snapraid-8.1.tar.gz'
# You will need to calculate the SHA-256 checksum yourself as SourceForge does not provide it
default['snapraid']['version']['checksum'] = '6bf89a1319ac3403958cd2c98a9c6102728c0070cfa1aedd90c4561d93c54e5d'

# Scheduled Job Options
default['snapraid']['scheduler']['script_url'] = 'https://raw.githubusercontent.com/Chronial/snapraid-runner/f6a25897412cd9849aee037891d60250d2212beb/snapraid-runner.py'
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
