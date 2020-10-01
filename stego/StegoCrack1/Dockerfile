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
    python3-pip \
    openssh-server \
    vim \
    apt-utils \
    iputils-ping \
    sudo 
RUN pip3 install stegcracker   

RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup user1
# username= user1, password= password
RUN echo 'user1:password' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user2
# username= user2, password= password
RUN echo 'user2:CBAEE1D55' | chpasswd


RUN useradd -ms /bin/bash -g sshgroup user3
# username= user2, password= password
RUN echo 'user3:y0Ur_fl@6' | chpasswd


RUN mkdir /var/run/sshd

USER user1
WORKDIR /home/user1/

USER user2
WORKDIR /home/user2/

USER user3
WORKDIR /home/user3/

USER root

RUN mkdir /home/user1/photos1
COPY ./photos1 /home/user1/photos1

RUN mkdir /home/user2/photos2
COPY ./photos2 /home/user2/photos2

RUN mkdir /home/user3/photos3

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/usr/sbin/sshd", "-D"]
