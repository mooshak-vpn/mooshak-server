#!/bin/sh
echo "Running badvpn"
exec /usr/bin/badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients $UDPG_MAX_CLIENTS
