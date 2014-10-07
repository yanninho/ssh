FROM ubuntu:14.04 

MAINTAINER	Yannick Saint Martino 

# install SSH server so we can connect multiple times to the container
RUN apt-get update && apt-get -y install openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:toor' |chpasswd
RUN groupadd yanninho && useradd yanninho -s /bin/bash -m -g yanninho -G yanninho && adduser yanninho sudo
RUN echo 'yanninho:yanninho' |chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir -p /home/yanninho/workspace


EXPOSE 22
CMD    /usr/sbin/sshd -D

