#!/bin/bash

# infinite bucle to review data
while true
do
  psql -U tester sample_db -c "SELECT COUNT(*) FROM  mytable;"
  sleep 2
done