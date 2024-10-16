# Back up and re-instate your package lists

## For the sake of ease of future restores:

### 1. Get installed packages as list

Preliminaries:

`mkdir -p ~/for_restores`

(If it doesn't already exist.)

Run as root:

```
dpkg --get-selections | grep -v deinstall | awk '{print $1}' > ~/ForRestores/installed_pkgs.log

cp /etc/apt/sources.list ~/ForRestores/sources.list.bak
```
<s>apt-key exportall > ~/ForRestores/repositories.keys<\s>

Note apt-key's is depreceated... so another approach is (but is this really the right approach?):

```
mkdir -p "$BACKUP_DIR/gpg_keys"
cp /etc/apt/trusted.gpg.d/*.gpg "$BACKUP_DIR/gpg_keys/"

```
Be wary of user and groups owners and permissions when it comes to these...


Now, run all the above (see shell script) semi-regularly, as a cron?

#### NOTE:

All currently installed packages, shown with dependencies, can be prduced via:

`apt list --installed`

## 2. Backup your list

Sync installed_pkgs.log to your backup location...

Just store it in home, and make sure this is regularly backed-up.

## 3. Install packages from list

Then when the time comes to reinstall, to restore the sources, the keys and the pkgs,
run (as root):

`cp ~/ForRestores/sources.list.bak /etc/apt/sources.list`

<s>apt-key add ~/ForRestores/repositories.keys</s>

`apt-get update`

Then to just reinstall missing package from the list, run:

`aptitude install -y $(cat ~/ForRestores/installed_pkgs.log)`

But, to deinstall, packages not on the list too, instead do:

```
dpkg --clear-selections
dpkg --set-selections ~/ForRestores/installed_pkgs.log && apt-get dselect-upgrade
```

*************************************************************************************
