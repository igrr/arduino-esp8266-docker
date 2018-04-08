FROM python:2.7-stretch

RUN apt-get update && apt-get install -y \
    git \
    wget \
    make \
    grep \
    g++ \
  && apt-get clean

ENV ARDUINO_VER=arduino-1.8.5

ENV ARDUINO_PKG=${ARDUINO_VER}-linux64.tar.xz \
    ARDUINO_IDE_PATH=/opt/$ARDUINO_VER \
    TOOLCHAIN_PKG=linux64-xtensa-lx106-elf-gb404fb9.tgz \
    TOOLCHAIN_PKG_DST=linux64-xtensa-lx106-elf-gb404fb9.tar.gz

RUN wget https://downloads.arduino.cc/$ARDUINO_PKG \
    && mkdir -p /opt \
    && tar -xf $ARDUINO_PKG -C /opt \
    && rm $ARDUINO_PKG

RUN mkdir -p /opt/dist \
    && wget -O /opt/dist/$TOOLCHAIN_PKG_DST https://github.com/esp8266/Arduino/releases/download/2.3.0/$TOOLCHAIN_PKG

ENTRYPOINT /bin/bash
