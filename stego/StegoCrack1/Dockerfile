FROM ubuntu:18.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt-get update && apt-get install -y \
    software-properties-common
    
RUN add-apt-repository ppa:ondrej/php

RUN apt install -y \
    steghide \
    apache2 \
    curl \
    git \
    libapache2-mod-php7.0 \
    php7 \
    php7-mcrypt \
    php7-mysql \
    python3.7 \
    python3-pip

RUN pip3 install stegcracker   

RUN mkdir /photos
COPY ./photos /photos

ENTRYPOINT ["/bin/bash"]
