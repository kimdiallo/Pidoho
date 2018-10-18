#!/bin/bash

# run pigpiod 
./usr/bin/pigpiod
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start pigpiod: $status"
  exit $status
fi

# run homebridge 
homebridge 
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start homebridge: $status"
  exit $status
fi

# Check once a minute if pigpiod or homebridge are exited and exit 
# the container with an error if they. 

while sleep 60; do
  ps aux |grep pigpiod |grep -q -v grep
  PG_STAT=$?
  ps aux |grep my_second_process |grep -q -v grep
  HB_STAT=$?
  if [ $PG_STAT -ne 0 -o $HB_STAT -ne 0 ]; then
    echo "Somethinh went wrong in here!"
    exit 1
  fi
done
