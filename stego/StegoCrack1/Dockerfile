#this is the base ubuntu image I am using, the rest of the things in this file build off this
FROM ubuntu:18.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

#this is so the docker image builds without having to input any information, like when I download python in the file it wants me to input information. This skips it.
ENV DEBIAN_FRONTEND noninteractive

#update it off the bat
RUN apt update

#this is for part of the ssh installation, so ssh will work
RUN apt-get update && apt-get install -y \
    software-properties-common    
  
#this if for part of the python installation, which I needed for the stegcracker tool to work
RUN add-apt-repository ppa:ondrej/php

#these are the tools I install, 
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
    hexedit \
    exiftool \
    sudo 
#had to install stegcracker with python pip install
RUN pip3 install stegcracker   

#here I am creating a group called "sshgroup" and then I create a user "user 0" which is added to the group
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup user0
# username= user, password= password
RUN echo 'user0:password' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user1
# username= user1, password= password
RUN echo 'user1:BCDEFGHIJKLMNOPQRSTUVWXYZA' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user2
# username= user, password= password
RUN echo 'user2:CBAEE1D55' | chpasswd


RUN useradd -ms /bin/bash -g sshgroup user3
# username= user, password= password
RUN echo 'user3:y0Ur_fl@6' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user4
# username= user, password= password
RUN echo 'user4:HnTCkTKEyJ' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user5
# username= user, password= password
RUN echo 'user5:tUHXkTQwoT' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user6
# username= user, password= password
RUN echo 'user6:96OvxWC9c4' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user7
# username= user, password= password
RUN echo 'user7:1aAtLEN2TK' | chpasswd

#here I create the directory for ssh
RUN mkdir /var/run/sshd

#here I go into the user0 account and make the WORKDIR /home/user0. When they ssh as this user, their home directory will be the WORKDIR.
USER user0
WORKDIR /home/user0/

#here I make a directory to hold the photos in user0
RUN mkdir /home/user0/photos

#here I copy the /photos folder from my github, and put it in the user0/photos folder
COPY ./photos /home/user0/photos
RUN chmod 700 /home/user0
USER user1
WORKDIR /home/user1/

RUN mkdir /home/user1/photos1
RUN mkdir /home/user1/wordlists
COPY ./photos1 /home/user1/photos1
COPY ./wordlists/wordlist.txt /home/user1/wordlists
RUN chmod 700 /home/user1
USER user2
WORKDIR /home/user2/

RUN mkdir /home/user2/photos2
RUN mkdir /home/user2/wordlists
COPY ./photos2 /home/user2/photos2
COPY ./wordlists/wordlist.txt /home/user2/wordlists
RUN chmod 700 /home/user2

USER user3
WORKDIR /home/user3/
COPY ./user3/password.mp4 /home/user3
RUN chmod 700 /home/user3

USER user4
WORKDIR /home/user4/
COPY ./user4/skate.jpg /home/user4
RUN chmod 700 /home/user4

USER user5
WORKDIR /home/user5/
COPY ./user5 /home/user5
RUN chmod 700 /home/user5

USER user6
WORKDIR /home/user6/
COPY ./user6 /home/user6
RUN chmod 700 /home/user6

USER user7
WORKDIR /home/user7/
COPY ./user7 /home/user7
RUN chmod 700 /home/user7

USER root
COPY ./etc/motd /etc/updated-motd.d
RUN chmod +x /etc/updated-motd.d

# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/usr/sbin/sshd", "-D"]
