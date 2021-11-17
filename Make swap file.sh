mkdir /opt/swap

 dd if=/dev/zero of=/opt/swap/swapfile bs=1M count=2048 status=progress

chmod 600 /opt/swap/swapfile

chown root /opt/swap/swapfile

mkswap /swapfile

swapon /swapfile

" /swapfile none swap defaults 0 0 "

echo "/opt/swap/swapfile	none	swap	sw	0	0" >> /mnt/etc/fstab #Add swap to fstab, so it KEEPS working after installation.
