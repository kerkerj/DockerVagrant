#!/bin/bash

didInstall() {
  if hash $1 2>/dev/null; then
    return 0
  else
    return 1
  fi
}

# install docker
if ! didInstall docker ; then 
  sudo apt-get update && sudo apt-get install docker.io
fi

# install fig
if ! didInstall fig ; then 
  curl -L https://github.com/docker/fig/releases/download/1.0.1/fig-`uname -s`-`uname -m` > ./fig
  sudo mv ./fig /usr/local/bin/fig
  sudo chmod +x /usr/local/bin/fig
fi

# install my images
cd ./dockerfiles

# base ubuntu
sudo docker build -t kerkerj:ubuntu ./Ubuntu/ 
# or sudo docker pull kerkerj/ubuntu:14.04

# nginx 
sudo docker build -t kerkerj:nginx ./Nginx/ 

# nodejs
sudo docker build -t kerkerj:nodejs ./Nodejs/

# mongodb
sudo docker build -t mongodb ./mongodb/