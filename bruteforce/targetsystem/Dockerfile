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
    && apt-get install -y sudo \
    && mkdir /var/run/sshd \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config


RUN useradd -ms /bin/bash hackingwithme2 && adduser hackingwithme2 sudo
RUN echo 'hackingwithme2:bruteforce2' | chpasswd

#here I am creating a group called "sshgroup" and then I create a user "user 0" which is added to the group
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup jimmy
RUN echo 'jimmy:u2fan7575' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup blair
RUN echo 'blair:bobMarley4evr' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup james
RUN echo 'james:imfortyseven' | chpasswd

USER hackingwithme1
WORKDIR /home/hackingwithme1/

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
