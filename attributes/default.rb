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
  '.AppleDB'
]
default['snapraid']['data_disks'] = []
default['snapraid']['parity_disks'] = []
default['snapraid']['content_files'] = []

# Version options
default['snapraid']['version']['number'] = '7.1'
default['snapraid']['version']['url'] = 'http://downloads.sourceforge.net/project/snapraid/snapraid-7.1.tar.gz'
# You will need to calculate the SHA-256 checksum yourself as SourceForge does not provide it
default['snapraid']['version']['checksum'] = 'dd9005b6d7ea701e4aa0f854a0e34dabe68d7765b75f12fc6b3e1fda4d5c2cef'
