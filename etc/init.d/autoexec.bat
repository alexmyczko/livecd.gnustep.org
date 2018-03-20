echo "\033]P0015284"
echo "\033]P7ffffff"
sed -i s,^root:.*,root::12522:0:99999:7:::, /etc/shadow
sed -i s,output=/usr/lib/GNUstep/System/Library/Fonts/,output=/etc/skel/GNUstep/Library/Fonts/,g /usr/bin/update-nfonts
useradd me -d /home/me -m -s /bin/zsh
#chsh -s /bin/zsh me
adduser me tty
adduser me audio
chmod 0660 /dev/tty*
update-rc.d -f ssh remove > /dev/null
update-rc.d -f wdm remove > /dev/null
update-rc.d -f cron remove > /dev/null
update-rc.d -f knot remove > /dev/null
update-rc.d -f xrdp remove > /dev/null
update-rc.d -f klogd remove > /dev/null
update-rc.d -f samba remove > /dev/null
update-rc.d -f cupsys remove > /dev/null
update-rc.d -f motion remove > /dev/null
update-rc.d -f apache2 remove > /dev/null
update-rc.d -f hddtemp remove > /dev/null
update-rc.d -f portmap remove > /dev/null
update-rc.d -f sysklogd remove > /dev/null
update-rc.d -f tftpd-hpa remove > /dev/null
update-rc.d -f nfs-common remove > /dev/null
update-rc.d -f dhcp3-server remove > /dev/null
update-rc.d -f smartmontools remove > /dev/null
update-rc.d -f nfs-kernel-server remove > /dev/null
#echo "Please wait while the fonts are prepared..."
#/bin/su -s /bin/zsh -c "/usr/bin/update-nfonts > /dev/null" - me
init-zram-swapping
