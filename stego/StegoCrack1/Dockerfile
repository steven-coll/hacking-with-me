FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y \
    steghide \
    stegcracker 
    

RUN mkdir /photos
COPY ./photos /photos

ENTRYPOINT ["/bin/bash"]
