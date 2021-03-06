FROM ubuntu:xenial

ARG APPIMAGETOOL="https://github.com/AppImage/AppImageKit/releases/download/9/appimagetool-x86_64.AppImage"
ARG NOTECONSURL="https://sgcdn.startech.com/005329/media/sets/NOTECONS02_Drivers/NOTECONS02%20Software%20Pack.zip"
ARG RELEASE_DATE="20150921"
ARG VERSION="115.0921"

ADD $APPIMAGETOOL /usr/local/bin/appimagetool
ADD $NOTECONSURL /tmp/notecons.zip
COPY build.sh /usr/local/bin/build.sh

RUN apt-get update && \
    apt-get install -y unzip binutils curl libfuse2 && \
    chmod +x /usr/local/bin/appimagetool /usr/local/bin/build.sh
