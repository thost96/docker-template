FROM alpine:3.11.6

LABEL maintainer="info@thorstenreichelt.de"

RUN apk add --no-cache ca-certificates wget=1.20.3-r0 && \
    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-2.25-r0.apk && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-bin-2.25-r0.apk && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.25-r0/glibc-i18n-2.25-r0.apk && \
    apk add --no-cache glibc-bin-2.25-r0.apk glibc-i18n-2.25-r0.apk glibc-2.25-r0.apk && \
    rm -rf /var/cache/apk/*
    
COPY locale.md /locale.md
RUN cat /locale.md | xargs -i /usr/glibc-compat/bin/localedef -i {} -f UTF-8 {}.UTF-8

ENV LANG="de_DE.UTF-8" \
    LANGUAGE="de_DE.UTF-8" \
    TZ="Europe/Berlin"

RUN ln -sf /dev/stdout <logfile>

USER <username>
EXPOSE <port>
VOLUME [""]
CMD ["", ""]
HEALTHCHECK [""]
