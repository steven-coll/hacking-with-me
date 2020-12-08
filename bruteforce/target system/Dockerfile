FROM kalilinux/kali-rolling:latest

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

#this is so the docker image builds without having to input any information, like when I download python in the file it wants me to input information. This skips it.
ENV DEBIAN_FRONTEND noninteractive

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
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup jimmy
RUN echo 'jimmy:u2fan7575' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup blair
RUN echo 'blair:bobMarley4evr' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup james
RUN echo 'james:imfortyseven' | chpasswd


USER root

# SSH login fix. Otherwise user is kicked off after login
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/usr/sbin/sshd", "-D"]
