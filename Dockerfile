FROM ubuntu:20.04

LABEL maintainer="info@thorstenreichelt.de"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
        locales=2.28-10 \
        tzdata=2020a-0+deb10u1 \
     && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen \
    && \dpkg-reconfigure --frontend=noninteractive locales \
    && \update-locale LANG=de_DE.UTF-8
RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

ENV LANG="de_DE.UTF-8" \
	TZ="Europe/Berlin"

#link logfile to stdout
RUN ln -sf /dev/stdout <logfile>

#set user and expose volumes and ports 
USER <username>
EXPOSE <port>
VOLUME [""]
CMD ["", ""]
HEALTHCHECK [""]
