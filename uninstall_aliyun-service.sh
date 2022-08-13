#!/bin/bash

pkill aegis
systemctl stop aegis
systemctl disable aegis
pkill aliyun-service

d='/tmp/uninstall_aliyun-service/'
mkdir $d
cd $d
curl -o uninstall.sh "http://update.aegis.aliyun.com/download/uninstall.sh"
bash uninstall.sh
rm -rf uninstall.sh

curl -o uninstall.sh "http://update.aegis.aliyun.com/download/quartz_uninstall.sh"
bash uninstall.sh
rm -rf uninstall.share

rm -rf /etc/systemd/system/aegis.service
rm -rf /etc/rc2.d/S80aegis
rm -rf /etc/rc3.d/S80aegis
rm -rf /etc/rc4.d/S80aegis
rm -rf /etc/rc5.d/S80aegis
rm -rf /etc/rc.d/rc2.d/S80aegis
rm -rf /etc/rc.d/rc3.d/S80aegis
rm -rf /etc/rc.d/rc4.d/S80aegis
rm -rf /etc/rc.d/rc5.d/S80aegis
rm -rf /usr/local/aegis


pkill aliyun-service
/usr/local/share/assist-daemon/assist_daemon --stop
/usr/local/share/assist-daemon/assist_daemon --delete
rm -rf /usr/sbin/aliyun*
rm -rf /usr/local/share/aliyun-assist
rm -rf /usr/local/share/assist-daemon
rm -rf /tmp/aliyun_assist_*

rm -rf $d
