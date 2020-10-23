#this is the base ubuntu image I am using, the rest of the things in this file build off this
FROM kalilinux/kali-rolling:latest

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

#this is so the docker image builds without having to input any information, like when I download python in the file it wants me to input information. This skips it.
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean

#this is for part of the ssh installation, so ssh will work
RUN apt-get update && apt-get install -y \
    software-properties-common    
    
RUN apt-get update \
    && apt-get install -y openssh-server \
    && mkdir /var/run/sshd \
    && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && echo 'root:kali' | chpasswd

VOLUME /root /var/lib/postgresql

#here I am creating a group called "sshgroup" and then I create a user "user 0" which is added to the group
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup user0
# username= user, password= password
RUN echo 'user0:password' | chpasswd

#here I create the directory for ssh
RUN mkdir /var/run/sshd

#here I go into the user0 account and make the WORKDIR /home/user0. When they ssh as this user, their home directory will be the WORKDIR.
USER user0
WORKDIR /home/user0/

USER root

# SSH login fix. Otherwise user is kicked off after login
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/bin/bash", "-D"]
