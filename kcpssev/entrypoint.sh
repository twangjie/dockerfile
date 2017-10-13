#!/bin/sh

ss-server -c /etc/shadowsocks.json &
kcptun-server -c /etc/kcptun/kcptun-ss.json
