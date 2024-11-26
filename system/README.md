These are some of the system config files that i modified

/etc/systemd/resolved.conf  --- Should activate the resolved service

/etc/modprobe.d/nvidia.conf
/etc/mkinitcpio.conf        --- Should run mkinitcpio or something like that

/etc/passwd

/etc/fstab                  --- Probably also need to regenerated when changin partitions

/etc/default/grub           --- Just the setting for the modprobe to dualboot
