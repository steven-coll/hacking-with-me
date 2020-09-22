FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y \
    steghide \
    python3.6 \
    python3.6-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    stegcracker

RUN mkdir /photos
COPY ./photos /photos

RUN ["/bin/bash", "-c", "echo hello all in one string"]
