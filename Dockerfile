# BIND9 Dockerfile

FROM gliderlabs/alpine

MAINTAINER vSense <admin@vsense.fr>

RUN adduser -D -u 5001 -s /sbin/nologin -h /var/www bind

RUN apk-install \
    bind \
    supervisor \
    && rm -rf /var/cache/apk/* \

COPY supervisord-nginx-php.ini /etc/supervisor.d/supervisord-nginx-php.ini

EXPOSE 53/udp 53

CMD ["supervisord", "-c", "/etc/supervisord.conf", "-n"]
