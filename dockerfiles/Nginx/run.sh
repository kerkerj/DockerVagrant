#!/bin/bash

sudo docker images

printf "\n"

read -p "Choose image name to run Nginx: " image
printf "\n"
printf "Running: sudo docker run -it $image \n"

sudo docker run -it -p 80:80 -d $image 
