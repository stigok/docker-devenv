FROM ubuntu:latest
MAINTAINER sshow@stigok.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get update && apt-get install -y -q --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    git \
    libssl-dev \
    python \
    rsync \
    software-properties-common \
    wget \
    vim \
    sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Replace sh with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Setup user
RUN useradd -m -U sshow
RUN gpasswd -a sshow sudo
RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/666_nopasswd

USER sshow
ENV HOME /home/sshow

# Install NVM
ENV NVM_DIR "$HOME/.nvm"
ENV NODE_VERSION "6.7.0"

# Install nvm with node and npm
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules:$PATH
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN mkdir -p $HOME/repos
WORKDIR $HOME/repos

# Add bash aliases
COPY .bash_aliases $HOME/

RUN echo "echo -e \"\nYou are fucking awesome\n\"" >> ~/.bashrc
