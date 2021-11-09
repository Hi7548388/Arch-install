#!/bin/bash


echo "#####################################################################"
echo "################## Updateing Mirrors ################################"
echo "#####################################################################"

sudo pacman -S reflector

sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist

echo "#####################################################################"
echo "################## Updateing Mirrors Done############################"
echo "#####################################################################"

echo "##########################################################"
echo "################## Confi arch linux ######################"
echo "##########################################################"

pacman -S nano bash-completion

mkdir /boot/efi

mount /dev/sda1 /boot/efi

echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "LC_CTYPE=en_US.UTF-8" >> /etc/locale.conf"

echo "LC_COLLATE=C" >> /mnt/etc/locale.conf

echo "en_US.UTF-8 UTF-8" > /etc/locale.gen

locale-gen

echo "archlinux" > /etc/hostname

echo "127.0.0.1 localhost
::1 localhost
127.0.1.1 archlinux.localdomain archlinux" > /etc/hosts

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime

hwclock --systohc --utc

echo "################################################################"
echo "################## Installing arch linux Done ##################"
echo "################################################################"


echo "###########################################################"
echo "################## Setting Password #######################"
echo "###########################################################"

passwd

echo "################################################################"
echo "##################  Done #######################################"
echo "################################################################"

echo "###########################################################"
echo "################## Creating User ##########################"
echo "###########################################################"

useradd -mg users -G wheel,storage,power,audio,video -s /bin/bash user1

passwd user1

echo "################################################################"
echo "##################  Done #######################################"
echo "################################################################"

echo "###########################################################"
echo "################## Installing Grub ########################"
echo "###########################################################"

pacman -S grub os-prober efibootmgr mtools

grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

echo "##########################################################"
echo "################## All Done ##############################"
echo "##########################################################"


echo "#####################################################################"
echo "################## Installing Desktop Extras ########################"
echo "#####################################################################"

sudo pacman -S --noconfirm --needed lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings 

sudo pacman -S --noconfirm --needed xorg xorg-server xorg-apps xorg-xinit 

sudo pacman -S --noconfirm --needed intel-ucode libva-intel-driver xf86-video-intel

sudo pacman -S --noconfirm --needed gnome-keyring gnome-disk-utility gnome-screenshot

sudo pacman -S --noconfirm --needed dialog libmtp laptop-detect

sudo pacman -S --noconfirm --needed xdg-desktop-portal-gtk

sudo pacman -S --noconfirm --needed polkit sof-firmware

sudo pacman -S --noconfirm --needed pulseaudio-alsa pulseaudio pavucontrol gstreamer gst-plugins-good gst-plugins-base playerctl alsa-firmware alsa-lib alsa-plugins alsa-utils

sudo pacman -S --noconfirm --needed pulseaudio-bluetooth bluez bluez-libs bluez-utils blueberry alsa-ucm-conf

sudo pacman -S --noconfirm --needed tlp Firefox lollypop partitionmanager

sudo pacman -S --noconfirm --needed ntp wget lsb-release p7zip playerctl polkit python2-xdg hw-probe

sudo pacman -S --noconfirm --needed file-roller menulibre expac

sudo pacman -S --noconfirm --needed ffmpegthumbs tree unace unrar unzip gksu qt5ct qt5-webkit

sudo pacman -S --noconfirm --needed gwenview neofetch w3m webkit2gtk wmctrl xapp xdo xdotool zenity

sudo pacman -S --noconfirm --needed imagemagick ocs-url iw

sudo pacman -S --noconfirm --needed unace libreoffice-fresh

sudo pacman -S --noconfirm --needed unrar

sudo pacman -S --noconfirm --needed zip 

sudo pacman -S --noconfirm --needed unzip

sudo pacman -S --noconfirm --needed sharutils

sudo pacman -S --noconfirm --needed hardinfo

sudo pacman -S --noconfirm --needed gvfs tree

sudo pacman -S --noconfirm --needed gvfs-afc 

sudo pacman -S --noconfirm --needed gvfs-gphoto2

sudo pacman -S --noconfirm --needed gvfs-mtp

sudo pacman -S --noconfirm --needed gvfs-nfs

sudo pacman -S --noconfirm --needed gvfs-smb

sudo pacman -S --noconfirm --needed mtpfs

sudo pacman -S --noconfirm --needed udiskie

sudo pacman -S --noconfirm --needed udisks2

sudo pacman -S --noconfirm --needed xdg-user-dirs

sudo pacman -S --noconfirm --needed tumbler

sudo pacman -S --noconfirm --needed ffmpegthumbnailer

sudo pacman -S --noconfirm --needed freetype2

sudo pacman -S --noconfirm --needed libgsf

sudo pacman -S --noconfirm --needed libopenraw

sudo pacman -S --noconfirm --needed poppler-glib

sudo pacman -S --noconfirm --needed poppler-qt5

sudo pacman -S --noconfirm --needed xf86-video-intel

sudo pacman -S --noconfirm --needed arj tlp

sudo pacman -S --noconfirm --needed cabextract intltool

sudo pacman -S --noconfirm --needed networkmanager

sudo pacman -S --noconfirm --needed networkmanager-openconnect
 
sudo pacman -S --noconfirm --needed networkmanager-pptp

sudo pacman -S --noconfirm --needed networkmanager-openvpn

sudo pacman -S --noconfirm --needed networkmanager-vpnc

sudo pacman -S --noconfirm --needed network-manager-applet 

sudo pacman -S --noconfirm --needed dconf-editor

sudo pacman -S --noconfirm --needed firefox 

sudo pacman -S --noconfirm --needed lollypop

sudo pacman -S --noconfirm --needed intel-ucode 

sudo pacman -S --noconfirm --needed onboard variety ufw gufw 

sudo pacman -S --noconfirm --needed xf86-input-libinput mesa xf86-video-openchrome xf86-video-intel

sudo pacman -S --noconfirm --needed xf86-input-vmmouse xf86-input-void xf86-input-elographics xf86-input-evdev xf86-video-fbdev

echo "#####################################################################"
echo "################## Installing Desktop ###############################"
echo "#####################################################################"

sudo pacman -S --noconfirm --needed mate mate-extra 

echo "#####################################################################"
echo "################## Done #############################################"
echo "#####################################################################"

echo "#####################################################################"
echo "################## Enableing Services ###############################"
echo "#####################################################################"

sudo systemctl enable lightdm.service 

sudo systemctl enable NetworkManager.service 

sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo sed -i 's/'#AutoEnable=false'/'AutoEnable=true'/g' /etc/bluetooth/main.conf

sudo systemctl enable tlp.service

echo "#####################################################################"
echo "##################  Done ############################################"
echo "#####################################################################"
echo "#####################################################################"
echo "################## Adding Autologin #################################"
echo "#####################################################################"

sudo groupadd autologin

sudo usermod -G autologin -a user1

sudo usermod -G audio -a user1

echo "#####################################################################"
echo "################## Adding Lightdm conf ##############################"
echo "#####################################################################"


echo "#####################################################################"
echo "################## Adding Lightdm and Sudo ##########################"
echo "#####################################################################"

FIND="#autologin-user="
REPLACE="autologin-user=user1"
sed -i "s/$FIND/$REPLACE/g" /etc/lightdm/lightdm.conf

mv lightdm-gtk-greeter.conf /etc/lightdm

FIND="# %wheel ALL=(ALL) ALL"
REPLACE="%wheel ALL=(ALL) ALL"
sed -i "s/$FIND/$REPLACE/g" /etc/sudoers

echo "#####################################################################"
echo "################## Done #############################################"
echo "#####################################################################"

echo "#####################################################################"
echo "################## Done #############################################"
echo "#####################################################################"

echo "#####################################################################"
echo "################## Installing ArcoLinux Repos #######################"
echo "#####################################################################"

sudo pacman -S wget --noconfirm --needed

echo "Getting the ArcoLinux keys from the ArcoLinux repo"

sudo wget https://github.com/arcolinux/arcolinux_repo/raw/master/x86_64/arcolinux-keyring-20230919-6-any.pkg.tar.zst -O /tmp/arcolinux-keyring-20230919-6-any.pkg.tar.zst
sudo pacman -U --noconfirm --needed /tmp/arcolinux-keyring-20230919-6-any.pkg.tar.zst


echo "Getting the latest arcolinux mirrors file"

sudo wget https://raw.githubusercontent.com/arcolinux/arcolinux-mirrorlist/master/etc/pacman.d/arcolinux-mirrorlist -O /etc/pacman.d/arcolinux-mirrorlist
echo '
#[arcolinux_repo_testing]
#SigLevel = Required DatabaseOptional
#Include = /etc/pacman.d/arcolinux-mirrorlist
[arcolinux_repo]
SigLevel = Required DatabaseOptional
Include = /etc/pacman.d/arcolinux-mirrorlist
[arcolinux_repo_3party]
SigLevel = Required DatabaseOptional
Include = /etc/pacman.d/arcolinux-mirrorlist
[arcolinux_repo_xlarge]
SigLevel = Required DatabaseOptional
Include = /etc/pacman.d/arcolinux-mirrorlist' | sudo tee --append /etc/pacman.conf

echo "#####################################################################"
echo "################## Done #############################################"
echo "#####################################################################"

echo "#####################################################################"
echo "################## Installing Pamac ###############################"
echo "#####################################################################"

sudo pacman -Syy

sudo pacman -S pamac-all mate-tweak paru-bin libdvdcss google-chrome

echo "#####################################################################"
echo "################## Done #############################################"
echo "#####################################################################"


echo "#####################################################################"
echo "################## Adding Themeing ##################################"
echo "#####################################################################"

pacman -S arcolinux-arc-themes-git arcolinux-candy-beauty-git

echo "#####################################################################"
echo "################## Done #############################################"
echo "#####################################################################"

echo "#####################################################################"
echo "################## Fix Keyserver ####################################"
echo "#####################################################################"

echo "keyserver hkp://keyserver.ubuntu.com" >> /etc/pacman.d/gnupg/gpg.conf

echo "#####################################################################"
echo "################## Set Processor ####################################"
echo "#####################################################################"

nc=$(grep -c ^processor /proc/cpuinfo)
echo "You have " $nc" cores."
echo "-------------------------------------------------"
echo "Changing the makeflags for "$nc" cores."
TOTALMEM=$(cat /proc/meminfo | grep -i 'memtotal' | grep -o '[[:digit:]]*')
if [[  $TOTALMEM -gt 8000000 ]]; then
sed -i "s/#MAKEFLAGS=\"-j2\"/MAKEFLAGS=\"-j$nc\"/g" /etc/makepkg.conf
echo "Changing the compression settings for "$nc" cores."
sed -i "s/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g" /etc/makepkg.conf
fi

echo "#####################################################################"
echo "################## Done #############################################"
echo "#####################################################################"

# mv config /home/user1/.config

echo "#####################################################################"
echo "################## Done All #########################################"
echo "#####################################################################"
