#!/bin/bash

# make folders
mkdir -p /config/tmp /config/rtorrent/rtorrent_sess /config/log/rtorrent /detach_sess

# copy config files/set links etc...
[[ ! -f /config/rtorrent/config.php ]] && cp /defaults/config.php /config/rtorrent/config.php
[[ ! -L /config/www/webui/conf/config.php && -f /config/www/webui/conf/config.php ]] && rm /config/www/webui/conf/config.php
[[ ! -L /config/www/webui/conf/config.php ]] && ln -s /config/rtorrent/config.php /config/www/webui/conf/config.php
[[ ! -f /config/rtorrent/rtorrent.rc ]] && cp /defaults/rtorrent.rc /config/rtorrent/rtorrent.rc
[[ ! -L /home/abc/.autodl ]] && ln -s /config/.autodl /home/abc/.autodl
[[ ! -L /config/.irssi/scripts/autorun/autodl-irssi.pl ]] && ln -s /config/.irssi/scripts/autodl-irssi.pl /config/.irssi/scripts/autorun/autodl-irssi.pl
[[ ! -f /config/.autodl/autodl.cfg ]] && cp /defaults/autodl.cfg /config/.autodl/autodl.cfg
[[ ! -f /config/.autodl/autodl2.cfg ]] && cp /defaults/autodl.cfg /config/.autodl/autodl2.cfg
[[ ! -f /config/www/webui/plugins/autodl-irssi/conf.php ]] && cp /defaults/conf.php /config/www/webui/plugins/autodl-irssi/conf.php

# set perms
chown abc:abc -R /config /detach_sess
chown abc:abc /downloads
