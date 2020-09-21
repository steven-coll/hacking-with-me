FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    git \
    openssl \
		gpg \
		steghide

COPY photos /photos

SHELL ["/bin/bash", "-c"]
