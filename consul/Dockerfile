# BIND9 Dockerfile

FROM gliderlabs/alpine:3.1

MAINTAINER vSense <docker@vsense.fr>

RUN apk-install \
    bind \
    supervisor \
    wget \
    tar \
    && wget --no-check-certificate https://github.com/hashicorp/consul-template/releases/download/v"$PKGVER"/consul-template_"$PKGVER"_linux_amd64.tar.gz -O - | tar xz --strip-components 1 -C /usr/bin \
    && rm -rf /var/cache/apk/* \
    && mkdir /var/cache/bind

COPY supervisord-bind.ini /etc/supervisor.d/supervisord-bind.ini
COPY named.conf /etc/bind/named.conf
COPY named.conf.default-zones /etc/bind/named.conf.default-zones
COPY zones.rfc1918 /etc/bind/zones.rfc1918

EXPOSE 53/udp 53

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
