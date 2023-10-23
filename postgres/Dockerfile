FROM postgres:latest

# install dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-client cron rsync && \
    rm -rf /var/lib/apt/lists/*

# copy ssh key
COPY ./ssh_key /root/.ssh/id_ed25519
RUN chmod 600 /root/.ssh/id_ed25519
#COPY ./ssh_key.pub /root/.ssh/id_ed25519.pub

# create some folders
RUN mkdir -p /home/scripts /home/logs

# Add crontab excution config
RUN (crontab -l 2>/dev/null; echo "*/1 * * * * /home/scripts/backup_compress.sh >> /home/logs/backup_compress.log 2>&1") | crontab -
