
Vagrant.configure('2')  do |config|
  # Add additional hard disks for functional testing
  config.vm.provider 'virtualbox' do |v|
    # Attach SATA controller for ease of setup
    v.customize ['storagectl', :id,
                 '--name', 'SATAController',
                 '--add', 'sata',
                 '--controller', 'IntelAhci',
                 '--portcount', 4
                ]

    # Create and attach disks to SATA controller
    file_to_disk = [
      'tmp/disk1.vdi',
      'tmp/disk2.vdi',
      'tmp/disk3.vdi'
    ]

    file_to_disk.each_with_index do |disk_file, i|
      # Delete the disk if it already exists
      if  File.exist?(disk_file)
        v.customize ['closemedium', 'disk', disk_file, '--delete']
      end

      # Create a fresh disk
      v.customize ['createhd', '--filename', disk_file, '--size', 500 * 1024]

      # Attach the disk
      v.customize ['storageattach', :id,
                   '--storagectl', 'SATAController',
                   '--port', i,
                   '--device', 0,
                   '--type', 'hdd',
                   '--medium', disk_file
                  ]
    end
  end
end
