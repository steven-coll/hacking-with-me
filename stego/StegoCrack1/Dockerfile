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


RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup user0
# username= user1, password= password
RUN echo 'user0:password' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user1
# username= user1, password= password
RUN echo 'user1:BCDEFGHIJKLMNOPQRSTUVWXYZA' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user2
# username= user2, password= password
RUN echo 'user2:CBAEE1D55' | chpasswd


RUN useradd -ms /bin/bash -g sshgroup user3
# username= user2, password= password
RUN echo 'user3:y0Ur_fl@6' | chpasswd


RUN mkdir /var/run/sshd

USER user0
WORKDIR /home/user0/

RUN mkdir /home/user0/photos
COPY ./photos /home/user0/photos

USER user1
WORKDIR /home/user1/

RUN mkdir /home/user1/photos1
COPY ./photos1 /home/user1/photos1
COPY ./wordlists/wordlist.txt /home/user1/wordlists

USER user2
WORKDIR /home/user2/

RUN mkdir /home/user2/photos2
COPY ./photos2 /home/user2/photos2
COPY ./wordlists/wordlist.txt /home/user2/wordlists

USER user3
WORKDIR /home/user3/

RUN mkdir /home/user3/photos3

USER root







# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/usr/sbin/sshd", "-D"]
