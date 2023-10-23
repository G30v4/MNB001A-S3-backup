FROM ubuntu:latest

# install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server cron rsync && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd
RUN mkdir -p /root/.ssh/
RUN touch /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys

# copy ssh config and script to init ssh
COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 22

# execute ssh
CMD ["/entrypoint.sh"]
