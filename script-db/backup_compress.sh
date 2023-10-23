#!/bin/bash

# Vars
TIMESTAMP=$(date +%Y%m%d%H%M%S)
BACKUP_DIR="/backup/backup_$TIMESTAMP"
mkdir -p $BACKUP_DIR
SQL_DUMP_FILE="$BACKUP_DIR/mytable_dump.sql"
COMPRESSED_FILE="$BACKUP_DIR/mytable_backup.tar.gz"


# Full or Partial backup - specific table
pg_dump -U tester -t mytable sample_db > "$SQL_DUMP_FILE"

#Backup Diferencial
pg_dump -U tester -d sample_db -F c -f $BACKUP_DIR/backup_completo.dump
pg_dump -U usuario -d basedatos -F c --section=data -f $BACKUP_DIR/backup_diferencial_$(date +\%Y\%m\%d).dump


# Compress Backuo
tar -czf "$COMPRESSED_FILE" -C "$BACKUP_DIR" .

# Copy backup data to backuo server
rsync -av --progress "$BACKUP_DIR" backup-srv:/backup/

# Clean temporal files
rm -r "$BACKUP_DIR"
