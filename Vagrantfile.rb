
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

    # Create andttach disks to SATA controller
    file_to_disk = [
      'tmp/disk1.vdi',
      'tmp/disk2.vdi',
      'tmp/disk3.vdi'
    ]

    file_to_disk.each_with_index do |disk_file, i|
      v.customize ['createhd', '--filename', disk_file, '--size', 500 * 1024]
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
