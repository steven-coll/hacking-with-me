
FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y \
    && mkdir photos \
    apache2 \
    php \
    libapache2-mod-php

ENTRYPOINT service apache2 start && /bin/bash
