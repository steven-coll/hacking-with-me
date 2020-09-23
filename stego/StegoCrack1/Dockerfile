FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y build-essential \
    checkinstall \
    libreadline-gplv2-dev \
    libncursesw5-dev \
    libssl-dev \
    libsqlite3-dev \
    tk-dev \
    libgdbm-dev \
    libc6-dev \
    libbz2-dev \
    zlib1g-dev \
    openssl \
    libffi-dev \
    python3-dev \
    python3-setuptools \
    wget
RUN mkdir /tmp/Python37
RUN cd /tmp/Python37

RUN wget https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tar.xz 
RUN tar xvf Python-3.7.0.tar.xz 
RUN cd /tmp/Python37/Python-3.7.0 
RUN ./configure 
RUN sudo make altinstall

RUN apt install -y \
    steghide \
    stegcracker 
    

RUN mkdir /photos
COPY ./photos /photos

ENTRYPOINT ["/bin/bash"]
