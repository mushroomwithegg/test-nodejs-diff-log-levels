#!/bin/sh
if [ -d "/mnt/secrets-store/" ]; then
  ## Remove if there's existing .env file
  if [ -f ".env" ]; then
    rm .env
  fi

  ## Generate initial .env file
  touch .env

  ## Generate .env secrets
  for i in /mnt/secrets-store/*
  do
    KEY=$(echo $i | awk -F/ '{print $NF}' | sed 's/-/_/g')
    VALUE=$(cat $i)
    echo $KEY=$VALUE >> .env
  done
fi

node server.js