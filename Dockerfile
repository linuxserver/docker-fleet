# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-alpine:3.19

# set version label
ARG BUILD_DATE
ARG VERSION
ARG FLEET_RELEASE
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Josh Stark,Thelamer"

# default env
ENV fleet_database_driver="org.mariadb.jdbc.Driver" \
fleet_app_port=8080

RUN \
  echo "**** install runtime packages ****" && \
  apk -U --no-cache add \
    openjdk11-jre-headless && \
  echo "**** install fleet ****" && \
  if [ -z ${FLEET_RELEASE+x} ]; then \
    FLEET_RELEASE=$(curl -sX GET "https://api.github.com/repos/linuxserver/fleet/releases/latest" \
    | awk '/tag_name/{print $4;exit}' FS='[""]'); \
  fi && \
  mkdir -p \
    /app/fleet && \
  curl -o \
    /app/fleet/fleet.jar -L \
    "https://github.com/linuxserver/fleet/releases/download/${FLEET_RELEASE}/fleet-${FLEET_RELEASE}.jar" && \
  echo "**** clean up ****" && \
  rm -rf \
    /tmp/*

# copy files
COPY root/ /

# ports and volumes
EXPOSE 8080
WORKDIR /app/fleet
