#this is the base ubuntu image I am using, the rest of the things in this file build off this
FROM debian:stable-slim

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

#this is so the docker image builds without having to input any information, like when I download python in the file it wants me to input information. This skips it.
ENV DEBIAN_FRONTEND noninteractive

RUN apt update

#this is for part of the ssh installation, so ssh will work
RUN apt-get update -y && apt-get install -y \
    software-properties-common    
    
RUN apt install -y \
    openssh-server \
    unzip \
    grep 

RUN mkdir /var/run/sshd 

    
VOLUME /root /var/lib/postgresql

#here I am creating a group called "sshgroup" and then I create a user "user 0" which is added to the group
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup user0
# username= user, password= password
RUN echo 'user0:password' | chpasswd

RUN groupadd sshgroup1 && useradd -ms /bin/bash -g sshgroup1 user1
# username= user1, password= password
RUN echo 'user1:E8K3mU91H2' | chpasswd

RUN groupadd sshgroup2 && useradd -ms /bin/bash -g sshgroup2 user2
# username= user, password= password
RUN echo 'user2:sIvov657xw' | chpasswd

RUN groupadd sshgroup3 && useradd -ms /bin/bash -g sshgroup3 user3
# username= user, password= password
RUN echo 'user3:2gmAU9RAUq' | chpasswd

RUN groupadd sshgroup4 && useradd -ms /bin/bash -g sshgroup4 user4
# username= user, password= password
RUN echo 'user4:04car90268' | chpasswd

RUN groupadd sshgroup5 && useradd -ms /bin/bash -g sshgroup5 user5
# username= user, password= password
RUN echo 'user5:NcSlkqKk2V' | chpasswd

RUN groupadd sshgroup6 && useradd -ms /bin/bash -g sshgroup6 user6
# username= user, password= password
RUN echo 'user6:AOndY1BmKz' | chpasswd

RUN groupadd sshgroup7 && useradd -ms /bin/bash -g sshgroup7 user7
# username= user, password= password
RUN echo 'user7:6lPEBEJjDk' | chpasswd

RUN groupadd sshgroup8 && useradd -ms /bin/bash -g sshgroup8 user8
# username= user, password= password
RUN echo 'user8:CDtOGH8SZ2QsuIii9SBr' | chpasswd

#here I go into the user0 account and make the WORKDIR /home/user0. When they ssh as this user, their home directory will be the WORKDIR.
USER user0
WORKDIR /home/user0/
RUN mkdir /home/user0/passwordfolder
COPY ./user0/password0.txt /home/user0/passwordfolder
RUN chmod 700 /home/user0

USER user1
WORKDIR /home/user1/
COPY ./user1/password1.zip /home/user1/
RUN chmod 700 /home/user1

USER user2
WORKDIR /home/user2/
COPY ./user2/.password2.txt /home/user2/
RUN chmod 700 /home/user2

USER user3
WORKDIR /home/user3/
COPY ./user3/password3.txt /home/user3/
RUN chmod 700 /home/user3

USER user4
WORKDIR /home/user4/
COPY ./user4/original.txt /home/user4/
COPY ./user4/flaginhere.txt /home/user4/
RUN chmod 700 /home/user4

USER user5
WORKDIR /home/user5/
COPY ./user5/- /home/user5/
RUN chmod 700 /home/user5

USER user6
WORKDIR /home/user6/
COPY ./user6/flag.txt /home/user6/.bash_history
RUN chmod 700 /home/user6

USER user7
WORKDIR /home/user7/
COPY ./user7/password7.txt /home/user7
RUN chmod 700 /home/user7

USER user8
WORKDIR /home/user8/

COPY ./user8/exit.sh /etc
RUN chmod 700 /home/user8
USER root
RUN chmod +x /etc/exit.sh
RUN echo "source /etc/exit.sh" >> /home/user8/.bashrc

COPY ./etc/motd /etc/updated-motd.d
RUN chmod +x /etc/updated-motd.d
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd


# SSH login fix. Otherwise user is kicked off after login
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Setup SSH
EXPOSE 22
# Start SSH Deamon in "not detach" mode. Once SSH connction breaks the container stops
CMD ["/usr/sbin/sshd", "-D"]
