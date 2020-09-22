FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y \
    apache2 \
    php \
    libapache2-mod-php
    
RUN mkdir /photos
COPY ./photos /photos

ENTRYPOINT service apache2 start && /bin/bash
