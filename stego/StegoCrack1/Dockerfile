FROM ubuntu:18.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt update

RUN apt-get update && apt-get install -y \
    software-properties-common
    
RUN add-apt-repository ppa:ondrej/php

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



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

RUN mkdir /photos1
COPY ./photos1 /photos1
RUN mkdir /photos2
COPY ./photos2 /photos2

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]

