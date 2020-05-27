FROM alpine:3.11.6

LABEL maintainer="info@thorstenreichelt.de"

RUN apk add --no-cache \
        tzdata=2020a-r0 \
        ca-certificates=20191127-r1 \
        wget=1.20.3-r0 \
        && wget --quiet -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
        && wget --quiet https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk \
        && wget --quiet https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk \
        && wget --quiet https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk \
        && apk add --no-cache glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk \
        && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
        && echo "Europe/Berlin" >  /etc/timezone \
        && apk update \
        && apk del tzdata \
        && /usr/glibc-compat/bin/localedef -i de_DE -f UTF-8 de_DE.UTF-8 \
        && rm -rf /var/cache/apk/*

ENV LANG="de_DE.UTF-8" \
    LANGUAGE="de_DE.UTF-8" \
    TZ="Europe/Berlin"

RUN ln -sf /dev/stdout <logfile>

USER <username>
EXPOSE <port>
VOLUME [""]
CMD ["", ""]
HEALTHCHECK [""]