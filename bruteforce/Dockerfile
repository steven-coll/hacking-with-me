#this is the base kali image I am using, the rest of the things in this file build off this
FROM ubuntu:18.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

#this is so the docker image builds without having to input any information, like when I download python in the file it wants me to input information. This skips it.
ENV DEBIAN_FRONTEND noninteractive


RUN apt update

#this is for part of the ssh installation, so ssh will work
RUN apt-get update -y && apt-get install -y \
    software-properties-common    
    

#add tools to download here, keep openssh-server. L
RUN apt-get update \
    && apt-get install -y openssh-server \
    && apt-get install -y unzip \
    && apt-get install -y grep \
    && apt-get install -y john \
    && apt-get install -y hydra \
    && apt-get install -y medusa \
    && apt-get install -y vim \
    && apt-get install -y patator \
    && apt-get install -y hashcat \
    && apt-get install -y sudo \
    && mkdir /var/run/sshd \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config


#here I am creating a group called "sshgroup" and then I create a user "user 0" which is added to the group
RUN useradd -ms /bin/bash hackingwithme1
RUN echo 'hackingwithme1:bruteforce1' | chpasswd

RUN useradd -ms /bin/bash jenna
RUN echo 'jenna:pizza' | chpasswd
USER root
RUN unshadow /etc/passwd /etc/shadow > /home/hackingwithme1/jenna1

RUN useradd -ms /bin/bash kelly
RUN echo 'kelly:ilovepuppies' | chpasswd
USER root
RUN unshadow /etc/passwd /etc/shadow > /home/hackingwithme1/kelly1

RUN useradd -ms /bin/bash molly
RUN echo 'molly:oceanbreeze235' | chpasswd

RUN useradd -ms /bin/bash kian
RUN echo 'kian:notapassword' | chpasswd

#here I go into the user0 account and make the WORKDIR /home/user0. When they ssh as this user, their home directory will be the WORKDIR.
USER hackingwithme1
WORKDIR /home/hackingwithme1/
COPY ./user0/ /home/hackingwithme1/

#chmod 700 so only that user can access their home directory
RUN chmod 700 /home/hackingwithme1


USER root
RUN sudo chmod -R 755 /etc/shadow
RUN sudo chmod -R 755 /etc/passwd
# SSH login fix. Otherwise user is kicked off after login
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/usr/sbin/sshd", "-D"]
