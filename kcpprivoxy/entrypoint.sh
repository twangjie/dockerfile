#!/bin/sh

/usr/sbin/privoxy /etc/privoxy.cfg

#kcptun-server -l :22000 -t 127.0.0.1:8118 --key test --crypt aes --mode fast --mtu 1350 --sndwnd 1024 --rcvwnd 1024
kcptun-server -c /etc/kcptun/kcptun-privoxy.json

