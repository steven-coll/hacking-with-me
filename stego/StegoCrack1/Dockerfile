FROM debian:stretch-20170907

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils \
                       pngtools \
                       pngcheck \
                       stegosuite \
                       crunch \
                       cewl \
                       steghide \

COPY photos /home

ENTRYPOINT /bin/bash
