#!/bin/bash

sudo docker images

printf "\n"

read -p "Choose image name to run Nginx: " image
printf "\n"
printf "Running: sudo docker run -it $image \n"

printf "1. sudo docker run -it -p 80:80 -d $image \n"
printf "2. sudo docker run -it -p 80:80 -p 3000:3000 -d --link nodejsapp:nodejsapp -v /var/log/nginx:/var/log/nginx -v /home/ubuntu/DockerVagrant/dockerfiles/Nginx/conf.d/:/etc/nginx/conf.d $image \n\n"

read -p "Choose an action: " number

case $number in 

1)
sudo docker run -it -p 80:80 -d $image 
;;

2)
sudo docker run -it -p 80:80 -p 3000:3000 -d --link nodejsapp:nodejsapp -v /var/log/nginx:/var/log/nginx -v /home/ubuntu/DockerVagrant/dockerfiles/Nginx/conf.d/:/etc/nginx/conf.d $image
;;

*)
printf "Wrong ans"
;;

esac

