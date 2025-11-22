#!/bin/bash
echo 'start of baseinstall.sh'

dmesg | grep -i efivars

source /etc/os-release

export ID
echo $ID

zgenhostid -f 0x00bab10c

### BOOT partition ####
export BOOT_DISK="/dev/sda"
export BOOT_PART="1"
export BOOT_DEVICE="${BOOT_DISK}${BOOT_PART}"

echo $BOOT_DISK
echo $BOOT_PART
echo $BOOT_DEVICE 


### ZFS pool ###
export POOL_DISK="/dev/sda"
export POOL_PART="2"
export POOL_DEVICE="${POOL_DISK}${POOL_PART}"

echo $POOL_DISK
echo $POOL_PART
echo $POOL_DEVICE

zpool labelclear -f "$POOL_DISK"

wipefs -a "$POOL_DISK"
wipefs -a "$BOOT_DISK"

sgdisk --zap-all "$POOL_DISK"
sgdisk --zap-all "$BOOT_DISK"

#### Create EFI Boot partition ####
sgdisk -n "${BOOT_PART}:1m:+512m" -t "${BOOT_PART}:ef00" "$BOOT_DISK"

#### Create zpool partition ####
sgdisk -n "${POOL_PART}:0:-10m" -t "${POOL_PART}:bf00" "$POOL_DISK"


#### ZFS pool creation ####
zpool create -f -o ashift=12 \
 -O compression=lz4 \
 -O acltype=posixacl \
 -O xattr=sa \
 -O relatime=on \
 -o autotrim=on \
 -o compatibility=openzfs-2.2-linux \
 -m none zroot "$POOL_DEVICE"
 
 
 #### Create initial file systems ####
zfs create -o mountpoint=none zroot/ROOT
zfs create -o mountpoint=/ -o canmount=noauto zroot/ROOT/${ID}
zfs create -o mountpoint=/home zroot/home

zpool set bootfs=zroot/ROOT/${ID} zroot

zpool export zroot
zpool import -N -R /mnt zroot
zfs mount zroot/ROOT/${ID}
zfs mount zroot/home

mount | grep mnt

udevadm trigger

XBPS_ARCH=x86_64 xbps-install \
  -S -R https://mirrors.servercentral.com/voidlinux/current \
  -r /mnt base-system
  
cp /etc/hostid /mnt/etc

echo "end of part 1"
