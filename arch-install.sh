#!/bin/bash

echo "#####################################################################"
echo "################## My Custom Arch Linux  ##################################"
echo "#####################################################################"


echo "#####################################################################"
echo "################## Updateing Mirrors #####################################"
echo "#####################################################################"

sudo pacman -S reflector

sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist

echo "#####################################################################"
echo "################## Updateing Mirrors Done#################################"
echo "#####################################################################"

echo "###########################################################"
echo "################## Installing Arch Linux Base ######################"
echo "###########################################################"

timedatectl set-ntp true

mkfs.fat -F32 /dev/sda1

mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt

pacstrap /mnt base linux linux-firmware base-devel git

genfstab -U /mnt >> /mnt/etc/fstab


mkdir /mnt/opt/swap

dd if=/dev/zero of=/mnt/opt/swap/swapfile bs=1M count=2048 status=progress

chmod 600 /mnt/opt/swap/swapfile

chown root /mnt/opt/swap/swapfile

mkswap /mnt/opt/swap/swapfile

swapon /mnt/opt/swap/swapfile

" /swapfile none swap defaults 0 0 "

echo "/opt/swap/swapfile	none	swap	sw	0	0" >> /mnt/etc/fstab #Add swap to fstab, so it KEEPS working after installation.

echo "#########################################################################"
echo "################## Copying Scripts To Installed System #############################"
echo "#########################################################################"

cd ..

cp -r Arch-install /mnt/home/


echo "##########################################"
echo "################## Done ####################"
echo "##########################################"


arch-chroot /mnt /home/Arch-install/install-desktop.sh
