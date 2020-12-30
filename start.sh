#!/bin/sh

# configs
# caddy
mkdir -p /etc/caddy/ /usr/share/caddy && echo -e "User-agent: *\nDisallow: /" > /usr/share/caddy/robots.txt
wget -qO  /usr/share/caddy/index.html $CADDYIndex
wget -qO- $CONFIGCADDY | sed -e "s/\$AUUID/$AUUID/g" > /etc/caddy/caddy.json

# xray
wget -qO- $CONFIGXRAY | sed -e "s/\$AUUID/$AUUID/g" -e "s/\$PORT/$PORT/g" > /etc/xray.json

# start
cat /etc/xray.json
/xray -config /etc/xray.json &
caddy run --config /etc/caddy/caddy.json
