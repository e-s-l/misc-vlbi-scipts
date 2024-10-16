#!/usr/bin/env bash

# parameters:

BACKUP_DIR="./ForRestores"

# copy back the sources:

cp $BACKUP_DIR/sources.list.bak /etc/apt/sources.list

# copy back the keys:
# IT AIN*T SO SIMPLE....
# cp "$BACKUP_DIR/GPGKeys" /etc/apt/trusted.gpg.d/
# fix permissions:
# chown root:root /etc/apt/trusted.gpg.d/*.gpg
# chmod 644 /etc/apt/trusted.gpg.d/*.gpg

# Write extra packages
aptitude install -y $(cat "$BACKUP_DIR/installed-pkgs.log")

# Or
# Overwrite the installed packages:
# dpkg --clear-selections
# dpkg --set-selections "$BACKUP_DIR/installed-pkgs.log" && apt-get dselect-upgrade

