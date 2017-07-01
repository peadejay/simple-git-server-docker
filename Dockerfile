FROM alpine:3.6

MAINTAINER Paul Johnston <peadejay@gmail.com>

# Install packages
RUN apk update \ 
	&& apk add --no-cache openssh git bash

# Set SUID bit to allow user to change passwords etc
RUN chmod 4755 /bin/busybox

# Generate host keys
RUN ssh-keygen -A

# Add git user
RUN adduser -D -s /bin/bash -h /repos git \
  && echo git:changeme | chpasswd

# Add the mkrepo command
COPY mkrepo /bin/mkrepo
RUN chmod 755 /bin/mkrepo

# Copy various files
COPY sshd_config /etc/ssh/sshd_config
COPY login_text /etc/motd
COPY bashrc /repos/.bashrc
COPY bash_profile /repos/.bash_profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
