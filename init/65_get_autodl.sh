#!/bin/bash

# create .autodl config dir and link
[[ ! -d /config/.autodl ]] && (mkdir /config/.autodl && chown -R abc:abc /config/.autodl)
[[ ! -d /home/abc ]] && (mkdir /home/abc && chown -R abc:abc /home/abc)

# get rutorrent plugin
[[ ! -d /config/www/webui/plugins/autodl-irssi/.git ]] && (git clone https://github.com/autodl-community/autodl-rutorrent.git /config/www/webui/plugins/autodl-irssi && \
chown -R abc:abc /config/www/webui/plugins/autodl-irssi)

# get autodl script for irssi
[[ ! -d /config/.irssi/scripts/.git ]] && (mkdir /config/.irssi && \
  git clone https://github.com/autodl-community/autodl-irssi.git /config/.irssi/scripts && \
  mkdir /config/.irssi/scripts/autorun && \
  ln -s /config/.irssi/scripts/autodl-irssi.pl /config/.irssi/scripts/autorun/autodl-irssi.pl && \
  chown -R abc:abc /config/.irssi )

# get updated trackers for irssi-autodl
wget --quiet -O /tmp/trackers.zip https://github.com/autodl-community/autodl-trackers/archive/master.zip && \
cd /config/.irssi/scripts/AutodlIrssi/trackers && \
unzip -q -o -j /tmp/trackers.zip && \
rm /tmp/trackers.zip


# install cpan modules
curl -L http://cpanmin.us | perl - App::cpanminus && \
    cpanm Archive::Zip Net::SSLeay HTML::Entities XML::LibXML Digest::SHA JSON JSON::XS

# opt out for autoupdates
[ "$ADVANCED_DISABLEUPDATES" ] && exit 0

# update rutorrent plugin
cd /config/www/webui/plugins/autodl-irssi || exit
git pull
chown -R abc:abc /config/www/webui/plugins/autodl-irssi

# update autodl script for irssi
cd /config/.irssi/scripts || exit
git pull
chown -R abc:abc /config/.irssi
