FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y \
    steghide \
    php \
    libapache2-mod-php
    
RUN mkdir /photos
COPY ./photos /photos

RUN ["/bin/bash", "-c", "echo hello all in one string"]
