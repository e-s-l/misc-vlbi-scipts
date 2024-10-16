#!/usr/bin/env bash

# parameters:

BACKUP_DIR="./ForRestores"

# preliminaries:

mkdir -p $BACKUP_DIR
mkdir -p $BACKUP_DIR/GPGKeys

# get list:

dpkg --get-selections | grep -v deinstall | awk '{print $1}' > $BACKUP_DIR/installed-pkgs.log

cp /etc/apt/sources.list $BACKUP_DIR/sources.list.bak

# copy keys:

cp /etc/apt/trusted.gpg.d/*.gpg "$BACKUP_DIR/GPGKeys"

# Deprecated:
# apt-key exportall > $BACKUP_DIR/apt-repos.keys




