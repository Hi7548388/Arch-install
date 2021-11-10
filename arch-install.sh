#!/bin/bash


echo "#####################################################################"
echo "################## Updateing Mirrors ################################"
echo "#####################################################################"

sudo pacman -S reflector

sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist

echo "#####################################################################"
echo "################## Updateing Mirrors Done############################"
echo "#####################################################################"

echo "###########################################################"
echo "################## Installing arch linux ##################"
echo "###########################################################"

timedatectl set-ntp true

mkfs.fat -F32 /dev/sda1

mkfs.ext4 /dev/sda2

mkswap /dev/sda3

mount /dev/sda2 /mnt

swapon /dev/sda3

pacstrap /mnt base linux linux-firmware base-devel git

genfstab -U /mnt >> /mnt/etc/fstab

echo "#########################################################################"
echo "################## Copying Scripts To Installed System #########################33333"
echo "#########################################################################"

cd ..

cp -r arch-install /mnt/home/


echo "##########################################"
echo "################## Done ####################"
echo "##########################################"


arch-chroot /mnt /home/arch-install/install-desktop.sh
