FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y \
    steghide \
    john
    
RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv && \
        apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade && \
        python3.6 -m pip install wheel && \
        python3.6 -m pip3 install stegcracker

RUN mkdir /photos
COPY ./photos /photos

RUN ["/bin/bash", "-c", "echo hello all in one string"]
