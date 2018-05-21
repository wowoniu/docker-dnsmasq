all: dnsmasq

dnsmasq:
	docker build -t webprocdnsmasq:1.0 .
