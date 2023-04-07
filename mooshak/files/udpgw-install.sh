#!/bin/sh
cd /opt/udpgw/
OS=`uname -m`;
mv badvpn-udpgw udpgw
if [ "$OS" == "x86_64" ]; then
  echo "Install 64-bit udpgw"
  mv badvpn-udpgw64 udpgw
fi
chmod +x udpgw
