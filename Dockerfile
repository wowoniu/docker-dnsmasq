FROM alpine:edge
#LABEL maintainer="dev@jpillora.com"
# webproc release settings
#ENV WEBPROC_VERSION 0.1.9
#ENV WEBPROC_URL https://github.com/jpillora/webproc/releases/download/$WEBPROC_VERSION/webproc_linux_amd64.gz
# fetch dnsmasq and webproc binary
RUN apk update \
	&& apk --no-cache add dnsmasq 
COPY webproc_linux_amd64 /usr/local/bin/webproc
RUN  chmod +x /usr/local/bin/webproc
#configure dnsmasq
RUN mkdir -p /etc/default/
RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq
#RUN echo "nameserver 127.0.0.1" > /etc/resolv.conf
COPY dnsmasq_base.conf /etc/dnsmasq.d/dnsmasq_base.conf
COPY dnsmasq.conf /etc/dnsmasq.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh
#run!
ENTRYPOINT ["./run.sh"]
