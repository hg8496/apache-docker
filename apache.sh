#!/bin/bash
if [ "$APACHE_SERVER_NAME" != "**NONE**" ]; then
  echo "$APACHE_SERVER_NAME"
  sed -i "1 a ServerName $APACHE_SERVER_NAME:80" etc/apache2/sites-enabled/000-default.conf
fi
/bin/bash -c "/usr/sbin/apache2ctl -DFOREGROUND"
