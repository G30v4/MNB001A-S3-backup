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
> - Execute **deploy.sh**
> - Access the **database-srv container**

```
> ssh root@backup-srv
> /home/scripts/generate_data.sh
```

> To review inserted data, access other terminal the **database-srv container**

```
> /home/scripts/view_data.sh
```