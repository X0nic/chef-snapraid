default['snapraid']['block_size'] = 256
default['snapraid']['exclude_list'] = ['*.bak', '*.unrecoverable', '/tmp/', '/lost+found/', '.AppleDouble', '._AppleDouble', '.DS_Store', '.Thumbs.db', '.fseventsd', '.Spotlight-V100', '.TemporaryItems', '.Trashes', '.AppleDB']
default['snapraid']['data_disks'] = ['/media/disk1', '/media/disk2', '/media/disk3', '/media/disk4']
default['snapraid']['parity_disks'] = ['/media/p-disk1', '/media/p-disk2']
default['snapraid']['content_files'] = ['/var/snapraid/content', '/var/disk1/content', '/var/disk2/content']
