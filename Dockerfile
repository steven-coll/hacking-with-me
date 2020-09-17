FROM ubuntu:16.04

MAINTAINER Steven Coll "stevenrobertcoll@gmail.com"

RUN apt update

RUN apt install -y \
    apache2 \
    php \
    libapache2-mod-php
 
RUN dnf install -y sudo && \
    adduser user && \
    echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user && \
    chmod 0440 /etc/sudoers.d/user

RUN su - user -c "touch mine"

CMD ["su", "-", "user", "-c", "/bin/bash"]

ENTRYPOINT service apache2 start && /bin/bash
