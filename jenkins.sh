#!/bin/bash

docker pull jenkins/jenkins:alpine

docker-compose build

# Make sure that docker runs with the current UID to avoid permission problems on volume docker/volumes/jenkins-home
CURRENT_UID="$(id -u):$(id -g)"
export CURRENT_UID
echo Running docker compose with user ID $CURRENT_UID
docker-compose up
