FROM "thost96/base:ubuntu-20.04"

LABEL maintainer="info@thorstenreichelt.de"

ARG APP_NAME=TEST

RUN apt-get update -qq && apt-get install -y -qq --no-install-recommends \
	${APP_NAME}
	&& rm -rf /var/lib/apt/lists/*

RUN groupadd ${APP_NAME} \
	&& useradd -g ${APP_NAME} ${APP_NAME}

RUN ln -sf /dev/stdout <logfile>

USER ${APP_NAME}
EXPOSE <port>
VOLUME [""]
CMD ["", ""]
HEALTHCHECK [""]
