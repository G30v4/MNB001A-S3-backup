#!/bin/bash

# Create table if this not exist
psql -U tester sample_db -c "CREATE TABLE IF NOT EXISTS mytable (id serial PRIMARY KEY, data varchar(255));"

# sleep to insetr
sleep 5

# infinite blucle to insert data
while true
do
  psql -U tester sample_db -c "INSERT INTO mytable (data) VALUES ('$RANDOM');"
  # sleep 2
done