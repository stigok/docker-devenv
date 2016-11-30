FROM ubuntu:latest
MAINTAINER sshow@stigok.com

# Build arguments
ARG NVM_VERSION=0.32.1
ARG NODE_VERSION=6.9.1
ARG USERNAME="sshow"
ENV HOME /home/$USERNAME
ENV NVM_DIR $HOME/.nvm

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
    netcat \
    net-tools \
    iputils-ping \
    iproute2

# Replace sh with bash
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Setup user
RUN useradd --create-home --user-group --groups sudo $USERNAME
RUN echo "%sudo ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/666_nopasswd

# Install Node Version Manager (nvm)
USER $USERNAME
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules:$PATH
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
RUN echo "[ -s \"$NVM_DIR/nvm.sh\" ] && . \"$NVM_DIR/nvm.sh\" # This loads nvm" >> $HOME/.bashrc

# Create default folder hierarchy
RUN mkdir -p $HOME/repos
WORKDIR $HOME/repos

# Customize the installation
COPY .bash_aliases $HOME/
RUN echo "echo -e \"\nYou are fucking awesome\n\"" >> $HOME/.bashrc
