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
    openssh-server \
    vim \
    apt-utils \
    iputils-ping \
    sudo
RUN pip3 install stegcracker   

RUN useradd -ms /bin/bash -g sudo user1
# username= user1, password= password
RUN echo 'user1:password' | chpasswd
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir /var/run/sshd

RUN mkdir /photos1
COPY ./photos1 /photos1
RUN mkdir /photos2
COPY ./photos2 /photos2

USER user1
WORKDIR /home/user1/


USER root

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/usr/sbin/sshd", "-D"]
