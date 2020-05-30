ARG BASEIMAGE="alpine:3.11.6"

FROM ${BASEIMAGE}

LABEL maintainer="info@thorstenreichelt.de"

ARG APP_NAME=TEST
ARG TZDATA_VERSION="2020a-r0" 

RUN apk add --no-cache \
        tzdata=${TZDATA_VERSION} \
        ca-certificates=20191127-r1 \
        wget=1.20.3-r0 \
        && wget --quiet -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
	&& for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION} glibc-i18n-${GLIBC_VERSION}; do wget --quiet ${GLIBC_REPO}/releases/download/${GLIBC_VERSION}/${pkg}.apk -O /tmp/${pkg}.apk; done \
        && apk add --no-cache /tmp/*.apk \
        && rm -f /tmp/*.apk \
        && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
        && echo "Europe/Berlin" >  /etc/timezone \
        && /usr/glibc-compat/bin/localedef -i de_DE -f UTF-8 de_DE.UTF-8 \
	&& apk update \
        && apk del tzdata glibc-i18n\
        && rm -rf /var/cache/apk/*

ENV LANG="de_DE.UTF-8" \
    LANGUAGE="de_DE.UTF-8" \
    TZ="Europe/Berlin"

RUN groupadd ${APP_NAME} \
	&& useradd -g ${APP_NAME} ${APP_NAME}

RUN ln -sf /dev/stdout <logfile>

USER ${APP_NAME}
EXPOSE <port>
VOLUME [""]
CMD ["", ""]
HEALTHCHECK [""]
