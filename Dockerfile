FROM alpine:3.11.6

LABEL maintainer="info@thorstenreichelt.de"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
	#Ubuntu 20.04
	locales=2.31-0ubuntu9 \
	tzdata=2019c-3ubuntu1 \
	#Ubuntu 18.04
	#locales=2.27-3ubuntu1 \
	#tzdata=2020a-0ubuntu0.18.04  \
	#NodeJS
	#locales=2.24-11+deb9u4 \
	#tzdata=2019c-0+deb9u1 \
	#Nextcloud
	#locales=2.28-10 \
        #tzdata=2020a-0+deb10u1 \
	&& sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen \
    	&& \dpkg-reconfigure --frontend=noninteractive locales \
    	&& \update-locale LANG=de_DE.UTF-8 \
	&& cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
	&& rm -rf /var/lib/apt/lists/*

ENV LANG="de_DE.UTF-8" \
    LANGUAGE="de_DE.UTF-8" \
    TZ="Europe/Berlin"

RUN ln -sf /dev/stdout <logfile>

USER <username>
EXPOSE <port>
VOLUME [""]
CMD ["", ""]
HEALTHCHECK [""]