samba-backup
============

Configurable tool to mount a samba share and back up files in one command which can be automated in cron



Configuration
-------------

* Place the files/folders that the program should back up in the file 'watchlist'. Make sure that the main script
points correctly to the location of this file. 

* An example file has been provided to show the appropriate layout, edit to suit.

* create a folder in /mnt/samba, which is the default mount point for the script


Usage
-----

* cd to folder, and run "./samba-backup"

* If /mnt/samba is empty, the script will prompt for login details for the desired samba share and mount it to this location

* If a samba share is already mounted, for example if the mount has been set persistently in fstab, then the script will
  Ignore the inital mount and copy files straight to /mnt/samba. This setup would allow the addition of samba-backup to CRONTAB
  in order to automate backups of important files.

