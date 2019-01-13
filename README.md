# http://livecd.gnustep.org
GNUSTEP live CD

The current versions are based on the instructions at https://willhaley.com/blog/custom-debian-live-environment/

gnustep-language/       This should be in SystemPreferences (the languages part)

# Debian Menu system (thanks to the freedesktop.org)
- It is incomplete and should be called GNUSTEP
- More about it: https://bugs.debian.org/741573

# Configuration
/etc/skel is used for the me user to preconfigure the GNUstep applications, some tools, and Window Maker

# Symlinks (thanks to the freedesktop.org)
- /bin/open is removed, see https://bugs.debian.org/732796
- /usr/bin/open a symlink to /usr/bin/gopen (also do that for the manual page)
- /Applications to /usr/lib/GNUstep/Applications/
- /Users        to /home/
- /Volumes      to /mnt

# /etc/init.d/autoexec.bat run via /etc/rc2.d/S02autoexec.bat
```
# set the background color to a dark blue
echo "\033]P0015284"
# set the gray font color to light blue
echo "\033]P7ffffff"
# set no password for root
sed -i s,^root:.*,root::12522:0:99999:7:::, /etc/shadow
sed -i s,output=/usr/lib/GNUstep/System/Library/Fonts/,output=/etc/skel/GNUstep/Library/Fonts/,g /usr/bin/update-nfonts
# create a user called "me"
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
```

# /etc/skel/.xsession
Set a random background image
- sed -i "s,/usr/share/WindowMaker/Backgrounds/debian.tiff,`ls ~/Backgrounds/water* | shuf -n1`,g" /home/me/GNUstep/Defaults/WindowMaker

Set a random nickname for the TalkSoup IRC client, if started, autoconnect to irc.gnu.org and autojoin #gnustep
- sed -i "s,Nick = FIXME,Nick = `shuf -n1 /home/me/.nicknames`,g" /home/me/GNUstep/Library/ApplicationSupport/TalkSoup/ServerList.plist

Set display gamma at least to 1.6 (PC screens are too dark)
- xgamma -gamma 1.6

Run the window manager
- exec wmaker

# Debian Packages
Since Debian Stretch (9) does not have the following software, we add them manually:
- chess.app_2.8-1_amd64.deb, see https://bugs.debian.org/861862
- fontmanager.app_0.1-1_amd64.deb
- fonts-blankenburg_0.1-1_all.deb
- fonts-leaguespartan_0.1-1_all.deb
- mrboom_3.3-1_amd64.deb
- protracker_2.3d.r10-1_amd64.deb
- textedit.app_5.0-1_amd64.deb (NOT YET)
- zram-config_0.5_all.deb
- emacs.app (NOT YET), see https://bugs.debian.org/299324
