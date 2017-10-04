# docker build -t kcpprivoxy --no-cache .
# docker build -t kcpprivoxy --no-cache --build-arg=HTTP_PROXY=http://192.168.35.3:8118/ .
# docker run -it --rm -p 22000:22000/udp kcpprivoxy

FROM kcptun:latest
MAINTAINER Wang Jie <twj31470952@gmail.com>

RUN set -xe; \
    apk --update add privoxy; \
    mkdir -p /etc/kcptun

COPY privoxy.cfg /etc/privoxy.cfg
COPY kcptun-privoxy.json /etc/kcptun/kcptun-privoxy.json
COPY entrypoint.sh /entrypoint.sh

EXPOSE 22000/udp

ENTRYPOINT ["/entrypoint.sh"]
RUN ["chmod", "+x", "/entrypoint.sh"]

