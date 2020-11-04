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
    && apt-get install -y unzip \
    && apt-get install -y grep \
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

RUN useradd -ms /bin/bash -g sshgroup user1
# username= user1, password= password
RUN echo 'user1:E8K3mU91H2' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user2
# username= user, password= password
RUN echo 'user2:sIvov657xw' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user3
# username= user, password= password
RUN echo 'user3:2gmAU9RAUq' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user4
# username= user, password= password
RUN echo 'user4:04car90268' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user5
# username= user, password= password
RUN echo 'user5:NcSlkqKk2V' | chpasswd

RUN useradd -ms /bin/bash -g sshgroup user6
# username= user, password= password
RUN echo 'user6:AOndY1BmKz' | chpasswd

#here I go into the user0 account and make the WORKDIR /home/user0. When they ssh as this user, their home directory will be the WORKDIR.
USER user0
WORKDIR /home/user0/
RUN mkdir /home/user0/passwordfolder
COPY ./user0/password0.txt /home/user0/passwordfolder

USER user1
WORKDIR /home/user1/
COPY ./user1/password1.zip /home/user1/

USER user2
WORKDIR /home/user2/
COPY ./user2/.password2.txt /home/user2/

USER user3
WORKDIR /home/user3/
COPY ./user3/password3.txt /home/user3/

USER user4
WORKDIR /home/user4/
COPY ./user4/original.txt /home/user4/
COPY ./user4/flaginhere.txt /home/user4/

USER user5
WORKDIR /home/user5/
COPY ./user5/- /home/user5/

USER root

COPY ./etc/motd /etc/motd

# SSH login fix. Otherwise user is kicked off after login
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/usr/sbin/sshd", "-D"]
