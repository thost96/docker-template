#select source image
FROM <source>

LABEL maintainer="info@thorstenreichelt.de"

#install needed packages
RUN apt-get update -qq && apt-get install -y -qq \
        locales \
	tzdata \
     && rm -rf /var/lib/apt/lists/*

#set locale and timezone
RUN sed -i -e 's/# de_DE.UTF-8 UTF-8/de_DE.UTF-8 UTF-8/' /etc/locale.gen \
    && \dpkg-reconfigure --frontend=noninteractive locales \
    && \update-locale LANG=de_DE.UTF-8
RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime

#set environment variables
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
