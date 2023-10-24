#!/bin/bash
mkdir -p backup

# Create ssh automatically
ssh-keygen -t ed25519 -f ./postgres/ssh_key2 -C "test" -q -N ""

# buuld docker services
docker compose -f docker-compose-backup.yml up -d --build --force-recreate

# start cron service
docker compose -f docker-compose-backup.yml exec -it database-srv service cron start
docker compose -f docker-compose-backup.yml exec -it database-srv service cron status

# copy ssh key
docker exec -i mnb001a-s3-backup-backup-srv-1 bash -c "cat > /root/.ssh/authorized_keys" < postgres/ssh_key.pub
# docker compose -f docker-compose-backup.yml exec -i backup-srv /bin/bash -c "cat > /root/.ssh/authorized_keys" < postgres/ssh_key.pub
docker compose -f docker-compose-backup.yml exec backup-srv cat /root/.ssh/authorized_keys


## COMMANDS TO EXECUTE MANUALLY
# # docker compose -f docker-compose-backup.yml exec -it database-srv /bin/bash ssh root@backup-srv
# 
# > docker compose -f docker-compose-backup.yml exec -it database-srv bash
# > ssh root@backup-srv
# > /home/scripts/generate_data.sh
# > /home/scripts/view_data.sh
#
# # docker compose -f docker-compose-backup.yml exec -it database-srv /bin/bash /home/scripts/generate_data.sh

