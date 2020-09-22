FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y \
    steghide \
    software-properties-common
 
RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt install -y \
    build-essential python3.6 python3.6-dev python3-pip && \
        git  && \
        # update pip
        python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel \
        pip3 install stegcracker \
        python3.6 -m pip install stegcracker

RUN mkdir /photos
COPY ./photos /photos

RUN ["/bin/bash"]
