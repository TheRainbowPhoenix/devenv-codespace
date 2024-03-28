FROM ghcr.io/classpaddev/cpdockercross:latest

ENV OLD_SDK_DIR /opt/cross/hollyhock-2/sdk
ENV USERNAME="dev"

# Setting up old SDK

WORKDIR /opt/cross/
RUN git clone -b before-optims https://github.com/SnailMath/hollyhock-2.git
WORKDIR /opt/cross/hollyhock-2/sdk
RUN sed -i 's/-m4-nofpu/-m4a-nofpu/g' Makefile
RUN make -j$(nproc)


USER root

RUN apt-get -qq update && apt-get -qqy install make libmpc3 sudo git vim nano && apt-get -qqy clean

# Fixing some files
COPY setup.sh /tmp

RUN useradd -rm -d /home/$USERNAME -s /bin/bash -g root -G sudo -u 1001 -p "$(openssl passwd -1 ${USERNAME})" $USERNAME
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
# RUN echo ${USERNAME}:${USERNAME} | chpasswd
USER $USERNAME
WORKDIR /home/$USERNAME
RUN echo "export SDK_DIR=${SDK_DIR}" >> ~/.bashrc
RUN echo "export OLD_SDK_DIR=${OLD_SDK_DIR}" >> ~/.bashrc
# RUN cd /tmp && /tmp/setup.sh && rm -rf /tmp/setup.sh

# USER gitpod