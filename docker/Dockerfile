FROM ubuntu:18.04 AS builder

RUN apt update \
# dependencies
    && apt install -y \
        build-essential \
        g++ \
        cmake \
        git \
        wget \
        libfreetype6-dev \
        libjpeg-dev \
        xorg-dev \
        libxrandr-dev \
        xcb \
        libx11-xcb-dev \
        libxcb-randr0-dev \
        libxcb-image0-dev \
        libgl1-mesa-dev \
        libflac-dev \
        libogg-dev \
        libvorbis-dev \
        libopenal-dev \
        libpthread-stubs0-dev \
        libudev-dev \
    && mkdir /build && cd build \
    && git clone https://github.com/SFML/SFML.git && cd SFML \
    && mkdir build && cd build \
    && mkdir ../out \
    && cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/build/SFML/out/usr/local/ \
        .. \
    && make install \
    && cmake \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_INSTALL_PREFIX=/build/SFML/out/usr/local/ \
        .. \
    && make install

FROM ubuntu:18.04

COPY --from=builder /build/SFML/out/ /

ENV ALCHEMY_HOME alchemy/

RUN apt update \
    && apt upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
        build-essential \
        g++ \
        cmake \
        git \
        libfreetype6 \
        libjpeg8 \
        xorg \
        libxrandr2 \
        xcb \
        libx11-xcb1 \
        libxcb-randr0 \
        libxcb-image0 \
        libgl1-mesa-glx \
        libflac8 \
        libogg0 \
        libvorbis0a \
        libvorbisenc2 \
        libopenal1 \
        libudev1 \
        pkg-config
