FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"



RUN apt-get update && \
        apt install -y software-properties-common && \
        add -repository ppa:deadsnakes/ppa && \
        apt update -y  && \
        apt install -y build-essential python3.6 python3.6-dev python3-pip && \
        apt install steghide \
        apt install -y git  && \
        # update pip
        python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel \
        pip3 install stegcracker \
        python3.6 -m pip install stegcracker
    
RUN mkdir /photos
COPY ./photos /photos

RUN ["/bin/bash", "-c", "echo hello all in one string"]
