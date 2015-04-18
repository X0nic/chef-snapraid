#!/bin/bash

# Unmount all disks in case they're already mounted (surpress exit code as they won't be the first time!)
sudo umount /media/disk1 || true 
sudo umount /media/disk2 || true
sudo umount /media/disk3 || true

# Partition all three new disks
(echo o; echo n; echo p; echo 1; echo ; echo; echo w) | sudo fdisk /dev/sdb
(echo o; echo n; echo p; echo 1; echo ; echo; echo w) | sudo fdisk /dev/sdc
(echo o; echo n; echo p; echo 1; echo ; echo; echo w) | sudo fdisk /dev/sdd

# Format all three new disks
sudo mkfs.ext4 /dev/sdb1  -E lazy_itable_init=1 
sudo mkfs.ext4 /dev/sdc1  -E lazy_itable_init=1 
sudo mkfs.ext4 /dev/sdd1  -E lazy_itable_init=1 

# Create mount points for all three new disks (surpress exit code as they may already exist)
sudo mkdir /media/disk1 || true
sudo mkdir /media/disk2 || true
sudo mkdir /media/disk3 || true

# Mount all three new disks
sudo mount -t ext4 /dev/sdb1 /media/disk1
sudo mount -t ext4 /dev/sdc1 /media/disk2
sudo mount -t ext4 /dev/sdd1 /media/disk3

# Create some files
sudo dd if=/dev/urandom of=/media/disk1/bigfile1.not bs=1M count=2
sudo dd if=/dev/urandom of=/media/disk1/bigfile2.not bs=1M count=2
sudo dd if=/dev/urandom of=/media/disk1/bigfile3.not bs=1M count=2