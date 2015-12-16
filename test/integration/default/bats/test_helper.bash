#!/bin/bash

echo "Setting up test disks..."
{
	apt-get install lsscsi  ||	sudo yum install lsscsi -y
	mountpointlist=$(lsscsi | grep -v "ATA" | sed -r 's/.*\///')
	count=0
	for mountpoint in $mountpointlist
	do
		echo "Mounting and formatting disk $count"
		count=$((count+1))
		# Unmount all disks in case they're already mounted (surpress exit code as they won't be the first time!)
		sudo umount /media/disk$count || true 
		
		# Partition all three new disks
		(echo o; echo n; echo p; echo 1; echo ; echo; echo w) | sudo fdisk /dev/$mountpoint

		# Format all three new disks
		sudo mkfs.ext4 /dev/${mountpoint}1  -E lazy_itable_init=1 
		
		# Create mount points for all three new disks (surpress exit code as they may already exist)
		sudo mkdir /media/disk${count} || true
		
		# Mount all three new disks
		sudo mount -t ext4 /dev/${mountpoint}1 /media/disk${count}
		
		# Create some files
		sudo dd if=/dev/urandom of=/media/disk${count}/bigfile1.not bs=1M count=2

	done
} &> /dev/null
echo "Disk setup complete!"