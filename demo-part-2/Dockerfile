FROM ubuntu:focal

LABEL maintainer="Barry Weiss <barweiss@cisco.com>"

LABEL version="1.2"

LABEL description="Container to be used with barewiss45/Ansible-IOSXE-Always-On-Demo repo"

ENV DEBIAN_FRONTEND noninteractive

ENV LANG C.UTF-8

ENV LC_ALL C.UTF-8

ENV PYENV_ROOT /root/.pyenv

ENV PATH /root/.pyenv/bin:/root/.pyenv/shims:$PATH

RUN apt-get update; apt-get install -y git make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

WORKDIR /root/

COPY requirements.txt .

COPY container_install_python_req_repo.sh .

RUN bash container_install_python_req_repo.sh

ENTRYPOINT ["bash"]
