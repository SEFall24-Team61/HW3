#!/bin/bash

PID=$(pgrep -f infinite.sh)

if [ "$PID" = "" ]; then
  echo "No infinite.sh processing running."
else
  kill $PID
  echo "infinite.sh has been killed."
fi
