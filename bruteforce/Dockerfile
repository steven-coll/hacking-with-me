#this is the base kali image I am using, the rest of the things in this file build off this
FROM kalilinux/kali-rolling:latest

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

#this is so the docker image builds without having to input any information, like when I download python in the file it wants me to input information. This skips it.
ENV DEBIAN_FRONTEND noninteractive

RUN mkdir -p /usr/share/man/man1

#updating
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean

#this is for part of the ssh installation, so ssh will work
RUN apt-get update && apt-get install -y \
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
    && mkdir /var/run/sshd \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config 


VOLUME /root /var/lib/postgresql

#here I am creating a group called "sshgroup" and then I create a user "user 0" which is added to the group
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup hackingwithme1
# username= user, password= password
RUN echo 'hackingwithme1:bruteforce1' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup jenna
RUN echo 'jenna:pizza' | chpasswd
USER root
RUN /etc/passwd /etc/shadow > jenna1

RUN useradd -ms /bin/bash -g sshgroup kelly
RUN echo 'kelly:ilovepuppies' | chpasswd
USER root
RUN /etc/passwd /etc/shadow > kelly1

RUN useradd -ms /bin/bash -g sshgroup molly
RUN echo 'molly:oceanbreeze235' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup kian
RUN echo 'kian:notapassword' | chpasswd

#here I go into the user0 account and make the WORKDIR /home/user0. When they ssh as this user, their home directory will be the WORKDIR.
USER hackingwithme1
WORKDIR /home/hackingwithme1/
COPY ./user0/ /home/hackingwithme1/

#chmod 700 so only that user can access their home directory
RUN chmod 700 /home/hackingwithme1


USER root

# SSH login fix. Otherwise user is kicked off after login
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/usr/sbin/sshd", "-D"]
