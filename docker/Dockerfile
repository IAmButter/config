FROM ubuntu:18.04

ENV ALCHEMY_HOME alchemy/

RUN apt update \
    && apt upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt install -y \
        build-essential \
        g++ \
        cmake \
        git \
        python3 \
        pkg-config
