#
# Dockerfile for shadowsocks-libev
# docker build -t kcpssev --no-cache --rm .
# docker run -d --restart always --name=kcpssev -p 21000:21000/udp kcpssev
# 

FROM kcptun:latest
MAINTAINER Wang Jie <twj31470952@gmail.com>

# ENV SERVER_ADDR 0.0.0.0
# ENV SERVER_PORT 6443
# ENV PASSWORD=
# ENV METHOD      aes-256-cfb
# ENV TIMEOUT     300
# ENV DNS_ADDR    8.8.8.8
# ENV DNS_ADDR_2  8.8.4.4
# ENV ARGS=

RUN set -ex && \
    apk add --no-cache --virtual .build-deps \
                                autoconf \
                                build-base \
                                curl \
                                libev-dev \
                                libtool \
                                linux-headers \
                                libsodium-dev \
                                mbedtls-dev \
                                pcre-dev \
                                tar \
                                c-ares-dev && \
    cd /tmp && \
    curl -sSL https://github.com/shadowsocks/shadowsocks-libev/releases/download/v3.1.0/shadowsocks-libev-3.1.0.tar.gz | tar xz --strip 1 && \
    ./configure --prefix=/usr --disable-documentation && \
    make install && \
    cd .. && \

    runDeps="$( \
        scanelf --needed --nobanner /usr/bin/ss-* \
            | awk '{ gsub(/,/, "\nso:", $2); print "so:" $2 }' \
            | xargs -r apk info --installed \
            | sort -u \
    )" && \
    apk add --no-cache --virtual .run-deps $runDeps && \
    apk del .build-deps && \
    rm -rf /tmp/*

COPY shadowsocks.json /etc/shadowsocks.json
COPY kcptun-ss.json /etc/kcptun/kcptun-ss.json
COPY entrypoint.sh /entrypoint.sh

#USER nobody
#EXPOSE $SERVER_PORT/tcp $SERVER_PORT/udp

ENTRYPOINT ["/entrypoint.sh"]
RUN ["chmod", "+x", "/entrypoint.sh"]
