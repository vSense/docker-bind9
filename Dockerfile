# BIND9 Dockerfile

FROM gliderlabs/alpine

MAINTAINER vSense <docker@vsense.fr>

RUN apk-install \
    bind \
    supervisor \
    && rm -rf /var/cache/apk/*

COPY supervisord-bind.ini /etc/supervisor.d/supervisord-bind.ini
COPY named.conf /etc/bind/named.conf
COPY named.conf.default-zones /etc/bind/named.conf.default-zones
COPY zones.rfc1918 /etc/bind/zones.rfc1918

EXPOSE 53/udp 53

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
