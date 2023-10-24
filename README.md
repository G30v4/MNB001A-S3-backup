# DATA BACKUP
Practical example for managing backups with rsync and crons

## Structure
> * Postgres Service
> * Backup server

## Resource
* [x] Dockerfiles Database
* [x] Database scripts
* [x] Dockerfiles Backup server
* [x] Docker-compose file
* [x] Deploy file

## Instructions
> - Create **ssh key** in the specified directory for this case or is create by deploy.sh
```
> ssh-keygen -t ed25519 -f ./postgres/ssh_key -C "test"
```

> - Execute **deploy.sh**
```
> deploy.sh
```

> - Access the **database-srv container**

```
> ssh root@backup-srv
> /home/scripts/generate_data.sh
```

> To review inserted data, access other terminal the **database-srv container**

```
> /home/scripts/view_data.sh
```