#!/bin/bash
echo 'start of baseinstall_part2.sh'
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
cat << EOF >> /etc/rc.conf
KEYMAP="cf"
HARDWARECLOCK="UTC"
EOF

ln -sf /usr/share/zoneinfo/America/Montreal /etc/localtime


sed -i "s@#fr_CA.UTF-8@fr_CA.UTF-8@g" /etc/default/libc-locales
cat << EOF > /etc/locale.conf
LANG=fr_CA.UTF-8
LC_COLLATE=C
LC_ALL=fr_CA.UTF-8
EOF

xbps-reconfigure -f glibc-locales

echo "root:$$$$" | chpasswd

cat << EOF > /etc/dracut.conf.d/zol.conf
nofsck="yes"
add_dracutmodules+=" zfs "
omit_dracutmodules+=" btrfs "
EOF

xbps-install -S zfs

zfs set org.zfsbootmenu:commandline="quiet" zroot/ROOT

mkfs.vfat -F32 "$BOOT_DEVICE"

cat << EOF >> /etc/fstab
$( blkid | grep "$BOOT_DEVICE" | cut -d ' ' -f 2 ) /boot/efi vfat defaults 0 0
EOF

mkdir -p /boot/efi
mount /boot/efi

xbps-install -S curl
mkdir -p /boot/efi/EFI/ZBM
curl -o /boot/efi/EFI/ZBM/VMLINUZ.EFI -L https://get.zfsbootmenu.org/efi
cp /boot/efi/EFI/ZBM/VMLINUZ.EFI /boot/efi/EFI/ZBM/VMLINUZ-BACKUP.EFI


xbps-install efibootmgr

efibootmgr -c -d "$BOOT_DISK" -p "$BOOT_PART" \
  -L "ZFSBootMenu (Backup)" \
  -l '\EFI\ZBM\VMLINUZ-BACKUP.EFI'

efibootmgr -c -d "$BOOT_DISK" -p "$BOOT_PART" \
  -L "ZFSBootMenu" \
  -l '\EFI\ZBM\VMLINUZ.EFI'
  
echo "reconfigure all installed packages"
xbps-reconfigure -fa
xbps-install nano
echo "end of baseinstall_part2.sh:"  
#exit
#umount -n -R /mnt
#zpool export zroot
#reboot
  
