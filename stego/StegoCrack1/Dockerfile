FROM ubuntu:18.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt update

RUN apt-get update && apt-get install -y \
    software-properties-common
    
RUN add-apt-repository ppa:ondrej/php

RUN apt install -y \
    steghide \
    john \
    apache2 \
    curl \
    git \
    libapache2-mod-php \
    php-mysql \
    mysql-server \
    python3.7 \
    python3-pip

RUN pip3 install stegcracker   

RUN mkdir /photos
COPY ./photos /photos

ENTRYPOINT ["/bin/bash"]
