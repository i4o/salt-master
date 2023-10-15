FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive 

RUN  apt-get update && apt-get upgrade -y && apt-get install -y curl python3-dev python3-setuptools python3-pip 
RUN curl -fsSL -o /etc/apt/keyrings/salt-archive-keyring-2023.gpg https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/SALT-PROJECT-GPG-PUBKEY-2023.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/salt-archive-keyring-2023.gpg arch=amd64] https://repo.saltproject.io/salt/py3/ubuntu/22.04/amd64/latest jammy main" >> /etc/apt/sources.list.d/salt.list && \
  apt update && apt install -y salt-master salt-ssh salt-syndic salt-cloud salt-api && rm -rf /var/lib/apt/lists/*

EXPOSE 4505 4506 

ENTRYPOINT ["/usr/bin/salt-master"]

