# livecd.gnustep.org
GNUSTEP live CD

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

# .xsignature
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
