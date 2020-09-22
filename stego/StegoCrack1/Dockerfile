FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt-get update && \
        apt-get install -y software-properties-common && \
        add-apt-repository ppa:deadsnakes/ppa && \
        apt-get update -y  && \
        apt-get install -y build-essential python3.6 python3.6-dev python3-pip && \
        apt-get install -y git  && \
        apt-get install steghide
        apt-get install 
        # update pip
        python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel \
        pip3 install stegcracker \
        python3.6 -m pip install stegcracker
    
RUN mkdir /photos
COPY ./photos /photos

RUN ["/bin/bash", "-c", "echo hello all in one string"]
