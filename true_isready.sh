#!/usr/bin/env bash
if [[ $(pgrep -f docker-entrypoint-initdb.d) == "" ]]
then
  exit 0
else
  exit 1
fi