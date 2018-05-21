#!/bin/bash
docker run \
     --name dnsmasq \
     -d \
     -p 53:53/udp \
     -p 8083:8080 \
     --log-opt "max-size=100m" \
     -e "HTTP_USER=qiang" \
     -e "HTTP_PASS=kc123456" \
     --restart always \
     webprocdnsmasq:1.0

#-v $(pwd)/dnsmasq.conf:/etc/dnsmasq.conf