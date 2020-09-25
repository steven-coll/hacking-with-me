FROM ubuntu:18.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt-get update && apt-get install -y \
    software-properties-common

RUN apt install -y \
    apache2 \
    curl \
    git \
    libapache2-mod-php5 \
    php5 \
    php5-mcrypt \
    php5-mysql \
    python3.7 \
    python3-pip

RUN pip3 install stegcracker   

RUN mkdir /photos
COPY ./photos /photos

ENTRYPOINT ["/bin/bash"]
