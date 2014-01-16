#!/bin/sh
# Auto Mount CIFS / SMB / Samba Share on Ubuntu / Debian
# Author: [Josef Jezek](http://about.me/josefjezek)
# Donate: [Gittip](https://www.gittip.com/josefjezek)
# Link: [Gist](https://gist.github.com/6390561)
# Hourly cron job: 0 */1 * * * /root/auto-mount.sh > /dev/null 2>&1

MOUNT_POINT=/media/data
SHARE=//example.com/data
DOMAIN=example.com
USERNAME=administrator
PASSWORD=ubuntu

if ! mountpoint -q $MOUNT_POINT; then
  echo "Mount $MOUNT_POINT"
  mount.cifs $SHARE $MOUNT_POINT -o username=$USERNAME,password=$PASSWORD,domain=$DOMAIN,iocharset=utf8,file_mode=0777,dir_mode=0777
fi
