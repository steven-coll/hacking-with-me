FROM ubuntu:18.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y \
    steghide \
    john
    
RUN python3 -m pip install --user stegcracker    

RUN mkdir /photos
COPY ./photos /photos

ENTRYPOINT ["/bin/bash"]
