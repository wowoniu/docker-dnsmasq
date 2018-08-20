#!/bin/sh

echo "nameserver 127.0.0.1" > /etc/resolv.conf

webproc --config /etc/dnsmasq.conf -- dnsmasq --no-daemon
