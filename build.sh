#!/bin/bash
cd ./dockerfiles

# base ubuntu
sudo docker build -t kerkerj:ubuntu ./Ubuntu/ 
# or sudo docker pull kerkerj/ubuntu:14.04

# nginx 
sudo docker build -t kerkerj:nginx ./Nginx/ 

# nodejs
sudo docker build -t kerkerj:nodejs ./Nodejs/


